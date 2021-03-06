package com.luwei.hackvr.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.luwei.hackvr.pojo.Video;
import com.luwei.hackvr.service.VideoService;
import com.luwei.hackvr.utils.CheckMobile;
import com.luwei.hackvr.utils.ConstantUtils;
import com.luwei.hackvr.utils.VideoTypeTrans;

@Controller
@RequestMapping("/video")
public class VideoController {
    private static Logger logger = Logger.getLogger(VideoController.class);

    @Autowired
    private VideoService videoService;
    
    @RequestMapping("")
    public String video (
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            if (check(request, response)) {
                List<Video> lateVideos = videoService.getLateVideos(0, 4);
                
                request.setAttribute("lateVideos", lateVideos);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                return "jsp/mobile/videoclass_wap";
            } else {
//              TODO
//              List<List<Map<String, Object>>> shipinToutiaoSet = videoService.getShipinToutiaoVideos(8);
                List<List<Map<String, Object>>> shipinToutiaoSet = videoService.getLateVideos(16);
                List<List<Map<String, Object>>> remenShipinSet = videoService.getRemenShipinVideos(16);
                List<Video> tiyanVideos = videoService.getLateVideos(0, 4, 0);
                List<Video> shishangVideos = videoService.getLateVideos(0, 4, 1);
                List<Video> yuleVideos = videoService.getLateVideos(0, 4, 2);
                List<Video> fengguangVideos = videoService.getLateVideos(0, 4, 3);
                List<Video> kejiVideos = videoService.getLateVideos(0, 4, 4);
                List<Video> shenghuoVideos = videoService.getLateVideos(0, 4, 5);
                List<Video> shehuiVideos = videoService.getLateVideos(0, 4, 6);
                
                request.setAttribute("shipinToutiaoSet", shipinToutiaoSet);
                request.setAttribute("remenShipinSet", remenShipinSet);
                request.setAttribute("tiyanVideos", tiyanVideos);
                request.setAttribute("shishangVideos", shishangVideos);
                request.setAttribute("yuleVideos", yuleVideos);
                request.setAttribute("fengguangVideos", fengguangVideos);
                request.setAttribute("kejiVideos", kejiVideos);
                request.setAttribute("shenghuoVideos", shenghuoVideos);
                request.setAttribute("shehuiVideos", shehuiVideos);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                return "jsp/video";
            }
        } catch (Exception e) {
            logger.error("加载视频页面异常", e);
            model.addAttribute("errorMessage", "加载视频页面异常");
            return "error";
        }
    }
    

//  0： experience； 1： fashion； 2： entertainment； 3： scenery； 4： technology； 5： life； 6： society
    @RequestMapping(value = "/{type}")
    public String videoclass (
            @PathVariable(value = "type") String typeRequest,
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            if (check(request, response)) {
                return "redirect:video/";
            } else {
                int type = -1;
                
                if (typeRequest.equals("experience")) {
                    type = 0;
                } else if (typeRequest.equals("fashion")) {
                    type = 1;
                } else if (typeRequest.equals("entertainment")) {
                    type = 2;
                } else if (typeRequest.equals("scenery")) {
                    type = 3;
                } else if (typeRequest.equals("technology")) {
                    type = 4;
                } else if (typeRequest.equals("life")) {
                    type = 5;
                } else if (typeRequest.equals("society")) {
                    type = 6;
                }
                
                if (type == -1) {
                    return "notfound";
                }
                
                List<Video> videos = videoService.getLateVideos(0, 16, type);
                
                request.setAttribute("type", type);
                request.setAttribute("videos", videos);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                return "jsp/videoclass";
            }

        } catch (Exception e) {
            logger.error("加载视频页面异常", e);
            model.addAttribute("errorMessage", "加载视频页面异常");
            return "error";
        }
    }

//  0： experience； 1： fashion； 2： entertainment； 3： scenery； 4： technology； 5： life； 6： society
    @RequestMapping(value="/{type}/{id}.html")
    public String videoplay (
            @PathVariable(value = "type") String typeRequest, 
            @PathVariable(value = "id") int id,
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            int type = -1;
            
            if (typeRequest.equals("experience")) {
                type = 0;
            } else if (typeRequest.equals("fashion")) {
                type = 1;
            } else if (typeRequest.equals("entertainment")) {
                type = 2;
            } else if (typeRequest.equals("scenery")) {
                type = 3;
            } else if (typeRequest.equals("technology")) {
                type = 4;
            } else if (typeRequest.equals("life")) {
                type = 5;
            } else if (typeRequest.equals("society")) {
                type = 6;
            }
            
            if (type == -1) {
                return "notfound";
            }
            
            if (check(request, response)) {
                Video video = videoService.getVideoById(id);
                
                request.setAttribute("video", video);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                return "jsp/mobile/videoplay_wap";
            } else {
                
                Video video = videoService.getVideoById(id);
                List<Video> videos = videoService.getLateVideos(0, 5, VideoTypeTrans.storeToDisplay(video.getType()));
                
                request.setAttribute("video", video);
                request.setAttribute("videos", videos);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                return "jsp/videoplay";
            }
        } catch (Exception e) {
            logger.error("加载视频页面异常", e);
            model.addAttribute("errorMessage", "加载视频页面异常");
            return "error";
        }
    }
    
    private boolean check(HttpServletRequest request, HttpServletResponse response) throws IOException{  
        boolean isFromMobile=false;  
          
//        HttpSession session= request.getSession();  
       //检查是否已经记录访问方式（移动端或pc端）  
//        if(null==session.getAttribute("ua")){  
            try{  
                //获取ua，用来判断是否为移动端访问  
                String userAgent = request.getHeader( "USER-AGENT" ).toLowerCase();    
                if(null == userAgent){    
                    userAgent = "";    
                }  
                isFromMobile = CheckMobile.check(userAgent);  
                //判断是否为移动端访问  
//                if(isFromMobile){  
////                    System.out.println("移动端访问");  
//                    session.setAttribute("ua","mobile");  
//                } else {  
////                    System.out.println("pc端访问");  
//                    session.setAttribute("ua","pc");  
//                }  
            }catch(Exception e){}  
//        }else{  
//            isFromMobile=session.getAttribute("ua").equals("mobile");  
//        }  
          
        return isFromMobile;  
    }
    
}
