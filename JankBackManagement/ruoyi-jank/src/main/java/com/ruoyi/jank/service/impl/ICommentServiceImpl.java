package com.ruoyi.jank.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.ruoyi.common.utils.StringUtils;
import com.ruoyi.common.utils.bean.BeanUtils;
import com.ruoyi.jank.domain.Comment;
import com.ruoyi.jank.domain.Post;
import com.ruoyi.jank.domain.dto.CommentDto;
import com.ruoyi.jank.domain.vo.CommentUserVO;
import com.ruoyi.jank.mapper.CommentMapper;
import com.ruoyi.jank.service.ICommentService;
import com.ruoyi.jank.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * author: wuyinai
 * date: 2025/6/24
 */
@Service
public class ICommentServiceImpl extends ServiceImpl<CommentMapper, Comment> implements ICommentService {
    @Autowired
    private CommentMapper commentMapper;

    @Autowired
    private IPostService postService;
    @Override
    //查询评论列表
    public List<CommentDto> selectCommentList(Comment comment) {
        //实例化集合
        List<CommentDto> CommentDtoList=new ArrayList<>();
        LambdaQueryWrapper<Comment> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.like(StringUtils.isNotEmpty(comment.getContent()),Comment::getContent,comment.getContent());
        List<Comment> CommentList=list(lambdaQueryWrapper);
        CommentList.forEach(c->{
            CommentDto CommentDto=new CommentDto();
            BeanUtils.copyProperties(c,CommentDto);
            CommentDtoList.add(CommentDto);
        });
        return CommentDtoList;
    }

    @Override
    public List<CommentUserVO> selectCommentWithUserAndPost() {
        LambdaQueryWrapper<Comment> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Comment::getDeleted,0);
        List<Comment> commentList=list(lambdaQueryWrapper);
        List<CommentUserVO> commentUserVOList =new ArrayList<>();
        for (Comment comment : commentList) {
            CommentUserVO commentUserVO=new CommentUserVO();
            commentUserVO.setContent(comment.getContent());
            Post post = postService.getById(comment.getPostId());
            commentUserVO.setTitle(post.getTitle());
            commentUserVO.setCreateTime(comment.getCreateTime());
            commentUserVO.setUsername(comment.getUsername());
            commentUserVO.setGoodorbad(comment.getGoodorbad());
            commentUserVOList.add(commentUserVO);
        }
        return commentUserVOList;
    }

    @Override
    public List<Comment> getCommentByPostId(String postId) {
        LambdaQueryWrapper<Comment> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Comment::getPostId,postId);
        return list(lambdaQueryWrapper);
    }

    @Override
    public List<Comment> getCommentByUserId(String userId) {
        LambdaQueryWrapper<Comment> lambdaQueryWrapper=new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Comment::getUserId,userId);
        return list(lambdaQueryWrapper);
    }
}
