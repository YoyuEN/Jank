package com.team.backend.controller;

import com.team.backend.service.MinioService;
import com.team.backend.utils.ResponseCode;
import com.team.backend.utils.Result;
import io.minio.MinioClient;
import io.minio.PutObjectArgs;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: YoyuEN
 * @Date: 2025/6/26
 * @Time: 23:11
 * @Description:
 */
@RestController
@Slf4j
@RequestMapping("/minio")
public class MinioController {
    @Autowired
    private MinioClient minioClient;
    @Autowired
    private MinioService minioService;

    @Value("${minio.bucket-name}")
    private String bucketName;

    // 上传图片
    @PostMapping("/upload")
    public Result<Map<String, Object>> upload(@RequestParam(name = "file") MultipartFile[] file) throws Exception {
        if (file == null || file.length == 0) {
            return Result.fail(ResponseCode.USER_NOT_EXIST);
        }
        List<String> orgsFileNameList = new ArrayList<>(file.length);
        for (MultipartFile multipartFile : file) {
            String fileName = multipartFile.getOriginalFilename();
            orgsFileNameList.add(fileName);
            try {
                // 文件上传
                InputStream inputStream = multipartFile.getInputStream();
                minioClient.putObject(PutObjectArgs.builder()
                        .bucket(bucketName)
                        .object(fileName)
                        .stream(inputStream, inputStream.available(), -1)
                        .contentType(multipartFile.getContentType())
                        .build());
                inputStream.close();
            } catch (Exception e) {
                log.error("上传文件失败", e);
                return Result.fail(ResponseCode.UPLOAD_FILE_FAIL);
            }
        }
        Map<String, Object> data = new HashMap<>();
        data.put("bucketName", bucketName);
        data.put("fileName", orgsFileNameList);
        return Result.success(ResponseCode.SUCCESS, data);
    }

    @GetMapping("/url")
    public String getUrl(@RequestParam String objectName) {
        return minioService.getPresignedUrl(objectName);
    }

}
