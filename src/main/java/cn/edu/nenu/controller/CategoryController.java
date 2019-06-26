package cn.edu.nenu.controller;

import cn.edu.nenu.domain.Category;
import cn.edu.nenu.service.CategoryService;
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

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * ssh
 * Created by chenf on 2019/6/16.
 * 文章所属类型controller
 */
@Controller
@RequestMapping("/Category")
public class CategoryController {
    private static final int PAGE_SIZE = 5;
  @Autowired
    public CategoryService CategoryService;

    @RequestMapping("")
    public String list(Model model){
        model.addAttribute("name", "chenf");
        System.out.println("indexController.class");
        return "index";
    }

    /**
     *列出所有类型
     * @param model
     * @return
     */
    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String CategoryList(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                               @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request){
        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<Category> CategoryList =  CategoryService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
//        List<Category> CategoryList = CategoryService.getAllCategory();
        model.addAttribute("CategoryList",CategoryList);
        return "Category/CategoryList";
    }

    /**
     * 跳转到增加页面
     * @return
     */
    @RequestMapping(value = "toadd", method = RequestMethod.GET)
    public String toAddCategory(){
        return "Category/addCategory";
    }

    /**
     * 增加文章类型
     * @param category
     * @param model
     * @return
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addCategory(Category category,Model model){
        float sort = CategoryService.getMaxSort();
        category.setSort(sort+1);
        CategoryService.save(category);
        return "redirect:/Category/list";
    }

    /**
     * 跳转到修改页面
     * @param pkId
     * @param model
     * @return
     */
    @RequestMapping(value = "toupdate/{id}", method = RequestMethod.GET)
    public String toUpdateCategory(@PathVariable("id") Long pkId, Model model){
        Category Category = CategoryService.findOne(pkId);
        model.addAttribute("Category", Category);
        return "Category/editCategory";
    }

    /**
     * 修改
     * @param Category
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String UpdateCategory(Category Category ,RedirectAttributes redirectAttributes){
        Long pkId = Category.getId();
        Category Category1 = CategoryService.findOne(pkId);
        Category1.setTypename(Category.getTypename());
        Category1.setParents_id(Category.getParents_id());
        Category1.setSort(Category.getSort());
        CategoryService.save(Category1);
        redirectAttributes.addAttribute("msg","修改成功！");
        return "redirect:/Category/list";
    }

    /**
     * 跳转到修改页面
     * @param pkId
     * @param model
     * @return
     */
    @RequestMapping(value = "updateSubCategory/{id}", method = RequestMethod.GET)
    public String toupdateSubCategory(@PathVariable("id") Long pkId, Model model){
        Category Category = CategoryService.findOne(pkId);
        model.addAttribute("Category", Category);
        return "Category/editCategory";
    }

    /**
     * 修改
     * @param Category
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "updateSubCategory", method = RequestMethod.POST)
    public String toUpdateCategory(Category Category ,RedirectAttributes redirectAttributes){
        Long pkId = Category.getId();
        Category Category1 = CategoryService.findOne(pkId);
        Category1.setTypename(Category.getTypename());
        Category1.setParents_id(Category.getParents_id());
        CategoryService.save(Category1);
        redirectAttributes.addAttribute("msg","修改成功！");
        return "redirect:/Category/list";
    }

    /**
     * 删除大类
     * 删除大类时，对应大类下面的子类也删除
     * @param pkId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String deleteCategory(@PathVariable("id") Long pkId,RedirectAttributes redirectAttributes){


        String msg = "删除成功";
        try{
            CategoryService.delete(pkId);
        }catch(Exception e){
            msg = "删除失败";
        }
        redirectAttributes.addAttribute("msg",msg);
        return "redirect:/Category/list";
    }

    /**
     * 删除子类
     * @param pkId
     * @param redirectAttributes
     * @return
     */
    @RequestMapping(value = "subCategoryDelete/{id}", method = RequestMethod.GET)
    public String deletesubCategory(@PathVariable("id") Long pkId,Model model,RedirectAttributes redirectAttributes){
        Category category = CategoryService.findOne(pkId);
        String msg = "删除成功";
        try{
            CategoryService.remove(pkId);
        }catch(Exception e){
            msg = "删除失败";
        }

        redirectAttributes.addAttribute("msg",msg);
        Long id=category.getParents_id();
        return "redirect:/Category/todetail/"+id;
    }

    /**
     * 查看子类
     * @param pkId
     * @param model
     * @return
     */
    @RequestMapping(value = "todetail/{id}", method = RequestMethod.GET)
    public String toDetail(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                               @RequestParam(value = "page", defaultValue = "1") int pageNumber,@PathVariable("id") Long pkId, Model model, ServletRequest request){
        Map<String, Object> searchParams = HttpServlet.getParametersStartingWith(request, "s_");
        Page<Category> CategoryList =  CategoryService.getEntityPage(searchParams, pageNumber, PAGE_SIZE, sortType);
        model.addAttribute("sortType", sortType);
        model.addAttribute("PAGE_SIZE", PAGE_SIZE);
        model.addAttribute("searchParams", HttpServlet.encodeParameterStringWithPrefix(searchParams, "s_"));
//        List<Category> CategoryList = CategoryService.getAllCategory();
        model.addAttribute("CategoryList",CategoryList);
        model.addAttribute("id", pkId);
        System.out.println("22222"+CategoryList);
        return "Category/detailCategory";
    }
    /**
     * 跳转到增加子类
     * @param pkId
     * @param model
     * @return
     */
    @RequestMapping(value = "subCategoryAdd/{id}", method = RequestMethod.GET)
    public String subCategoryAdd(@PathVariable("id") Long pkId, Model model){
       model.addAttribute("id",pkId);
        return "Category/addSubCategory";
    }


    /**
     * 增加子类后跳转到对应大类下的列表
     * @param category
     * @return
     */
    @RequestMapping(value = "addSubCategory", method = RequestMethod.POST)
    public String addSubCategory(Category category){
        float sort = CategoryService.getMaxSort();
        category.setSort(sort+1);
        Category Category = CategoryService.save(category);
        Long id=Category.getParents_id();
        return "redirect:/Category/todetail/"+id;
    }

}
