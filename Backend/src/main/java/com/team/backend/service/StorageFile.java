package com.team.backend.service;


public interface StorageFile {

	String getId();

	String getBucketName();

	String getObjectName();

	String getContentType();

	String getFileName();

	String getPath();

	Long getSize();

	String getMd5();

}
