package cn.edu.nenu.service;

import cn.edu.nenu.domain.Praise;
import cn.edu.nenu.repository.ArticleRepository;
import cn.edu.nenu.repository.PraiseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by wangh on 2019/6/30.
 */
@Service
public class PraiseService {

    @Autowired
    private PraiseRepository praiseRepository;

    @Autowired
    private ArticleRepository articleRepository;

    /**
     * 增加点赞记录,并使对应文章的赞数+1
     * @param praise
     * @return
     */
    public void saveAndIncrease(Praise praise){
        praiseRepository.save(praise);
        articleRepository.increasePraise(praise.getArticle().getId());
    }

    /**
     * 删除点赞记录，并使对应文章的赞数-1
     * @param praise
     * @return
     */
    public void deleteAndDecrease(Praise praise){
        praiseRepository.delete(praise);
        articleRepository.decreasePraise(praise.getArticle().getId());
    }

    public Praise findPraise(Long articleId,Long userId){
        return praiseRepository.findPraise(articleId,userId);
    }

}
