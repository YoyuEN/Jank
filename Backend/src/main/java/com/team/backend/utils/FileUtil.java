package com.team.backend.utils;

import org.apache.tika.Tika;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;

public class FileUtil {

	private static final String DEFAULT_MIME = "application/octet-stream";
    private static final Tika tika = new Tika();

	public static String detectMimeType(File file) throws IOException {
		return detectMimeType(file.getPath());
	}
    /**
     * 判断MimeType
     * @param path
     * @return
     * @throws IOException
     */
    public static String detectMimeType(String path) throws IOException {
        Path p = Path.of(path);
        String mime = tika.detect(p.toFile());
        if (!DEFAULT_MIME.equals(mime)) {
            return mime;
        }
        mime = Files.probeContentType(p);
        if (mime != null) {
            return mime;
        }
        return tika.detect(p.getFileName().toString());
    }

}
