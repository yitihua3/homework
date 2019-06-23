package cn.edu.nenu.service;

import cn.edu.nenu.domain.Article;
import cn.edu.nenu.domain.Dict;
import cn.edu.nenu.repository.ArticleRepository;
import cn.edu.nenu.repository.DictRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wangh on 2019/6/23.
 */
@Service
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

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




}
