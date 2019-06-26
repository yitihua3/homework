package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Category;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * ssh-tutorial
 * Created by TestUser on 2019/6/16.
 */
public interface CategoryRepository extends PlatformRepository<Category,Long> {

//  List<Category> findAllByOrderBySortAsc();

    /**
     * 根据父类id找出对应的子类
     * @param pkId
     * @return
     */
    @Query("select c From  Category c where c.parents_id = ?1")
    List<Category> getAllSubCategory(Long pkId);

    /**
     * 找出所有的大类
     * @return
     */
    @Query("select c From  Category c where c.parents_id = 0")
    List<Category> getAllCategory();

    /**
     * 删除大类时，对应删除所有子类
     * @param pkId
     */
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query("delete From  Category c where c.parents_id = ?1 or c.id=?1")
    void deleteAllCategory(Long pkId);


    Category findFirstByOrderBySortDesc();

}
