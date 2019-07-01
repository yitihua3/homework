package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Article;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by wangh on 2019/6/23.
 */
public interface ArticleRepository extends PlatformRepository<Article,Long> {

    /**
     * 根据用户id获取文章
     * @param pkId
     * @return
     */
    @Query("select a From  Article a where a.user.id = ?1 order by a.createTime DESC")
    List<Article> getMyArticle(Long pkId);

    List<Article> findAllById(Long pkId);

    /**
     * 增加点赞数
     * @param articleId
     */
    @Transactional
    @Modifying
    @Query(value = "UPDATE Article a SET a.praise = a.praise + 1 WHERE a.id=?1")
    void increasePraise(Long articleId);

    /**
     * 减少点赞数
     * @param articleId
     */
    @Transactional
    @Modifying
    @Query(value = "UPDATE Article a SET a.praise = a.praise - 1 WHERE a.id=?1")
    void decreasePraise(Long articleId);
}
