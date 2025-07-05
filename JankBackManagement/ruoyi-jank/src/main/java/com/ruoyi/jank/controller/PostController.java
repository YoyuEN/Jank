package com.ruoyi.jank.controller;

import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.core.page.TableDataInfo;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.jank.domain.Post;
import com.ruoyi.jank.domain.vo.PostVO;
import com.ruoyi.jank.service.IPostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.ruoyi.common.annotation.Log;

/**
 * 帖子Controller
 *
 * @author wuyinai
 * @date 2025-06-25
 */
@RestController
@RequestMapping("/postlist/postlist")
public class PostController extends BaseController
{
    @Autowired
    private IPostService postService;

    /**
     * 查询帖子列表
     */
    @PreAuthorize("@ss.hasPermi('postlist:postlist:list')")
    @GetMapping("/list")
    public TableDataInfo list(Post post)
    {
        startPage();
        List<PostVO> list = postService.selectPostList(post);
        return getDataTable(list);
    }

//    /**
//     * 导出帖子列表
//     */
//    @PreAuthorize("@ss.hasPermi('post:post:export')")
//    @Log(title = "帖子", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, Post post)
//    {
//        List<Post> list = postService.selectPostList(post);
//        ExcelUtil<Post> util = new ExcelUtil<Post>(Post.class);
//        util.exportExcel(response, list, "帖子数据");
//    }

    /**
     * 获取帖子详细信息
     */
    @PreAuthorize("@ss.hasPermi('postlist:postlist:query')")
    @GetMapping(value = "/{postId}")
    public AjaxResult getInfo(@PathVariable("postId") String postId)
    {
        return success(postService.getById(postId));
    }

    /**
     * 新增帖子
     */
    @PreAuthorize("@ss.hasPermi('postlist:postlist:add')")
    @Log(title = "帖子", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Post post)
    {
        return toAjax(postService.save(post));
    }

    /**
     * 修改帖子
     */
    @PreAuthorize("@ss.hasPermi('postlist:postlist:edit')")
    @Log(title = "帖子", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Post post)
    {
        return toAjax(postService.updateById(post));
    }

    /**
     * 删除帖子
     */
    @PreAuthorize("@ss.hasPermi('postlist:postlist:remove')")
    @Log(title = "帖子", businessType = BusinessType.DELETE)
    @DeleteMapping("/{postIds}")
    public AjaxResult remove(@PathVariable List<String> postIds)
    {
        return toAjax(postService.removeByPostId(postIds));
    }


    @GetMapping("/hot")
    public AjaxResult hotPost()
    {
        return success(postService.hotPost());
    }
}

