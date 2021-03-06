package com.luwei.hackvr.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
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

import com.luwei.hackvr.pojo.Article;
import com.luwei.hackvr.pojo.Game;
import com.luwei.hackvr.service.ArticleService;
import com.luwei.hackvr.service.DisplayDeviceService;
import com.luwei.hackvr.service.GameService;
import com.luwei.hackvr.service.GameTypeService;
import com.luwei.hackvr.utils.CheckMobile;
import com.luwei.hackvr.utils.ConstantUtils;

@Controller
@RequestMapping("/game")
public class GameController {
    private static Logger logger = Logger.getLogger(GameController.class);

    @Autowired
    private ArticleService articleService;
    
    @Autowired
    private GameService gameService;
    
    @Autowired
    private GameTypeService gameTypeService;
    
    @Autowired
    private DisplayDeviceService displayDeviceService;
    
    @RequestMapping("")
    public String game (
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            if (check(request, response)) {
                Map<String, Object> gameMap = gameService.getLateGames(0, 5);
                @SuppressWarnings("unchecked")
                List<Game> lateGames = (List<Game>) gameMap.get("dataList");

                request.setAttribute("games", lateGames);
                request.setAttribute("gametypeList", ConstantUtils.gameTypeStore);
                request.setAttribute("youxiMap", ConstantUtils.youxiMap);
                request.setAttribute("displayDeviceList", ConstantUtils.deviceTypeStore);
                request.setAttribute("deviceMap", ConstantUtils.deviceMap);
                return "jsp/mobile/gameclass_wap";
            } else {
//              TODO 可能换成资讯和游戏交叉出现
                List<Map<String, Object>> toutiaoGames = gameService.getToutiaoGames(3);
                List<Article> lateArticles = articleService.getLateArticles(0, 7, (byte)3);
                
//                TODO 暂时用排行代替推介，不进行人工选择
//                List<Map<String, Object>> pcTuijieList = gameService.getTuijieGames(5, "pc");
//                List<Map<String, Object>> iosTuijieList = gameService.getTuijieGames(5, "ios");
//                List<Map<String, Object>> androidTuijieList = gameService.getTuijieGames(5, "android");
                List<Game> pcTuijieList = (List<Game>) gameService.getPaihangGamesBySystem(0, 5, "pc");
                List<Game> iosTuijieList = (List<Game>) gameService.getPaihangGamesBySystem(0, 5, "ios");
                List<Game> androidTuijieList = (List<Game>) gameService.getPaihangGamesBySystem(0, 5, "android");
                
                Map<String, Object> gameMap = gameService.getLateGames(0, 12);
                int amount = (int) gameMap.get("amount");
                @SuppressWarnings("unchecked")
                List<Game> lateGames = (List<Game>) gameMap.get("dataList");
                List<Game> pcPaihangGames = (List<Game>) gameService.getPaihangGamesBySystem(0, 10, "pc");
                List<Game> iosPaihangGames = (List<Game>) gameService.getPaihangGamesBySystem(0, 10, "ios");
                List<Game> androidPaihangGames = (List<Game>) gameService.getPaihangGamesBySystem(0, 10, "android");
                
                request.setAttribute("toutiaoGames", toutiaoGames);
                request.setAttribute("lateArticles", lateArticles);
                request.setAttribute("pcTuijieList", pcTuijieList);
                request.setAttribute("iosTuijieList", iosTuijieList);
                request.setAttribute("androidTuijieList", androidTuijieList);
                request.setAttribute("amount", amount);
                request.setAttribute("lateGames", lateGames);
                request.setAttribute("pcPaihangGames", pcPaihangGames);
                request.setAttribute("iosPaihangGames", iosPaihangGames);
                request.setAttribute("androidPaihangGames", androidPaihangGames);
                request.setAttribute("zixunType", ConstantUtils.zixunType);
                request.setAttribute("gametypeList", ConstantUtils.gameTypeStore);
                request.setAttribute("youxiMap", ConstantUtils.youxiMap);
                request.setAttribute("displayDeviceList", ConstantUtils.deviceTypeStore);
                request.setAttribute("deviceMap", ConstantUtils.deviceMap);
                
                return "jsp/game";
            }
        } catch (Exception e) {
            logger.error("游戏频道页面加载异常", e);
            model.addAttribute("errorMessage", "游戏频道页面加载异常");
            return "error";
        }
    }
    
