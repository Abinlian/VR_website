<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="javax.servlet.http.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int rank0 = 0;
int rank1 = 0;
int rank2 = 0;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="cn">
<head>
    
    <base href="<%=path%>/"/>
    <meta charset="UTF-8">
    <title>Hi客VR,让VR走进生活_VR_VR资源_VR视频_VR游戏_VR眼镜</title>
    <meta name="keywords" content="VR,VR资讯,VR视频,,VR游戏,Oculus,HTCvive,PSVR,VR产业,VR技术,VR新闻,VR眼镜,虚拟现实">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" type="text/css" href="./iconfont/iconfont.css">
    <link rel="stylesheet" href="./styles/pc_style.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
    <script src="./scripts/unslider-min.js"></script>
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
                <li class="z_fl home-ico" id="homePage">
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
    <!-- hot -->
    <div class="z_home-hot z_fix">
        <c:if test="${not empty shouyeToutiaos }">
            <c:forEach var="toutiao" items="${shouyeToutiaos }" begin="0" end="0" step="1">
                <div class="z_home-hot1">
                    <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html" target="_blank">
                        <img class="z_img1" src="${toutiao.preimage}" alt="${toutiao.title}">
                    </a>
                    <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html" target="_blank">
                        <div class="z_home-hot1-intro-bg">
                            ${toutiao.preinfo }
                        </div>
                        <div class="z_home-hot1-intro">
                            <span href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html">
                                ${toutiao.title }
                            <span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${not empty shouyeToutiaos }">
            <c:forEach var="toutiao" items="${shouyeToutiaos }" begin="1" end="1" step="1">
                <div class="z_home-hot2-son z_fl">
                    <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html" target="_blank">
                        <img class="z_img2" src="${toutiao.preimage }" alt="${toutiao.title }">
                    </a>
                    <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html" target="_blank">
                        <div class="z_home-hot2-intro-bg">
                            ${toutiao.preinfo }
                        </div>
                        <div class="z_home-hot2-intro">
                            <span href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html">
                                ${toutiao.title }
                            </span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${not empty shouyeToutiaos }">
            <c:forEach var="toutiao" items="${shouyeToutiaos }" begin="2" end="2" step="1">
                <div class="z_home-hot2-son z_fr">
                    <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html" target="_blank">
                        <img class="z_img2" src="${toutiao.preimage }" alt="${toutiao.title }">
                    </a>
                    <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html" target="_blank">
                        <div class="z_home-hot2-intro-bg">
                            ${toutiao.preinfo }
                        </div>
                        <div class="z_home-hot2-intro">
                            <span href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html">
                                ${toutiao.title }
                            </span>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </c:if>
    </div>
    
    <!-- news -->
    <div class="z_home-news z_fix">
        <!-- newsHeader -->
        <div class="z_home-news-header">
            <div class="z_mark1 z_fl">
            </div>
            <h2>
                <a href="news/">最新资讯</a>
            </h2>
        </div>
        <div>
            <!-- left news -->
            <div class="z_home-news1 z_fl">
                <ul>
                    <c:if test="${not empty articles }">
                        <c:forEach var="article" items="${articles }">
                            <li class="w_news-li w_clear-f">
                                <a class="w_news-img z_fl" href="news/${zixunType[article.type]}/${article.articleId}.html" target="_blank">
                                    <img src="${article.preimage }" alt="${article.title }">
                                </a>
                                <div class="w_news-detail z_fr">
                                    <div class="w_news-title">
                                        <a class="w_clear-f" href="news/${zixunType[article.type]}/${article.articleId}.html" target="_blank">
                                            <h4 class="w_single-ellipsis z_fl">${article.title }</h4>
                                        </a>
                                    </div>
                                    <div class="w_multi-ellipsis">
                                        <p>${article.preinfo }</p>
                                    </div>
                                    <div class="w_new_tag">
                                        <a class="w_tag" href="news/${zixunType[article.type]}/">
                                            <c:if test="${1 == article.type }">时讯</c:if>
                                            <c:if test="${2 == article.type }">观察</c:if>
                                            <c:if test="${3 == article.type }">游戏</c:if>
                                            <c:if test="${4 == article.type }">影视</c:if>
                                        </a>
                                        <span>
                                            <fmt:formatDate value="${article.createTime }" type="both" pattern="yyyy年MM月dd日"/>
                                        </span>
                                    </div>
                                </div>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
                <div class="z_home-news1-show-more">
                    <a href="news/" target="_blank">
                        查看更多
                    </a>
                </div>
            </div>
            <!-- right news -->
            <div class="z_home-news2 z_fr">
                <div>
                    <div class="z_home-news2-son1-header">
                        <div class="z_mark2 z_fl">
                        </div>
                        <h3>
                            VR设备
                        </h3>
                    </div>
                    <div>
                        <ul>
                            <li class="z_home-news2-son1-list">
                                <a class="z_fl" href="http://www.htcvive.com/cn/" target="_blank" rel="nofollow">
                                    <img src="./images/HTC Vive.png" alt="相关图片">
                                </a>
                                <div class="z_fr">
                                    <a href="http://www.htcvive.com/cn/" target="_blank" rel="nofollow">
                                        HTC Vive
                                    </a>
                                </div>
                            </li>
                            <li class="z_home-news2-son1-list">
                                <a class="z_fl" href="https://www.oculuschina.com.cn/zh-cn/" target="_blank" rel="nofollow">
                                    <img src="./images/oculus rift.png" alt="相关图片">
                                </a>
                                <div class="z_fr">
                                    <a href="https://www.oculuschina.com.cn/zh-cn/" target="_blank" rel="nofollow">
                                        Oculus Rift
                                    </a>
                                </div>
                            </li>
                            <li class="z_home-news2-son1-list">
                                <a class="z_fl" href="http://www.playstation.com.cn/index.htm" target="_blank" rel="nofollow">
                                    <img src="./images/PSVR.png" alt="相关图片">
                                </a>
                                <div class="z_fr">
                                    <a href="http://www.playstation.com.cn/index.html" target="_blank" rel="nofollow">
                                        PS VR
                                    </a>
                                </div>
                            </li>
                            <li class="z_home-news2-son1-list">
                                <a class="z_fl" href="http://www.samsung.com/global/galaxy/wearables/gear-vr" target="_blank" rel="nofollow">
                                    <img src="./images/smartphoneVR.png" alt="相关图片">
                                </a>
                                <div class="z_fr">
                                    <a href="http://www.samsung.com/global/galaxy/wearables/gear-vr" target="_blank" rel="nofollow">
                                        智能手机VR
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
                
                <div>
                    <div class="z_home-news2-son2-header">
                        <div class="z_mark2 z_fl">
                        </div>
                        <h3 class="z_fl">
                            游戏排行
                        </h3>
                        <ul class="z_fr">
                            <li class="z_fl">
                                <p class="z_pc-p" id="z_pcIcon" href="#">
                                    PC
                                </p>
                            </li>
                            <li class="z_fl">
                                <p id="z_androidIcon" href="#">
                                    安卓
                                </p>
                            </li>
                            <li class="z_fl">
                                <p id="z_iOSIcon" href="#">
                                    iOS
                                </p>
                            </li>
                        </ul>
                    </div>
                    <div class="z_home-news2-son2-body">
                        <ul class="z_game z_pc" id="z_pcGame">
                            <c:if test="${not empty pcPaihangGames }">
                                <c:forEach var="game" items="${pcPaihangGames}" begin="0" end="2" step="1">
                                    <li class="z_home-PC-game">
                                        <div class="z_type">
                                            <p class="z_fl z_type-colorY">
                                                <%=++rank0%>
                                            </p>
                                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                                ${game.title }
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty pcPaihangGames }">
                                <c:forEach var="game" items="${pcPaihangGames}" begin="3">
                                    <li class="z_home-PC-game">
                                        <div class="z_type">
                                            <p class="z_fl z_type-colorG">
                                                <%=++rank0%>
                                            </p>
                                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                                ${game.title }
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                        <ul class="z_game z_android z_hide" id="z_androidGame">
                            <c:if test="${not empty androidPaihangGames }">
                                <c:forEach var="game" items="${androidPaihangGames}" begin="0" end="2" step="1">
                                    <li class="z_home-PC-game">
                                        <div class="z_type">
                                            <p class="z_fl z_type-colorY">
                                                <%=++rank1%>
                                            </p>
                                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                                ${game.title }
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty androidPaihangGames }">
                                <c:forEach var="game" items="${androidPaihangGames}" begin="3">
                                    <li class="z_home-PC-game">
                                        <div class="z_type">
                                            <p class="z_fl z_type-colorG">
                                                <%=++rank1%>
                                            </p>
                                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                                ${game.title }
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                        <ul class="z_game z_iOS z_hide" id="z_iOSGame">
                            <c:if test="${not empty iosPaihangGames }">
                                <c:forEach var="game" items="${iosPaihangGames}" begin="0" end="2" step="1">
                                    <li class="z_home-PC-game">
                                        <div class="z_type">
                                            <p class="z_fl z_type-colorY">
                                                <%=++rank2%>
                                            </p>
                                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                                ${game.title }
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                            <c:if test="${not empty iosPaihangGames }">
                                <c:forEach var="game" items="${iosPaihangGames}" begin="3">
                                    <li class="z_home-PC-game">
                                        <div class="z_type">
                                            <p class="z_fl z_type-colorG">
                                                <%=++rank2%>
                                            </p>
                                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                                ${game.title }
                                            </a>
                                        </div>
                                    </li>
                                </c:forEach>
                            </c:if>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- vr -->
    <div class="z_home-VR z_fix">
        <div class="z_home-news-header">
            <div class="z_mark1 z_fl"></div>
            <h2>
                <a href="video/">VR视频</a>
            </h2>
        </div>
        <div>
            <ul class="z_home-VR-body">
                <c:if test="${not empty shipinToutiaos }">
                    <c:forEach var="shipinToutiao" items="${shipinToutiaos}">
                        <li class="z_home-VR-list z_fl z_pr">
                            <a href="video/${shipinType[shipinToutiao.type]}/${shipinToutiao.videoId }.html" target="_blank">
                                <img class="z_home-video-img" src="${shipinToutiao.preimage }" alt="${shipinToutiao.title }">
                            </a>
                            <a class="z_home-vr-film-name" href="video/${shipinType[shipinToutiao.type]}/${shipinToutiao.videoId }.html">
                               ${shipinToutiao.title }
                            </a>
                            <div class="z_video-play z_hide">
                                <a href="video/${shipinType[shipinToutiao.type]}/${shipinToutiao.videoId }.html" target="_blank">
                                    <div class="z_video-play-bg z_pa"></div>
                                    <img class="z_video-play-icon z_pa" src="./images/play.png"> 
                                </a>
                            </div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
    </div>
    <!-- game -->
    <div class="z_home-game z_fix">
        <div class="z_home-news-header">
            <div class="z_mark1 z_fl"></div>
            <h2>
                <a href="game/">游戏下载</a>
            </h2>
        </div>
        <div>
            <ul class="z_home-game-body">
                <c:if test="${not empty lateGames }">
                    <c:forEach var="game" items="${lateGames}">
                        <li class="z_home-game-list z_fl">
                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                <img src="${game.preimage }" alt="${game.title }">
                            </a>
                            <a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank">
                                <div class="z_home-game-intro-bg">
                                </div>
                                <div class="z_home-game-intro">
                                    <span href="game/">
                                        ${game.title }
                                    <span>
                                </div>
                            </a>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
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
    <script type="text/javascript" src="./scripts/bundle_pc.js"></script>
</body>
</html>
