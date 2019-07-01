package cn.edu.nenu.service;

import cn.edu.nenu.config.orm.jpa.DynamicSpecifications;
import cn.edu.nenu.domain.Article;
import cn.edu.nenu.repository.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * Created by wangh on 2019/6/23.
 */
@Service
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    public List<Article> findArticleByUserId(Long pkId){
        return articleRepository.getMyArticle(pkId);
    }

    /**
     * 根据id查找文章
     * @param pkId
     * @return
     */
    public Article findOne(Long pkId){
        return articleRepository.findOne(pkId);
    }

    /**
     * 增加、修改一个文章实体（save有两个功能，增加和修改）
     * @param entity
     * @return
     */
    public Article save(Article entity){
        return articleRepository.save(entity);
    }

    /**
     * 根据id删除文章
     * @param pkId
     */
    public void remove(Long pkId){
        articleRepository.delete(pkId);
    }


    /**
     * 获取所有文章
     * @return
     */
    public List<Article> getAllArticle() {
        return (List<Article>) articleRepository.findAll();
    }



    /**
     * 根据查询条件获取分页结果数据
     * @param filterParams
     * @param pageNumber
     * @param pageSize
     * @param sortType
     * @return
     */
    public Page<Article> getEntityPage(Map<String, Object> filterParams, int pageNumber, int pageSize, String sortType){
        PageRequest pageRequest = buildPageRequest(pageNumber, pageSize, sortType);
        Specification<Article> spec = buildSpecification(filterParams);
        return articleRepository.findAll(spec,pageRequest);
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
            sort = new Sort(Sort.Direction.ASC, "createTime");
        } else if ("sort".equals(sortType)) {
            sort = new Sort(Sort.Direction.ASC, "createTime");
        }
        return new PageRequest(pageNumber - 1, pageSize, sort);
    }


    /**
     * 创建动态查询条件组合
     * @param filterParams
     * @return
     */
    private Specification<Article> buildSpecification(Map<String, Object> filterParams) {

        Map<String, cn.edu.nenu.config.orm.jpa.SearchFilter> filters = cn.edu.nenu.config.orm.jpa.SearchFilter.parse(filterParams);

        Specification<Article> spec = DynamicSpecifications.bySearchFilter(filters.values(), Article.class);

        return spec;
    }


}
