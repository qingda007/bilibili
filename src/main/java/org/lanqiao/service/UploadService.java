package org.lanqiao.service;

import org.lanqiao.entity.Video;

public interface UploadService {
    int uploadVideo(Video video);
    int modifyVideo(Video video);
}
