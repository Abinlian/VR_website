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
import org.springframework.web.bind.annotation.RequestMapping;

import com.luwei.hackvr.pojo.Article;
import com.luwei.hackvr.pojo.Game;
import com.luwei.hackvr.pojo.Video;
import com.luwei.hackvr.service.ArticleService;
import com.luwei.hackvr.service.GameService;
import com.luwei.hackvr.service.KuaixunService;
import com.luwei.hackvr.service.ToutiaoService;
import com.luwei.hackvr.service.VideoService;
import com.luwei.hackvr.utils.CheckMobile;
import com.luwei.hackvr.utils.ConstantUtils;

@Controller
public class LoadController {
    private static Logger logger = Logger.getLogger(LoadController.class);
    
    @Autowired
    private ArticleService articleService;
    @Autowired
    private KuaixunService kuaixunService;
    @Autowired
    private ToutiaoService toutiaoService;
    @Autowired
    private VideoService videoService;

    @Autowired
    private GameService gameService;
    
    @RequestMapping(value = "/")
    public String load(
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            if (check(request, response)) {
                List<Map<String, Object>> shouyeToutiaos = articleService.getShouyeToutiaoArticles(3);
                List<Article> articles = articleService.getLateArticles(0, 4);
                List<Video> shipinToutiaos = videoService.getLateVideos(0, 3);
                Map<String, Object> gameMap = gameService.getLateGames(0, 3);
                @SuppressWarnings("unchecked")
                List<Game> lateGames = (List<Game>) gameMap.get("dataList");

                request.setAttribute("shouyeToutiaos", shouyeToutiaos);
                request.setAttribute("articles", articles);
                request.setAttribute("shipinToutiaos", shipinToutiaos);
                request.setAttribute("lateGames", lateGames);
                request.setAttribute("zixunType", ConstantUtils.zixunType);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                request.setAttribute("gametypeList", ConstantUtils.gameTypeStore);
                request.setAttribute("youxiMap", ConstantUtils.youxiMap);
                request.setAttribute("displayDeviceList", ConstantUtils.deviceTypeStore);
                request.setAttribute("deviceMap", ConstantUtils.deviceMap);
                return "jsp/mobile/index_wap";
            } else {
                List<Map<String, Object>> shouyeToutiaos = articleService.getShouyeToutiaoArticles(3);
                List<Article> articles = articleService.getLateArticles(0, 5);
                List<Video> shipinToutiaos = videoService.getLateVideos(0, 8);
                Map<String, Object> gameMap = gameService.getLateGames(0, 6);
                @SuppressWarnings("unchecked")
                List<Game> lateGames = (List<Game>) gameMap.get("dataList");
                List<Game> pcPaihangGames = (List<Game>) gameService.getPaihangGamesBySystem(0, 10, "pc");
                List<Game> iosPaihangGames = (List<Game>) gameService.getPaihangGamesBySystem(0, 10, "ios");
                List<Game> androidPaihangGames = (List<Game>) gameService.getPaihangGamesBySystem(0, 10, "android");

                request.setAttribute("shouyeToutiaos", shouyeToutiaos);
                request.setAttribute("articles", articles);
                request.setAttribute("shipinToutiaos", shipinToutiaos);
                request.setAttribute("lateGames", lateGames);
                request.setAttribute("pcPaihangGames", pcPaihangGames);
                request.setAttribute("iosPaihangGames", iosPaihangGames);
                request.setAttribute("androidPaihangGames", androidPaihangGames);
                request.setAttribute("zixunType", ConstantUtils.zixunType);
                request.setAttribute("shipinType", ConstantUtils.shipinType);
                request.setAttribute("gametypeList", ConstantUtils.gameTypeStore);
                request.setAttribute("displayDeviceList", ConstantUtils.deviceTypeStore);
                request.setAttribute("youxiMap", ConstantUtils.youxiMap);
                request.setAttribute("deviceMap", ConstantUtils.deviceMap);
                return "index";
            }
        } catch (Exception e) {
            logger.error("加载主页异常", e);
            model.addAttribute("errorMessage", "加载主页异常");
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
