<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="cn">
<head>
    <base href="<%=path%>/"/>
    <meta charset="UTF-8">
    <title>${game.title }_VR视频_Hi客VR</title>
    <meta name="keywords" content="VR,VR游戏，VR游戏资源，VR游戏下载，VR免费下载，VR游戏分享，VR游戏攻略，VR游戏体验测评，VR游戏大全，VR游戏排行">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" href="./iconfont/iconfont.css">
    <link rel="stylesheet" href="./styles/pc_style.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
    <!-- <link rel="stylesheet" type="text/css" href="./styles/home-header.css"> -->
</head>
<body>
    <!-- header -->
    <div class="z_home">
        <div class="z_fix z_home-header">
            <!-- logo -->
            <h1 class="z_home-logo z_fl">
                <a href="/" title="骇客VR,与你共见未来"></a>
            </h1>
            <!-- menu  width:612:px-->
            <ul class="z_home-menu z_fl">
                <li class="z_fl" id="homePage">
                    <a href="/">
                        首页
                    </a>
                </li>
                <li class="z_fl" id="infoPage">
                    <a href="news/">
                        资讯
                    </a>
                </li>
                <li class="z_fl" id="videoPage">
                    <a href="video/">
                        视频
                    </a>
                </li>
                <li class="z_fl home-ico" id="gamePage">
                    <a href="game/">
                        游戏
                    </a>
                </li>
            </ul>
            <div class="z_search-icon z_fr">
                <i class="iconfont z_icon-color-w" id="search1">
                    &#xe600;
                </i>
            </div>
            <div class="z_search" id="search2">
                <input class="z_search-input" id="input" type="text" autofocus="true" placeholder="请输入搜索内容">
                <i class="iconfont z_search-left-ico z_icon-color-g" id="goSearch">&#xe600;</i>
                <i class="iconfont z_search-right-ico z_icon-color-w" id="cancSearch">&#xe601;</i>
            </div>
        </div>
    </div>
    <div class="z_fix z_game_download-header">
      <img alt="${game.title }" src="${game.preimage }" class="z_fl z_game_download-img">
      <div class="z_fr z_game_download-entry">
        <h2 class="z_game_download-name">${game.title }</h2>
        <div class="z_game_download-intro">
            <span>${game.preinfo }</span>
        </div>
        <ul class="z_game_download_label">
              <li class="z_fl z_game_download_label_list">游戏类型: ${game.type }</li>
              <li class="z_fl z_game_download_label_list">更新时间: <fmt:formatDate value="${game.createTime }" type="both" pattern="yyyy年MM月dd日"/></li>
              <li class="z_fl z_game_download_label_list">游戏平台: 
<c:if test="${1 == game.system }">PC</c:if>
<c:if test="${2 == game.system }">Android</c:if>
<c:if test="${3 == game.system }">iOS</c:if>
<c:if test="${4 == game.system }">PlayStation</c:if></li>
              <li class="z_fl z_game_download_label_list">游戏大小: ${game.installationSize}</li>
              <li class="z_fl z_game_download_label_list">显示设备: ${game.displayDevice }</li>
              <li class="z_fl z_game_download_label_list">下载次数: ${game.downloadNum }</li>
        </ul>
        <a href="https://jump.haikevr.com/redirect.html#!${game.downloadUrl }" rel="nofollow">
          <div class="z_game_download-entrence">
            <i class="z_fl z_game_download-download-ico iconfont">&#xe60d;</i>
            <span class="z_fl z_game_download-download">立即下载</span>
          </div>
        </a>
      </div>
    </div>
    <div class="z_fix z_game_download-game-intro-header">游戏介绍</div>
    <div class="z_fix z_game_download-game-intro-body">
      <section class="z_game_download-intro1 w_clear-f">
        ${game.content }
        <p>${game.preinfo }</p>
      </section>
    </div>
    <div class="z_fix z_game_download-footer-header">热门游戏</div>
    <ul class="z_fix z_game_download-footer-content">
        <c:if test="${not empty remenGames }">
            <c:forEach var="game" items="${remenGames}">
              <li class="z_fl z_game_download-footer-list"><a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img alt="${game.title }" src="${game.preimage }" class="z_game_download-footer-img"></a>
                <div class="z_game_download-footer-title"><a href="game/${youxiMap[game.type]}/${game.gameId}.html">${game.title }</a></div>
              </li>
            </c:forEach>
        </c:if>
    </ul>
    <div class="z_home-footer z_pr">
        <div class="z_home-footer-content z_fix">
            <div class="z_fl">
                <h2>Hi客VR，让VR走进生活！</h2>
                <h3>haikevr.com</h3>
            </div>
            <div class="z_fr z_home-footer-contact">
                <img class="z_home-footer-img" src="./images/weChat.jpg">
                <p>扫一扫，每日更多新鲜资讯</p>
            </div>
            <div class="z_fr">
                <ul class="z_home-footer-menu">
                    <li class="z_home-dooter-menu-list z_home-footer-pb z_fl">
                        <a class="z_footer-color-w">网站频道</a>
                    </li>
                    <li class="z_home-dooter-menu-list z_home-footer-pb z_fl">
                        <a class="z_footer-color-w">联系我们</a>
                    </li>
                    <li class="z_home-dooter-menu-list z_fl">
                        <a class="z_footer-color-g" href="news/">VR资讯</a>
                    </li>
                    <li class="z_home-dooter-menu-list z_fl">
                        <a class="z_footer-color-g">内部投稿</a>
                    </li>
                    <li class="z_home-dooter-menu-list z_fl">
                        <a class="z_footer-color-g" href="video/">VR视频</a>
                    </li>
                    <li class="z_home-dooter-menu-list z_fl">
                        <a class="z_footer-color-g">意见反馈</a>
                    </li>
                    <li class="z_home-dooter-menu-list z_fl">
                        <a class="z_footer-color-g" href="game/">VR游戏</a>
                    </li>
                </ul>
            </div>
            <div class="z_home-footer-footer-content z_pa">
                <p>Copyright @ 2016 <a href="http://www.haikevr.com">Hi客VR </a>   All Rights Reserved</p>
                <p>
                    <a href="http://www.miitbeian.gov.cn">粤ICP备16030475号-3</a>
                </p>
            </div>
        </div>
        <div class="z_home-footer-footer z_pa"></div>
    </div>
    <script type="text/javascript" src="./scripts/bundle_pc.js"></script>
</body>
</html>
    