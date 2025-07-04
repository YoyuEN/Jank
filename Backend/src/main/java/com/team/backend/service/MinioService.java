package com.team.backend.service;


import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/26
 * @Time: 22:01
 * @Description:
 */
public interface MinioService {
    String  uploadFile(MultipartFile file) throws Exception;

    // 上传多个文件
    List<String> uploadFile(List<MultipartFile> file, String folder);
    String getPresignedUrl(String objectName);
}
