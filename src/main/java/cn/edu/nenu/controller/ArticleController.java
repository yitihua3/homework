package cn.edu.nenu.controller;

import cn.edu.nenu.domain.*;

import cn.edu.nenu.service.ArticleService;
import cn.edu.nenu.service.CategoryService;
import cn.edu.nenu.service.CommentService;
import cn.edu.nenu.service.UserService;
import cn.edu.nenu.util.HttpServlet;
import cn.edu.nenu.util.Md5SaltTool;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.security.NoSuchAlgorithmException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import net.sf.json.JSONArray;

/**
 * Created by wangh on 2019/6/23.
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    public ArticleService articleService;
    @Autowired
    public CategoryService categoryService;

    @Autowired
    public CommentService commentService;

    @Autowired
    public UserService userService;

    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");


    /**
     * 我的文章列表
     * @param model
     * @return
     */
    @RequestMapping(value = "mylist", method = RequestMethod.GET)
    public String articleList(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        List<Article> articleList = articleService.findArticleByUserId(user.getId());
        model.addAttribute("articleList",articleList);
        return "article/myArticleList";
    }




//    @RequestMapping(value = "/manage",method = RequestMethod.GET)
//    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
//                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, HttpServletRequest request){
//        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
//        Page<User> users = userService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
//        User user = (User) request.getSession().getAttribute("user");
//        model.addAttribute("user",user);
//        model.addAttribute("users", users);
//        model.addAttribute("sortType", sortType);
//        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
//        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
//        return "user/manage_user";
//    }



    @RequestMapping(value = "check/{id}", method = RequestMethod.GET)
    public String checkArticle(@PathVariable("id") Long id,Model model, HttpSession session){
        Article article = articleService.findOne(id);
        List<Comment> commentList = commentService.getCommentList(id);
        model.addAttribute("article",article);
        model.addAttribute("commentList",commentList);
        return "article/checkArticle";
    }



    /**
     * 跳转到添加文章页面
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String toAddArticle(Model model){
        List<Category> subCategoryList = categoryService.getAllSubCategoryDirectly();
        model.addAttribute("SubCategoryList",subCategoryList);
        return "article/addArticle";
    }


    /**
     * 添加文章,包含附件上传
     * @param entity
     * @param model
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addArticle(Article entity,@RequestParam(value = "categoryId", defaultValue = "1") Long categoryId,@RequestParam(value = "file",defaultValue = "")CommonsMultipartFile file, HttpServletRequest request,Model model,HttpSession session,RedirectAttributes redirectAttributes) throws IOException {
        Category category = categoryService.findOne(categoryId);
        User user = (User)session.getAttribute("user");
        entity.setCategory(category);
        entity.setUser(user);
        //DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        entity.setCreateTime(dtf.format(LocalDateTime.now()));
        entity.setLastEditTime(dtf.format(LocalDateTime.now()));

        String name =file.getOriginalFilename();
        if(name!=""){
            String postfix = name.substring(name.lastIndexOf("."), name.length()); //获取文件后缀
            String root = request.getServletContext().getRealPath("/upload/attachment");//上传文件的路径
            File f = new File(root);
            if (!f.exists()) {
                f.mkdirs();
            }

            String x = UUID.randomUUID().toString() + postfix; //随机串防重名
            String filename = root + "\\" + x;


            FileOutputStream fos = new FileOutputStream(filename);
            InputStream in = file.getInputStream();
            int b = 0;
            while((b = in.read())!=-1) {
                fos.write(b);
            }
            fos.close();
            in.close();
            //修改数据库
            String attachment = "../../../upload/attachment/"+x;
            entity.setAttachment(attachment);
        }

        articleService.save(entity);
        redirectAttributes.addFlashAttribute("msg","发布成功！");
        return "redirect:/article/mylist";
    }



    /**
     * 跳转到修改文章页面
     * @param pkId
     * @param model
     * @return
     */
    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String toUpdateArticle(@PathVariable("id") Long pkId, Model model){
        Article article = articleService.findOne(pkId);
        List<Category> subCategoryList = categoryService.getAllSubCategoryDirectly();
        model.addAttribute("subCategoryList",subCategoryList);
        model.addAttribute("article",article);
        return "article/editArticle";
    }

    /**
     * 修改文章
     * @param article
     * @param response
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public void toUpdateArticle(Article article ,@RequestParam(value = "categoryId", defaultValue = "1") Long categoryId,@RequestParam(value = "file",defaultValue = "")CommonsMultipartFile file,HttpServletRequest request,HttpServletResponse response) throws IOException {
        Long pkId = article.getId();
        Article article1 = articleService.findOne(pkId);
        article1.setTitle(article.getTitle());
        article1.setContent(article.getContent());
        //DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        article1.setLastEditTime(dtf.format(LocalDateTime.now()));
        article1.setCategory(categoryService.findOne(categoryId));

        String name =file.getOriginalFilename();
        if(name!=""){
            String postfix = name.substring(name.lastIndexOf("."), name.length()); //获取文件后缀
            String root = request.getServletContext().getRealPath("/upload/attachment");//上传文件的路径
            File f = new File(root);
            if (!f.exists()) {
                f.mkdirs();
            }

            String x = UUID.randomUUID().toString() + postfix; //随机串防重名
            String filename = root + "\\" + x;


            FileOutputStream fos = new FileOutputStream(filename);
            InputStream in = file.getInputStream();
            int b = 0;
            while((b = in.read())!=-1) {
                fos.write(b);
            }
            fos.close();
            in.close();
            //修改数据库
            String attachment = "../../../upload/attachment/"+x;
            article1.setAttachment(attachment);
        }

        articleService.save(article1);
        boolean flag = true;
        String result="{\"res\":"+flag+"}";
        response.setContentType("application/json");
        try {
            response.getWriter().write(String.valueOf(result));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 删除文章
     * @param pkId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String deleteArticle(@PathVariable("id") Long pkId,RedirectAttributes redirectAttributes){
        String msg = "删除成功";
        try{
            articleService.remove(pkId);
        }catch(Exception e){
            msg = "删除失败";
        }
        redirectAttributes.addFlashAttribute("msg",msg);
        return "redirect:/article/mylist";
    }

    /**
     * 添加评论
     * @param content
     * @param userId
     * @param articleId
     * @param response
     * @throws IOException
     */
    @RequestMapping(value = "addComment", method = RequestMethod.POST)
    public void addComment(@RequestParam(value = "content")String content,@RequestParam(value = "userId")Long userId,@RequestParam(value = "articleId")Long articleId,HttpServletResponse response) throws IOException {

        User user = userService.findUser(userId);
        Article article = articleService.findOne(articleId);
        Comment comment = new Comment();
        comment.setUser(user);
        comment.setArticle(article);
        comment.setContent(content);
        comment.setTime(dtf.format(LocalDateTime.now()));
        commentService.save(comment);

        List<Comment> commentList = commentService.getCommentList(articleId);

        String json = JSONArray.fromObject(commentList).toString();
        response.getWriter().println(json);
    }
}
