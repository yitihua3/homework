package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Article;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * Created by wangh on 2019/6/23.
 */
public interface ArticleRepository extends PlatformRepository<Article,Long> {

    @Query("select a From  Article a where a.user.id = ?1")
    List<Article> getMyArticle(Long pkId);

    List<Article> findAllById(Long pkId);
}
