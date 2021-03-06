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
    <title>游戏列表_VR游戏_Hi客VR</title>
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
    <div class="z_game_class-header w_clear-f">
      <div class="z_fix z_game_class-father" sort="${typesort }">
        <div class="z_fl z_game_class-header-class">游戏类型</div>
        <div class="z_fl z_game_class-header-all">全部</div>
        <ul class="z_fl z_game_class-header-menu">
            <c:if test="${not empty gametypeList }">
                <c:forEach var="gameType" items="${gametypeList}" begin="1">
                    <li class="z_fl z_game_class-class-list">${gameType}</li>
                </c:forEach>
            </c:if>
        </ul>
      </div>
      <div class="z_fix z_game_class-father1" sort="${systemsort }">
        <div class="z_fl z_game_class-header-class">运行平台</div>
        <div class="z_fl z_game_class-header-all">全部</div>
        <ul class="z_fl z_game_class-header-menu">
            <li id="pc" class="z_fl z_game_class-platform-list">PC</li>
            <li id="android" class="z_fl z_game_class-platform-list">android</li>
            <li id="iOS" class="z_fl z_game_class-platform-list">iOS</li>
            <li id="PlaySation" class="z_fl z_game_class-platform-list">PlaySation</li>
            <li id="others" class="z_fl z_game_class-platform-list">其他</li>
        </ul>
      </div>
      <div class="z_fix z_game_class-father2" sort="${devicesort }">
        <div class="z_fl z_game_class-header-class">显示设备</div>
        <div class="z_fl z_game_class-header-all">全部</div>
        <ul class="z_fl z_game_class-header-menu">
            <c:if test="${not empty displayDeviceList }">
                <c:forEach var="displayDevice" items="${displayDeviceList}" begin="1">
                    <li class="z_fl z_game_class-present-list">${displayDevice}</li>
                </c:forEach>
            </c:if>
        </ul>
      </div>
    </div>
    <div class="z_fix z_game-body w_clear-f">
      <p class="z_game-game-list-header">游戏列表</p>
      <ul id="zGameClassFather">
        <c:if test="${not empty games }">
            <c:forEach var="game" items="${games}">
                <li class="z_fl z_game_class-game-list"><a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img alt="${game.title }" src="${game.preimage }" class="z_game-game-list-img"></a>
                  <p class="z_game-game-list-title"><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">${game.title }</a></p>
                  <div class="z_game-game-list-intro"><span>${game.preinfo }</span></div>
                  <div class="z_game-game-list-footer">
                    <span class="z_fl z_game-game-list-time">
                        <fmt:formatDate value="${game.createTime }" type="both" pattern="yyyy年MM月dd日"/>
                    </span>
                    <span class="z_fr z_game-game-count">${game.downloadNum}</span>
                    <i class="z_fr iconfont z_game-game-count-icon">&#xe60d;</i>
                  </div>
                </li>
            </c:forEach>
        </c:if>
      </ul>
      <ul amount="${amount }" class="z_fr z_game-page-father z_game-page-father-new2">
        <li class="z_fl z_game-page-list">
          <div class="z_game-page-list-son">首页</div>
        </li>
        <li class="z_fl z_game-page-list">
          <div class="z_game-page-list-son"><i class="iconfont">&#xe604;</i></div>
        </li>
        <li class="z_fl z_game-page-list">
          <select class="z_game-page-num">
          </select>
        </li>
        <li class="z_fl z_game-page-list">
          <div class="z_game-page-list-son"><i class="iconfont">&#xe603;</i></div>
        </li>
        <li class="z_fl z_game-page-list">
          <div class="z_game-page-list-son">末页</div>
        </li>
      </ul>
    </div>
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
    