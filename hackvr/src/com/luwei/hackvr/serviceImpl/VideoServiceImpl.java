package com.luwei.hackvr.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luwei.hackvr.mapper.VideoMapper;
import com.luwei.hackvr.pojo.Article;
import com.luwei.hackvr.pojo.Toutiao;
import com.luwei.hackvr.pojo.Video;
import com.luwei.hackvr.pojo.VideoExample;
import com.luwei.hackvr.service.ToutiaoService;
import com.luwei.hackvr.service.VideoService;
import com.luwei.hackvr.utils.VideoTypeTrans;

@Service("videoService")
public class VideoServiceImpl implements VideoService {
    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private ToutiaoService toutiaoService;

    @Override
    public List<Video> getLateVideos(int index, int num) {
        VideoExample example = new VideoExample();
        example.setOrderByClause("create_time desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        RowBounds rowBounds = new RowBounds(index, num);
        List<Video> videos = videoMapper.selectByExampleWithRowbounds(example, rowBounds);
        
        if (CollectionUtils.isEmpty(videos)) {
            return null;
        }
        
        return videos;
    }

    @Override
    public Video getVideoById(int id) {
        Video video = videoMapper.selectByPrimaryKey(id);
        
        return video;
    }
    
    @Override
    public List<Video> getLateVideos(int index, int num, int type) {
        List<Integer> typeList = VideoTypeTrans.displayToStore(type);
        
        VideoExample example = new VideoExample();
        example.setOrderByClause("create_time desc");
        example.createCriteria().andFlagEqualTo((byte)1).andTypeIn(typeList);
        RowBounds rowBounds = new RowBounds(index, num);
        List<Video> videos = videoMapper.selectByExampleWithRowbounds(example, rowBounds);
        
        if (CollectionUtils.isEmpty(videos)) {
            return null;
        }
        
        return videos;
    }
    
    
    
    @Override
    public List<List<Map<String, Object>>> getShipinToutiaoVideos(int num) {
        num = num/2*2;
        List<Toutiao> toutiaos = toutiaoService.getShipinToutiaos(num);
        
        if (CollectionUtils.isEmpty(toutiaos)) {
            return null;
        }
        
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for (Toutiao toutiao : toutiaos) {
            Map<String, Object> map = new HashMap<String, Object>();
            Video video = videoMapper.selectByPrimaryKey(toutiao.getArticleId());
            map.put("videoId", video.getVideoId());
            map.put("title", video.getTitle());
            map.put("preinfo", video.getPreinfo());
            map.put("preimage", toutiao.getImgUrl());
            map.put("videoUrl", video.getVideoUrl());
            map.put("videoLength", video.getVideoLength());
            map.put("videoClarity", video.getVideoClarity());
            map.put("clickNum", video.getClickNum());
            map.put("type", video.getType());
            
            retList.add(map);
        }

        List<List<Map<String, Object>>> resList = new ArrayList<List<Map<String,Object>>>();
        for (int i = 0; i < retList.size(); i += 2) {
            resList.add(retList.subList(i, i+2));
        }
        
        return resList;
    }
    
    @Override
    public List<List<Map<String, Object>>> getLateVideos(int num) {
        VideoExample example = new VideoExample();
        example.setOrderByClause("create_time desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        
        num = num/2*2;
        RowBounds rowBounds = new RowBounds(0, num);
        List<Video> videos = videoMapper.selectByExampleWithRowbounds(example, rowBounds);
        
        if (CollectionUtils.isEmpty(videos)) {
            return null;
        }
        
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for (Video video : videos) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("videoId", video.getVideoId());
            map.put("title", video.getTitle());
            map.put("preinfo", video.getPreinfo());
            map.put("preimage", video.getPreimage());
            map.put("videoUrl", video.getVideoUrl());
            map.put("videoLength", video.getVideoLength());
            map.put("videoClarity", video.getVideoClarity());
            map.put("type", video.getType());
            
            retList.add(map);
        }
        
        List<List<Map<String, Object>>> resList = new ArrayList<List<Map<String,Object>>>();
        for (int i = 0; i < retList.size(); i += 2) {
            resList.add(retList.subList(i, i+2));
        }

        return resList;
    }
    
    @Override
    public List<Video> getRemenVideos(int index, int num) {
        VideoExample example = new VideoExample();
        example.setOrderByClause("click_num desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        
        RowBounds rowBounds = new RowBounds(0, num);
        List<Video> videos = videoMapper.selectByExampleWithRowbounds(example, rowBounds);
        
        if (CollectionUtils.isEmpty(videos)) {
            return null;
        }
        return videos;
    }
    
    @Override
    public List<List<Map<String, Object>>> getRemenShipinVideos(int num) {
        VideoExample example = new VideoExample();
        example.setOrderByClause("click_num desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        
        num = num/2*2;
        RowBounds rowBounds = new RowBounds(0, num);
        List<Video> videos = videoMapper.selectByExampleWithRowbounds(example, rowBounds);
        
        if (CollectionUtils.isEmpty(videos)) {
            return null;
        }
        
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for (Video video : videos) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("videoId", video.getVideoId());
            map.put("title", video.getTitle());
            map.put("preinfo", video.getPreinfo());
            map.put("preimage", video.getPreimage());
            map.put("videoUrl", video.getVideoUrl());
            map.put("videoLength", video.getVideoLength());
            map.put("videoClarity", video.getVideoClarity());
            map.put("type", video.getType());
            
            retList.add(map);
        }
        
        List<List<Map<String, Object>>> resList = new ArrayList<List<Map<String,Object>>>();
        for (int i = 0; i < retList.size(); i += 2) {
            resList.add(retList.subList(i, i+2));
        }

        return resList;
    }
}
