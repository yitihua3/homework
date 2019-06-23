package cn.edu.nenu.service;

import cn.edu.nenu.config.orm.jpa.SearchFilter;
import cn.edu.nenu.domain.Category;
import cn.edu.nenu.repository.CategoryRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

/**
 * ssh-tutorial
 * Created by TestUser on 2019/6/16.
 */
@Service
public class CategoryService {

    @Autowired
    private CategoryRepository CategoryRepository;

    /**
     * 根据主键查找文章类型实体
     * @param pkId
     * @return
     */
    public Category findOne( Long pkId){
        return CategoryRepository.findOne(pkId);
    }

    /**
     * 保存文章类型实体，增加和修改
     * @param entity
     * @return
     */
    public Category save(Category entity){
        return CategoryRepository.save(entity);
    }

    /**
     * 查找所有文章类型实体
     * @return
     */
    public List<Category> getAllCategory (){
        return (List<Category>) CategoryRepository.getAllCategory();
    }

    /**
     * 根据id删除文章大类
     * @param pkId
     */
    public void remove( Long pkId){
        CategoryRepository.delete(pkId);
    }

    /**
     * 删除大类时删除对应的所有小类
     * @param pkId
     */
    public void delete( Long pkId){
        CategoryRepository.deleteAllCategory(pkId);
    }
    /**
     * 根据父类id找出所有子类
     * @return
     */
    public List<Category> getAllSubCategory(Long pkId){
        return (List<Category>) CategoryRepository.getAllSubCategory(pkId);
    }



}
