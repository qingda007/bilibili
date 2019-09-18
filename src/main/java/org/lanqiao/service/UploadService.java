package org.lanqiao.service;

import org.lanqiao.entity.Video;

import java.util.List;

public interface UploadService {
    int uploadVideo(Video video);
    int modifyVideo(Video video);
    List<Video> selectUploadVideo(int userId);
    int countIsReview(int userId, int isReview);
    List<Video> selectVideoByIsReview(int userId, int isReview);
    int delVideo(int videoId);
    int countByWord(int userId, String word);
    List<Integer> countVideoInfo(int userId);
}
