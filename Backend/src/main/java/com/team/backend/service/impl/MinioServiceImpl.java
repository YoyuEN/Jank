package com.team.backend.service.impl;

import com.team.backend.service.MinioService;
import io.minio.*;
import io.minio.errors.MinioException;
import io.minio.http.Method;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;


@Slf4j
@Service
public class MinioServiceImpl implements MinioService {
    private final MinioClient minioClient;

    @Value("${minio.endpoint}")
    private String minioEndpoint;

    @Value("${minio.bucket-name}")
    private String bucketName;

    public MinioServiceImpl(MinioClient minioClient) {
        this.minioClient = minioClient;
    }


    /*
     * 上传文件到 MinIO
     *
     * @param file 上传的文件
     * @param objectName 存储在 MinIO 中的对象名称
     * @throws Exception 如果上传失败
     */
    @Override
    public String uploadFile(MultipartFile file, String folder) throws Exception {
        String objectName = file.getOriginalFilename();

        try (InputStream inputStream = file.getInputStream()) {
            // 检查存储桶是否存在
            if (!minioClient.bucketExists(BucketExistsArgs.builder().bucket(bucketName).build())) {
                minioClient.makeBucket(MakeBucketArgs.builder().bucket(bucketName).build());
            }

            // 上传文件
            minioClient.putObject(
                    PutObjectArgs.builder()
                            .bucket(bucketName)
                            .object(objectName)
                            .stream(inputStream, file.getSize(), -1)
                            .contentType(file.getContentType())
                            .build()
            );
            minioEndpoint = minioEndpoint.replace("5", "0");

            // 返回文件访问 URL
            return objectName;
        } catch (Exception e) {
            throw new RuntimeException("文件上传失败: " + e.getMessage(), e);
        }
    }

    @Override
    public List<String> uploadFile(List<MultipartFile> files, String folder) {
        List<String> objectNames = new ArrayList<>();
        for (MultipartFile multipartFile : files) {
            try {
                String objectName = uploadFile(multipartFile, folder);
                objectNames.add(objectName);
                minioClient.putObject(
                        PutObjectArgs.builder()
                                .bucket(bucketName)
                                .object(objectName)
                                .stream(multipartFile.getInputStream(), multipartFile.getSize(), -1)
                                .contentType(multipartFile.getContentType())
                                .build()
                );
                minioEndpoint = minioEndpoint.replace("5", "0");
            } catch (Exception e) {
                log.error("上传文件失败", e);
            }
        }
        return objectNames;
    }

    /*
    * 上传多个文件
    * */



    /**
     * 获取 MinIO 文件的预签名访问 URL
     *
     * @param objectName 文件对象名称
     * @return 可访问的 URL 地址
     */
    @Override
    public String getPresignedUrl(String objectName) {
        try {
            return minioClient.getPresignedObjectUrl(
                    GetPresignedObjectUrlArgs.builder()
                            .method(Method.GET)
                            .bucket(bucketName)
                            .object(objectName)
                            .build()
            );
        } catch (Exception e) {
            throw new RuntimeException("获取预签名URL失败: " + e.getMessage(), e);
        }
    }

}
