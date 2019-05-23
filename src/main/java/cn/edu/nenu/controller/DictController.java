package cn.edu.nenu.controller;

import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.service.DictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.ServletRequest;
import java.util.List;


/**
 * IndexController Class
 *
 * @author <b>Oxidyc</b>, Copyright &#169; 2003
 * @version 1.0, 2019-03-07 22:44
 */
@Controller
@RequestMapping("/dict")
public class DictController {
    @Autowired
    public DictService dictService;

    @RequestMapping("")
    public String list(Model model){
        model.addAttribute("name", "oxidyc");
        System.out.println("indexController.class");
        return "index";
    }

    @RequestMapping(value = "list", method = RequestMethod.GET)
    public String dictList(Model model){
        List<Dict> dictList = dictService.getAllDict();
        model.addAttribute("dictList",dictList);
        return "dictList";
    }

    @RequestMapping(value = "add", method = RequestMethod.GET)
    public String toAddDict(){
        return "addDict";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    public String addDict(Dict enity,Model model){
        Dict dict = dictService.save(enity);
        return "redirect:/dict/list";
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String toUpdateDict(@PathVariable("id") Long pkId, Model model){
        Dict dict = dictService.findOne(pkId);
        model.addAttribute("dict",dict);
        return "editDict";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String toUpdateDict(Dict dict ,RedirectAttributes redirectAttributes){
        Long pkId = dict.getId();
        System.out.println("hhhhhhhh:"+pkId);
        Dict dict2 = dictService.findOne(pkId);
        dict2.setType(dict.getType());
        dict2.setCode(dict.getCode());
        dict2.setName(dict.getName());
        System.out.println("hhhhhhh:"+dict.getName());
        dictService.save(dict2);
        redirectAttributes.addAttribute("msg","修改成功！");
        return "redirect:/dict/list";
    }

    @RequestMapping(value = "delete/{id}", method = RequestMethod.GET)
    public String addDict(@PathVariable("id") Long pkId,RedirectAttributes redirectAttributes){
        String msg = "删除成功";
        try{
            dictService.remove(pkId);
        }catch(Exception e){
            msg = "删除失败";
        }
        redirectAttributes.addAttribute("msg",msg);
        return "redirect:/dict/list";
    }




}
