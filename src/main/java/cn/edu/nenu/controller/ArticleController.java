package cn.edu.nenu.controller;

import cn.edu.nenu.domain.Article;

import cn.edu.nenu.domain.Category;
import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.domain.User;
import cn.edu.nenu.service.ArticleService;
import cn.edu.nenu.util.HttpServlet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by wangh on 2019/6/23.
 */
@Controller
@RequestMapping("/article")
public class ArticleController {

    @Autowired
    public ArticleService articleService;


    /**
     * 我的文章列表
     * @param model
     * @return
     */
    @RequestMapping(value = "mylist", method = RequestMethod.GET)
    public String articleList(Model model, HttpSession session){
        User user = (User)session.getAttribute("user");
        List<Article> articleList = articleService.findArticleByUserId(user.getId());
        System.out.println("哈哈哈哈哈"+articleList);

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





    /**
     * 跳转到添加文章页面
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String toAddArticle(){
        return "article/addArticle";
    }

    /**
     * 添加文章
     * @param entity
     * @param model
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addArticle(Article entity, Model model){
        entity.setCategory(new Category());
        Article article = articleService.save(entity);
        return "redirect:/article/list";
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
        model.addAttribute("article",article);
        return "article/editArticle";
    }


    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String toUpdateArticle(Article article ,RedirectAttributes redirectAttributes){
        Long pkId = article.getId();
        Article article1 = articleService.findOne(pkId);
        article1.setTitle(article.getTitle());
        article1.setContent(article.getContent());
        //article1.setLastEditTime(new Date().toString());
        articleService.save(article1);
        redirectAttributes.addAttribute("msg","修改成功！");
        return "redirect:/article/list";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String deleteArticle(@PathVariable("id") Long pkId,RedirectAttributes redirectAttributes){
        String msg = "删除成功";
        try{
            articleService.remove(pkId);
        }catch(Exception e){
            msg = "删除失败";
        }
        redirectAttributes.addAttribute("msg",msg);
        return "redirect:/article/list";
    }
}
