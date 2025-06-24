package com.ruoyi.jank.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.jank.domain.dto.CategoryDto;
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
import com.ruoyi.jank.domain.Category;
import com.ruoyi.jank.service.ICategoryService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 类目管理Controller
 * 
 * @author yx
 * @date 2025-06-24
 */
@RestController
@RequestMapping("/jank/category")
public class CategoryController extends BaseController
{
    @Autowired
    private ICategoryService categoryService;

    /**
     * 查询类目管理列表
     */
    @PreAuthorize("@ss.hasPermi('jank:category:list')")
    @GetMapping("/list")
    public TableDataInfo list(Category category)
    {
        startPage();
        List<CategoryDto> list = categoryService.selectCategoryList(category);
        return getDataTable(list);
    }

    /**
     * 导出类目管理列表
     */
    @PreAuthorize("@ss.hasPermi('jank:category:export')")
    @Log(title = "类目管理", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, Category category)
    {
        List<CategoryDto> list = categoryService.selectCategoryList(category);
        ExcelUtil<CategoryDto> util = new ExcelUtil<CategoryDto>(CategoryDto.class);
        util.exportExcel(response, list, "类目管理数据");
    }

    /**
     * 获取类目管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('jank:category:query')")
    @GetMapping(value = "/{categoryId}")
    public AjaxResult getInfo(@PathVariable("categoryId") String categoryId)
    {
        return success(categoryService.getById(categoryId));
    }

    /**
     * 新增类目管理
     */
    @PreAuthorize("@ss.hasPermi('jank:category:add')")
    @Log(title = "类目管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody Category category)
    {
        return toAjax(categoryService.save(category));
    }

    /**
     * 修改类目管理
     */
    @PreAuthorize("@ss.hasPermi('jank:category:edit')")
    @Log(title = "类目管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody Category category)
    {
        return toAjax(categoryService.updateById(category));
    }

    /**
     * 删除类目管理
     */
    @PreAuthorize("@ss.hasPermi('jank:category:remove')")
    @Log(title = "类目管理", businessType = BusinessType.DELETE)
	@DeleteMapping("/{categoryIds}")
    public AjaxResult remove(@PathVariable List<String> categoryIds)
    {
        return toAjax(categoryService.removeBatchByIds(categoryIds));
    }
}
