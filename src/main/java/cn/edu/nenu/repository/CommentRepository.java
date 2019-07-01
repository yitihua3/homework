package cn.edu.nenu.repository;

import cn.edu.nenu.config.orm.PlatformRepository;
import cn.edu.nenu.domain.Article;
import cn.edu.nenu.domain.Comment;
import org.springframework.data.jpa.repository.Query;

import javax.persistence.Column;
import java.util.List;

/**
 * Created by wangh on 2019/6/30.
 */
public interface CommentRepository extends PlatformRepository<Comment,Long> {

    /**
     * 根据articleId获取评论列表，按时间升序
     * @param articleId
     * @return
     */
    @Query("select c From Comment c where c.article.id = ?1 order by c.time ASC")
    List<Comment> getCommentList(Long articleId);
}
