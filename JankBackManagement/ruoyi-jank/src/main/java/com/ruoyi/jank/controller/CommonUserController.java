package com.ruoyi.jank.controller;

import java.util.List;
import javax.servlet.http.HttpServletResponse;

import com.ruoyi.common.utils.StringUtils;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.ruoyi.common.annotation.Log;
import com.ruoyi.common.core.controller.BaseController;
import com.ruoyi.common.core.domain.AjaxResult;
import com.ruoyi.common.enums.BusinessType;
import com.ruoyi.jank.domain.CommonUser;
import com.ruoyi.jank.service.ICommonUserService;
import com.ruoyi.common.utils.poi.ExcelUtil;
import com.ruoyi.common.core.page.TableDataInfo;

/**
 * 用户管理Controller
 *
 * @author wuyinai
 * @date 2025-06-25
 */
@RestController
@RequestMapping("/commonuser/commonuser")
public class CommonUserController extends BaseController
{
    @Autowired
    private ICommonUserService commonUserService;


    @GetMapping("/check-username")
    public AjaxResult checkUsernameExist(@RequestParam String username) {
        if (StringUtils.isBlank(username)) {
            return AjaxResult.error("用户名不能为空");
        }

        boolean exist = commonUserService.isUsernameExist(username);
        if (exist) {
            return AjaxResult.warn("该用户名已存在，请重新输入");
        } else {
            return AjaxResult.success();
        }
    }
    /**
     * 查询用户管理列表
     */
    @PreAuthorize("@ss.hasPermi('commonuser:commonuser:list')")
    @GetMapping("/list")
    public TableDataInfo list(CommonUser commonUser)
    {
        startPage();
        List<CommonUser> list = commonUserService.selectCommonUserList(commonUser);
        return getDataTable(list);
    }

//    /**
//     * 导出用户管理列表
//     */
//    @PreAuthorize("@ss.hasPermi('commonuser:commonuser:export')")
//    @Log(title = "用户管理", businessType = BusinessType.EXPORT)
//    @PostMapping("/export")
//    public void export(HttpServletResponse response, CommonUser commonUser)
//    {
//        List<CommonUser> list = commonUserService.selectCommonUserList(commonUser);
//        ExcelUtil<CommonUser> util = new ExcelUtil<CommonUser>(CommonUser.class);
//        util.exportExcel(response, list, "用户管理数据");
//    }

    /**
     * 获取用户管理详细信息
     */
    @PreAuthorize("@ss.hasPermi('commonuser:commonuser:query')")
    @GetMapping(value = "/{userId}")
    public AjaxResult getInfo(@PathVariable("userId") String userId)
    {
        return success(commonUserService.getById(userId));
    }

    /**
     * 新增用户管理
     */
    @PreAuthorize("@ss.hasPermi('commonuser:commonuser:add')")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody CommonUser commonUser)
    {
        return toAjax(commonUserService.save(commonUser));
    }

    /**
     * 修改用户管理
     */
    @PreAuthorize("@ss.hasPermi('commonuser:commonuser:edit')")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody CommonUser commonUser)
    {
        return toAjax(commonUserService.updateById(commonUser));
    }

    /**
     * 删除用户管理
     */
    @PreAuthorize("@ss.hasPermi('commonuser:commonuser:remove')")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @DeleteMapping("/{userIds}")
    public AjaxResult remove(@PathVariable List<String> userIds)
    {
        return toAjax(commonUserService.removeBatchByIds(userIds));
    }
}

