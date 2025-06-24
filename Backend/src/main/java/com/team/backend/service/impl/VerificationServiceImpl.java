package com.team.backend.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.team.backend.domain.Verification;
import com.team.backend.mapper.VerificationMapper;
import com.team.backend.service.IVerificationService;
import org.springframework.stereotype.Service;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/24
 * @Time: 10:36
 * @Description:
 */
@Service
public class VerificationServiceImpl extends ServiceImpl<VerificationMapper, Verification> implements IVerificationService {
}
