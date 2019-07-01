package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Comment;
import cn.edu.nenu.domain.Praise;
import org.springframework.data.jpa.repository.Query;

/**
 * Created by wangh on 2019/6/30.
 */
public interface PraiseRepository extends PlatformRepository<Praise,Long> {
    /**
     * 查找某条点赞记录
     * @param articleId
     * @param userId
     * @return
     */
    @Query("select p From Praise p where p.article.id = ?1 and p.user.id = ?2")
    Praise findPraise(Long articleId,Long userId);
}
