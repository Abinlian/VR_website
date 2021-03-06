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
    <title>VR视频_Hi客VR,让VR走进生活</title>
    <meta name="keywords" content="VR,VR视频,全景视频,体验,时尚,娱乐,风光,科技,生活,社会,美女">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
<!--     <link rel="stylesheet" type="text/css" href="./styles/public.css">
    <link rel="stylesheet" type="text/css" href="./iconfont/iconfont.css">
    <link rel="stylesheet" type="text/css" href="./styles/home-header.css">
    <link rel="stylesheet" type="text/css" href="./styles/video.css">
    <link rel="stylesheet" type="text/css" href="./styles/home-footer.css">
    <link rel="stylesheet" type="text/css" href="./iconfont/iconfont.css">
    <link rel="stylesheet" type="text/css" href="./styles/video_public.css"> -->
    <link rel="stylesheet" type="text/css" href="./iconfont/iconfont.css">
    <link rel="stylesheet" href="./styles/pc_style.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
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
    <div class="z_video-hot">
        <div class="z_fix z_video-hot-body-father z_pr">
            <div class="z_video-hot-menu">
                 <span class="z_video-hot-menu-list z_video-hot-menu-first z_fl">最新</span>
                 <span class="z_video-hot-menu-list z_video-hot-menu-second z_fl">最热</span>
            </div>
            <div class="z_video-hot-b z_pr">
                <!-- 最新 -->
                <ul class="z_video-hot-body z_pa">
                    <c:if test="${not empty shipinToutiaoSet }">
                        <c:forEach var="shipinToutiaos" items="${shipinToutiaoSet}">
                            <li class="z_video-hot-list z_fl">
                                <c:forEach var="shipinToutiao" items="${shipinToutiaos}">
                                    <div class="z_pr z_video-hot-list-son">
                                        <a href="video/${shipinType[shipinToutiao.type]}/${shipinToutiao.videoId }.html" target="_blank">
                                            <img class="z_video-hot-video-img" src="${shipinToutiao.preimage }" alt="${shipinToutiao.title }">
                                        </a>
                                        <div class="z_video-hot-video-bg z_pa"></div>
                                        <div class="z_video-hot-video-time z_pa">${shipinToutiao.videoLength }</div>
                                        <a href="video/${shipinType[shipinToutiao.type]}/${shipinToutiao.videoId }.html" target="_blank">
                                            <div class="z_video-play z_hide">
                                                <div class="z_video-hot-play-bg z_pa"></div>
                                                <img class="z_video-hot-play-icon z_pa" src="./images/play.png">
                                            </div>
                                            <!-- <i class="iconfont haha z_pa">&#xe606;</i> -->
                                        </a>
                                    </div>
                                    <div class="z_video-hot-video-title">
                                        <a href="video/${shipinType[shipinToutiao.type]}/${shipinToutiao.videoId }.html" target="_blank">${shipinToutiao.title }</a>
                                    </div>
                                </c:forEach>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
                <!-- 最热 -->
                <ul class="z_video-hot-body z_pa z_hide">
                    <c:if test="${not empty remenShipinSet }">
                        <c:forEach var="remenShipins" items="${remenShipinSet}">
                            <li class="z_video-hot-list z_fl">
                                <c:forEach var="remenShipin" items="${remenShipins}">
                                    <div class="z_pr z_video-hot-list-son">
                                        <a href="video/${shipinType[remenShipin.type]}/${remenShipin.videoId }.html" target="_blank">
                                            <img class="z_video-hot-video-img" src="${remenShipin.preimage }" alt="${remenShipin.title }">
                                        </a>
                                        <div class="z_video-hot-video-bg z_pa"></div>
                                        <div class="z_video-hot-video-time z_pa">${remenShipin.videoLength }</div>
                                        <a href="video/${shipinType[remenShipin.type]}/${remenShipin.videoId }.html" target="_blank">
                                            <div class="z_video-play z_hide">
                                                <div class="z_video-hot-play-bg z_pa"></div>
                                                <img class="z_video-hot-play-icon z_pa" src="./images/play.png">
                                            </div>
                                            <!-- <i class="iconfont haha z_pa">&#xe606;</i> -->
                                        </a>
                                    </div>
                                    <div class="z_video-hot-video-title">
                                        <a href="video/${shipinType[remenShipin.type]}/${remenShipin.videoId }.html" target="_blank">${remenShipin.title }</a>
                                    </div>
                                </c:forEach>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
            <i class="z_video-left iconfont z_pa" id="zLeftIcon">&#xe604;</i>
            <i class="iconfont z_pa z_video-right" id="zRightIcon">&#xe603;</i>
        </div>
    </div>
    <div class="z_video-class">
        <div class="z_fix">
            <ul class="z_video-class-father">
                <li class="z_video-class-icon z_fl z_video-class-icon-first">体验</li>
                <li class="z_video-class-icon z_fl">时尚</li>
                <li class="z_video-class-icon z_fl">娱乐</li>
                <li class="z_video-class-icon z_fl">风光</li>
                <li class="z_video-class-icon z_fl">科技</li>
                <li class="z_video-class-icon z_fl">生活</li>
                <li class="z_video-class-icon z_fl">社会</li>
            </ul>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">体验</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty tiyanVideos }">
                    <c:forEach var="tiyanVideo" items="${tiyanVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[tiyanVideo.type]}/${tiyanVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${tiyanVideo.preimage }" alt="${tiyanVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${tiyanVideo.videoLength }</div>
                                <a href="video/${shipinType[tiyanVideo.type]}/${tiyanVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[tiyanVideo.type]}/${tiyanVideo.videoId }.html" target="_blank">${tiyanVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/experience/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">时尚</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty shishangVideos }">
                    <c:forEach var="shishangVideo" items="${shishangVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[shishangVideo.type]}/${shishangVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${shishangVideo.preimage }" alt="${shishangVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${shishangVideo.videoLength }</div>
                                <a href="video/${shipinType[shishangVideo.type]}/${shishangVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[shishangVideo.type]}/${shishangVideo.videoId }.html" target="_blank">${shishangVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/fashion/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">娱乐</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty yuleVideos }">
                    <c:forEach var="yuleVideo" items="${yuleVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[yuleVideo.type]}/${yuleVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${yuleVideo.preimage }" alt="${yuleVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${yuleVideo.videoLength }</div>
                                <a href="video/${shipinType[yuleVideo.type]}/${yuleVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[yuleVideo.type]}/${yuleVideo.videoId }.html" target="_blank">${yuleVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/entertainment/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">风光</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty fengguangVideos }">
                    <c:forEach var="fengguangVideo" items="${fengguangVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[fengguangVideo.type]}/${fengguangVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${fengguangVideo.preimage }" alt="${fengguangVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${fengguangVideo.videoLength }</div>
                                <a href="video/${shipinType[fengguangVideo.type]}/${fengguangVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[fengguangVideo.type]}/${fengguangVideo.videoId }.html" target="_blank">${fengguangVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/scenery/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">科技</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty kejiVideos }">
                    <c:forEach var="kejiVideo" items="${kejiVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[kejiVideo.type]}/${kejiVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${kejiVideo.preimage }" alt="${kejiVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${kejiVideo.videoLength }</div>
                                <a href="video/${shipinType[kejiVideo.type]}/${kejiVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[kejiVideo.type]}/${kejiVideo.videoId }.html" target="_blank">${kejiVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/technology/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">生活</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty shenghuoVideos }">
                    <c:forEach var="shenghuoVideo" items="${shenghuoVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[shenghuoVideo.type]}/${shenghuoVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${shenghuoVideo.preimage }" alt="${shenghuoVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${shenghuoVideo.videoLength }</div>
                                <a href="video/${shipinType[shenghuoVideo.type]}/${shenghuoVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[shenghuoVideo.type]}/${shenghuoVideo.videoId }.html" target="_blank">${shenghuoVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/life/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
    </div>
    <div class="z_video-class-body">
        <div class="z_fix">
            <div class="z_video-class-title">
                <span class="z_fl z_video-class-title-line"></span>
                <span class="z_fl">社会</span>
                <span class="z_fl z_video-class-title-line"></span>
            </div>
            <ul class="z_video-class-content">
                <c:if test="${not empty shehuiVideos }">
                    <c:forEach var="shehuiVideo" items="${shehuiVideos}">
                        <li class="z_video-class-content-list z_fl">
                            <div class="z_pr z_video-class-content-list-son">
                                <a href="video/${shipinType[shehuiVideo.type]}/${shehuiVideo.videoId }.html" target="_blank">
                                    <img class="z_video-class-video-img" src="${shehuiVideo.preimage }" alt="${shehuiVideo.title }">
                                </a>
                                <div class="z_video-class-video-bg z_pa"></div>
                                <div class="z_video-class-video-time z_pa">${shehuiVideo.videoLength }</div>
                                <a href="video/${shipinType[shehuiVideo.type]}/${shehuiVideo.videoId }.html" target="_blank">
                                    <div class="z_video-play1 z_hide">
                                        <div class="z_video-class-play-bg z_pa"></div>
                                        <img class="z_video-class-play-icon z_pa" src="./images/play.png">
                                    </div>
                                </a>
                            </div>
                            <div class="z_video-class-video-title">
                                <a href="video/${shipinType[shehuiVideo.type]}/${shehuiVideo.videoId }.html" target="_blank">${shehuiVideo.title }</a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
            <a href="video/society/" target="_blank">
                <div class="z_video-class-more">更多</div>
            </a>
        </div>
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
    <script type="text/javascript" src="./scripts/z_video.js"></script> -->
    <script type="text/javascript" src="./scripts/bundle_pc.js"></script>
</body>
</html>
    