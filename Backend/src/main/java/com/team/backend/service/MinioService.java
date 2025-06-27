package com.team.backend.service;


import org.springframework.web.multipart.MultipartFile;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/26
 * @Time: 22:01
 * @Description:
 */
public interface MinioService {
    String  uploadFile(MultipartFile file, String folder) throws Exception;
}