//    类型见ConstantUtils.gameType
    @RequestMapping(value = "/{type}")
    public String gametype (
            @PathVariable("type") String typeRequest,
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            if (check(request, response)) {
                return "redirect:game/";
            } else {
                List<String> systemList = Arrays.asList(ConstantUtils.systemType);
                List<String> deviceList = Arrays.asList(ConstantUtils.deviceType);
                List<String> typeList = Arrays.asList(ConstantUtils.gameType);
                Map<String, Object> gameMap = new HashMap<String, Object>();
                int typesort = 0;
                int systemsort = 0;
                int devicesort = 0;
                if (systemList.contains(typeRequest) || typeRequest.equals("systemothers")) {
                    for (int i = 1; i < systemList.size(); i++) {
                        if (systemList.get(i).equals(typeRequest))
                            systemsort = i;
                    }
                    gameMap = gameService.getLateGames(0, 16, "全部", typeRequest, "全部");
                } else if (deviceList.contains(typeRequest) || typeRequest.equals("deviceothers")) {
                    for (int i = 1; i < deviceList.size(); i++) {
                        if (deviceList.get(i).equals(typeRequest))
                            devicesort = i;
                    }
                    typeRequest = ConstantUtils.deviceMapRe.get(typeRequest);
                    gameMap = gameService.getLateGames(0, 16, "全部", "all", typeRequest);
                } else if (typeList.contains(typeRequest) || typeRequest.equals("typeothers")) {
                    for (int i = 1; i < typeList.size(); i++) {
                        System.out.println(typeList.get(i)+' '+typeRequest);
                        if (typeList.get(i).equals(typeRequest))
                            typesort = i;
                    }
                    typeRequest = ConstantUtils.youxiMapRe.get(typeRequest);
                    gameMap = gameService.getLateGames(0, 16, typeRequest, "all", "全部");
                } else {
                    return "notfound";
                }
                @SuppressWarnings("unchecked")
                List<Game> games = (List<Game>) gameMap.get("dataList");
                int amount = (int) gameMap.get("amount");

                request.setAttribute("amount", amount);
                request.setAttribute("games", games);
                request.setAttribute("typesort", typesort);
                request.setAttribute("systemsort", systemsort);
                request.setAttribute("devicesort", devicesort);
                request.setAttribute("gametypeList", ConstantUtils.gameTypeStore);
                request.setAttribute("youxiMap", ConstantUtils.youxiMap);
                request.setAttribute("displayDeviceList", ConstantUtils.deviceTypeStore);
                request.setAttribute("deviceMap", ConstantUtils.deviceMap);
                
                return "jsp/gameclass";
            }
        } catch (Exception e) {
            logger.error("游戏分类页面加载异常", e);
            model.addAttribute("errorMessage", "游戏分类页面加载异常");
            return "error";
        }
    }

//  类型见ConstantUtils.gameType
    @RequestMapping(value="/{type}/{gameId}.html")
    public String gamedownload (
            @PathVariable("type") String typeRequest,
            @PathVariable("gameId") int gameId,
            HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
        try {
            if (check(request, response)) {
                List<String> typeList = Arrays.asList(ConstantUtils.gameType);
                Game game = new Game();
                if (typeList.contains(typeRequest)) {
                    game = gameService.getGameById(gameId);
                    request.setAttribute("game", game);
                    return "jsp/mobile/gamedownload_wap";
                } else {
                    return "notfound";
                }
            } else {
                List<String> typeList = Arrays.asList(ConstantUtils.gameType);
                Game game = new Game();
                List<Game> remenGames = new ArrayList<Game>();
                if (typeList.contains(typeRequest)) {
                    game = gameService.getGameById(gameId);
                    remenGames = gameService.getRemenGamesByType(0, 4, typeRequest);
                    if (remenGames.size() <= 0) {
                        remenGames = gameService.getRemenGames(0, 4);
                    }
                    request.setAttribute("game", game);
                    request.setAttribute("remenGames", remenGames);
                    request.setAttribute("youxiMap", ConstantUtils.youxiMap);
                    
                    return "jsp/gamedownload";
                } else {
                    return "notfound";
                }
            }
        } catch (Exception e) {
            logger.error("游戏下载页面加载异常", e);
            model.addAttribute("errorMessage", "游戏下载页面加载异常");
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
