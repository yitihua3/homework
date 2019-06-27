package cn.edu.nenu.controller;

import cn.edu.nenu.domain.User;
import cn.edu.nenu.service.UserService;
import cn.edu.nenu.util.HttpServlet;
import cn.edu.nenu.util.Md5SaltTool;
import com.sun.deploy.net.HttpResponse;
import com.sun.org.apache.regexp.internal.RE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * description:
 * user:芋头
 * date:2019/6/22
 * time:16:55
 */
@Controller
@RequestMapping("/user")
public class UserController {

    private static final int PAGE_SIZE = 6;

    @Autowired
    public UserService userService;

    /**
     *初始页面
     * @return
     */
    @RequestMapping("")
    public String toLogin(){
        return  "user/login";
    }


    /**
     * 个人主页
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/main" ,method = RequestMethod.GET)
    public String main(Model model,HttpServletRequest request){
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        return  "user/main";
    }

    /**
     * 退出
     * @param redirectAttributes
     * @param request
     * @return
     */
    @RequestMapping(value = "/exit" ,method = RequestMethod.GET)
    public String exit(RedirectAttributes redirectAttributes,HttpServletRequest request){
        request.getSession().removeAttribute("user");
        redirectAttributes.addAttribute("msg","退出成功，请重新登录");
        return  "user/login";
    }

    /**
     *登录
     * @param userName
     * @param password
     * @param request
     * @param response
     * @throws IOException
     * @throws NoSuchAlgorithmException
     */
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public void login(@RequestParam("userName")String userName,@RequestParam("password")String password, HttpServletRequest request,HttpServletResponse response) throws IOException, NoSuchAlgorithmException {
        User user1 = userService.findByUserName(userName);
        if(!userName.equals("")&&!password.equals("")){
            if (user1 != null) {
                if (Md5SaltTool.validPassword(password,user1.getPassword())) {
                    request.getSession().setAttribute("user",user1);
                    String result="{\"res\":\"success\",\"msg\":\"/user/main\"}";
                    response.setContentType("application/json");
                    response.getWriter().write(String.valueOf(result));
                } else {
                    String result="{\"res\":\"fail\",\"msg\":\"密码错误!\"}";
                    response.setContentType("application/json");
                    response.getWriter().write(String.valueOf(result));
                }
            } else {
                String result="{\"res\":\"fail\",\"msg\":\"该用户不存在！\"}";
                response.setContentType("application/json");
                response.getWriter().write(String.valueOf(result));
            }
        }
        else{
            String result="{\"res\":\"fail\",\"msg\":\"请输入完整信息！\"}";
            response.setContentType("application/json");
            response.getWriter().write(String.valueOf(result));
        }
    }

    /**
     * 跳转注册
     * @return
     */
    @RequestMapping(value = "/toRegister",method = RequestMethod.GET)
    public String toRegister(){
        return  "user/register";
    }

    /**
     * 注册
     * @param user
     * @param model
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public String register(User user,Model model,RedirectAttributes redirectAttributes){
        if(!user.getUserName().equals("")||!user.getPassword().equals("")){
                try {
                    float sort = userService.getMaxSort();
                    String encryptedPwd= Md5SaltTool.getEncryptedPwd(user.getPassword());
                    user.setSort(sort+1);
                    user.setRole(0);
                    user.setPassword(encryptedPwd);
                    user.setImage("../../../upload/image/moren.png");
                    userService.save(user);
                    redirectAttributes.addAttribute("msg","注册成功");
                    return  "user/login";
                } catch (Exception e) {
                    e.printStackTrace();
                }

            } else {
            redirectAttributes.addAttribute("msg","请输入完整信息！");
            return  "user/register";
        }
        return "user/login";
    }

    /**
     * 验证是否重名
     * @param userName
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/checkName",method = RequestMethod.POST)
    public void checkName(@RequestParam("userName") String userName, HttpServletResponse response) throws IOException{
        String result;
        if(!userName.equals("")){
            if(userService.findByUserName(userName)!=null){
                result="{\"msg\":\"该用户名已存在！\"}";
            }else {
                result="{\"msg\":\"可以注册！\"}";
            }
        }else {
            result="{\"msg\":\"\"}";
        }
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(result));

    }

    /**
     *修改个人信息检查是否重名
     * @param userName
     * @param response
     * @param request
     * @throws IOException
     */
    @RequestMapping(value = "/updateName",method = RequestMethod.POST)
    public void updateName(@RequestParam("userName") String userName, HttpServletResponse response,HttpServletRequest request) throws IOException{
        User user = (User)request.getSession().getAttribute("user");
        String result;
        if(userName.equals(user.getUserName())){
            result="{\"msg\":\"origin\"}";
        }else {
            if(!userName.equals("")){
                if(userService.findByUserName(userName)!=null){
                    result="{\"msg\":\"no\"}";
                }else {
                    result="{\"msg\":\"yes\"}";
                }
            }else {
                result="{\"msg\":\"empty\"}";
            }
        }
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(result));

    }


    /**
     * 更新个人信息
     * @param userName
     * @param request
     * @throws IOException
     */
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    public String update(@RequestParam("userName") String userName, @RequestParam("password")String password,@RequestParam(value = "file",defaultValue = "")CommonsMultipartFile file, HttpServletRequest request,Model model) throws IOException, NoSuchAlgorithmException {
        User user = (User)request.getSession().getAttribute("user");
        String name =file.getOriginalFilename();//获取请求的信息
        if (!password.equals("")){
            String encryptedPwd= Md5SaltTool.getEncryptedPwd(password);
            user.setPassword(encryptedPwd);
        }
        user.setUserName(userName);
        if(name!=""){
            String postfix = name.substring(name.lastIndexOf("."), name.length());
            //获取上传文件的目录
            String root = request.getServletContext().getRealPath("/upload/image");
            String x = UUID.randomUUID().toString() + postfix;
            String filename = root + "\\" + x;
            //上传文件到指定目录，不想上传文件就不调用这个
            FileOutputStream fos = new FileOutputStream(filename);
            //截取
            InputStream in = file.getInputStream();
            int b = 0;
            while((b = in.read())!=-1) {
                //写入
                fos.write(b);
            }
            fos.close();
            in.close();
            //修改数据库
            String image = "../../../upload/image/"+x;
            user.setImage(image);
        }
        userService.save(user);
        request.getSession().setAttribute("user",user);//修改session中的用户信息
        request.setAttribute("msg","修改成功!");
        model.addAttribute("user",user);
        return "user/main";
    }


    /**
     *
     * @param sortType
     * @param pageNumber
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/manage",method = RequestMethod.GET)
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, HttpServletRequest request){
        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<User> users = userService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        User user = (User) request.getSession().getAttribute("user");
        model.addAttribute("user",user);
        model.addAttribute("users", users);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
        return "user/manage_user";
    }


    /**
     *
     * @param id
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "/updateRole",method = RequestMethod.POST)
    private void updateRole(@RequestParam("userId")Long id,HttpServletResponse response) throws IOException {
        User user = userService.findUser(id);
        System.out.println(user);
        boolean flag = false;
        if (user.getRole()==0){
        user.setRole(1);
        System.out.println(user);
        userService.save(user);
        flag = true;
        }else{
            user.setRole(0);
            System.out.println(user);
            userService.save(user);
            flag = true;
        }
        String result="{\"res\":"+flag+"}";
        response.setContentType("application/json");
        response.getWriter().write(String.valueOf(result));

    }


    /**
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public String delete(@PathVariable("id")Long id){
        userService.remove(id);
        return "redirect:/user/manage";
    }
}
