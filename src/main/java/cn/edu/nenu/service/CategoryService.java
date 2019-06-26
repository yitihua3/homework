package cn.edu.nenu.service;

import cn.edu.nenu.config.orm.jpa.DynamicSpecifications;
import cn.edu.nenu.config.orm.jpa.DynamicSpecifications1;
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


    public Page<Category> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Category> spec = buildSpecification(filterParams);
        return CategoryRepository.findAll(spec,pageRequest);
    }


    /**
     *  创建分页请求
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @return
     */
    private PageRequest buildPageRequest(int pageNumber, int pageSize, String sortType) {
        Sort sort = null;
        if ("auto".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        } else if ("sort".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "sort");
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }


    /**
     * 创建动态查询条件组合
     * @param filterParams
     * @return
     */
    private Specification<Category> buildSpecification(Map<String, Object> filterParams) {
        Map<String, cn.edu.nenu.config.orm.jpa.SearchFilter> filters = cn.edu.nenu.config.orm.jpa.SearchFilter.parse(filterParams);
        Specification<Category> spec = DynamicSpecifications.bySearchFilter(filters.values(), Category.class);
        return spec;
    }

    /**
     *
     * @return
     */
    public float getMaxSort() {
        Category category = CategoryRepository.findFirstByOrderBySortDesc();
        if (category==null){
            return 0;
        }else {
            return category.getSort();
        }

    }
}
