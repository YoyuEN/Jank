package com.ruoyi.jank.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.jank.domain.dto.CommentDto;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.jank.domain.Comment;
import com.ruoyi.jank.service.ICommentService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 评论功能Controller
 * 
 * @author yx
 * @date 2025-06-24
 */
@RestController
@RequestMapping("/jank/comment")
public class CommentController extends BaseController
{
    @Autowired
    private ICommentService commentService;

    @GetMapping("/listWithUserAndPost")
    public TableDataInfo listWithUserAndPost(Comment comment) {
        startPage();
        List<Comment> list = commentService.selectCommentWithUserAndPost(comment);
        return getDataTable(list);
    }
    /**
     * 查询评论功能列表
     */
    @PreAuthorize("@ss.hasPermi('jank:comment:list')")
    @GetMapping("/list")
    public TableDataInfo list(Comment comment)
    {
        startPage();
        List<CommentDto> list = commentService.selectCommentList(comment);
        return getDataTable(list);
    }

    /**
     * 导出评论功能列表
     */
    @PreAuthorize("@ss.hasPermi('jank:comment:export')")
    @Log(title = "评论功能", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Comment comment)
    {
        List<CommentDto> list = commentService.selectCommentList(comment);
        ExcelUtil<CommentDto> util = new ExcelUtil<CommentDto>(CommentDto.class);
        util.exportExcel(response, list, "评论功能数据");
    }

    /**
     * 获取评论功能详细信息
     */
    @PreAuthorize("@ss.hasPermi('jank:comment:query')")
    @GetMapping("/{commentId}")
    public AjaxResult getInfo(@PathVariable("commentId") String commentId)
    {
        return success(commentService.getById(commentId));
    }

    /**
     * 新增评论功能
     */
    @PreAuthorize("@ss.hasPermi('jank:comment:add')")
    @Log(title = "评论功能", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Comment comment)
    {
        return toAjax(commentService.save(comment));
    }

    /**
     * 修改评论功能
     */
    @PreAuthorize("@ss.hasPermi('jank:comment:edit')")
    @Log(title = "评论功能", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Comment comment)
    {
        return toAjax(commentService.updateById(comment));
    }

    /**
     * 删除评论功能
     */
    @PreAuthorize("@ss.hasPermi('jank:comment:remove')")
    @Log(title = "评论功能", businessType = BusinessType.DELETE)
	@DeleteMapping("/{commentIds}")
    public AjaxResult remove(@PathVariable List<String> commentIds)
    {
        return toAjax(commentService.removeBatchByIds(commentIds));
    }
}
