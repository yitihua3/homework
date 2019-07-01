package cn.edu.nenu.service;

import cn.edu.nenu.domain.Comment;
import cn.edu.nenu.repository.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by wangh on 2019/6/30.
 */
@Service
public class CommentService {

    @Autowired
    private CommentRepository commentRepository;

    /**
     * 添加评论
     * @param comment
     * @return
     */
    public Comment save(Comment comment){
        return commentRepository.save(comment);
    }

    /**
     * 删除评论
     * @param commentId
     */
    public void delete(Long commentId){
        commentRepository.delete(commentId);
    }

    /**
     * 列出某条新闻的全部评论
     * @param articleId
     * @return
     */
    public List<Comment> getCommentList(Long articleId){
        return commentRepository.getCommentList(articleId);
    }

}
