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
    <title>视频列表_VR视频_Hi客VR</title>
    <meta name="keywords" content="VR,VR视频,全景视频,体验,时尚,娱乐,风光,科技,生活,社会,美女">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" type="text/css" href="./iconfont/iconfont.css">
    <link rel="stylesheet" href="./styles/pc_style.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
   <!--  <link rel="stylesheet" type="text/css" href="./styles/public.css">
    <link rel="stylesheet" type="text/css" href="./styles/home-header.css">
    <link rel="stylesheet" type="text/css" href="./styles/home-footer.css">
    <link rel="stylesheet" type="text/css" href="./styles/video_class.css">
    <link rel="stylesheet" type="text/css" href="./styles/video_public.css"> -->
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
                <li class="z_fl home-ico" id="videoPage">
                    <a href="video/">
                        视频
                    </a>
                </li>
                <li class="z_fl" id="gamePage">
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
    <div class="z_video-class">
        <div class="z_fix">
            <ul class="z_video-class-father" type="${type }">
                <a href="video/experience/">
                    <li class="z_video-class-icon z_fl <c:if test='${0 == type }'>z_video-class-icon-first</c:if>">
                体验
                    </li>
                </a>
                <a href="video/fashion/">
                    <li class="z_video-class-icon z_fl <c:if test='${1 == type }'>z_video-class-icon-first</c:if>">
                时尚
                    </li>
                </a>
                <a href="video/entertainment/">
                    <li class="z_video-class-icon z_fl <c:if test='${2 == type }'>z_video-class-icon-first</c:if>">
                娱乐
                    </li>
                </a>
                <a href="video/scenery/">
                    <li class="z_video-class-icon z_fl <c:if test='${3 == type }'>z_video-class-icon-first</c:if>">
                风光
                    </li>
                </a>
                <a href="video/technology/">
                    <li class="z_video-class-icon z_fl <c:if test='${4 == type }'>z_video-class-icon-first</c:if>">
                科技
                    </li>
                </a>
                <a href="video/life/">
                    <li class="z_video-class-icon z_fl <c:if test='${5 == type }'>z_video-class-icon-first</c:if>">
                生活
                    </li>
                </a>
                <a href="video/society/">
                    <li class="z_video-class-icon z_fl <c:if test='${6 == type }'>z_video-class-icon-first</c:if>">
                社会
                    </li>
                </a>
            </ul>
        </div>
    </div>
    <div class="z_fix z_video_class-body">
        <ul class="z_video_class-content">
            <c:if test="${not empty videos }">
                <c:forEach var="video" items="${videos}">
                    <li class="z_video_class-content-list z_fl z_pr">
                        <a href="video/${shipinType[video.type]}/${video.videoId }.html">
                            <img class="z_video-img" src="${video.preimage }" alt="${video.title }">
                        </a>
                        <div class="z_video_class-video-bg z_pa"></div>
                        <div class="z_video_class-video-time z_pa">${video.videoLength }</div>
                        <a href="video/${shipinType[video.type]}/${video.videoId }.html">
                            <div class="z_video-play-blank z_hide">
                                <div class="z_video_class-play-bg z_pa"></div>
                                <img class="z_video_class-play-icon z_pa" src="./images/play.png">
                            </div>
                        </a>
                        <div class="z_video_class-video-title">
                            <a href="video/${shipinType[video.type]}/${video.videoId }.html">${video.title }</a>
                        </div>
                        <div class="z_video_class-count">
                            <img class="z_fl" src="./images/played.png">
                            <span class="z_fl">${video.clickNum }</span>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
        </ul>
        <div class="z_video_class-more z_fl">点击加载更多</div>
        <div class="z_video_class-more1 z_hide z_fl">正在加载...</div>
        <div class="z_video_class-more1 z_hide z_fl">已经没有了</div>
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
    <!-- <script type="text/javascript" src="./scripts/z_home-header.js"></script>
    <script type="text/javascript" src="./scripts/z_video_class.js"></script> -->
    <script type="text/javascript" src="./scripts/bundle_pc.js"></script>
</body>
</html>