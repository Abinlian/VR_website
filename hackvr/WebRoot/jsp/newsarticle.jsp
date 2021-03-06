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
    <base href="<%=path%>/">
    <meta charset="UTF-8">
    <title>${article.title }_VR资讯_Hi客VR</title>
    <meta name="keywords" content="VR,VR产业,VR科技资讯,VR商业观察,Oculus,HTCvive,PSVR,VR技术,VR新闻媒体,VR眼镜,VR游戏">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" href="./styles/pc_style.css">
    <link rel="stylesheet" href="./iconfont/iconfont.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
    <!-- <link rel="stylesheet" href="./styles/public.css">
    <link rel="stylesheet" type="text/css" href="./styles/home-header.css">
    <link rel="stylesheet" href="./styles/article.css">
    <link rel="stylesheet" type="text/css" href="./styles/home-footer.css">
 -->
</head>
<body>
    <!-- header -->
    <div class="z_home">
        <div class="z_fix z_home-header">
            <!-- logo -->
            <h1 class="z_home-logo z_fl" id="top">
                <a href="/" title="骇客VR,与你共见未来"></a>
            </h1>
            <!-- menu  width:612:px-->
            <ul class="z_home-menu z_fl">
                <li class="z_fl" id="homePage">
                    <a href="/">
                        首页
                    </a>
                </li>
                <li class="z_fl home-ico" id="infoPage">
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

    <section class="w_guide z_fix" >
        <a href="news/">资讯</a>
        <a href="news/${zixunType[article.type]}/">
            <c:if test="${1 == article.type }">时讯</c:if>
            <c:if test="${2 == article.type }">观察</c:if>
            <c:if test="${3 == article.type }">游戏</c:if>
            <c:if test="${4 == article.type }">影视</c:if>
        </a>
        <a>正文</a>
    </section>

    <section class="z_fix w_clear-f z_pr">
        <div class="z_td-code z_hide">
            <img src="${qrcode }">
        </div>
        <div class="z_fixed-left">
            <div class="z_left-weChat">
                <i class="iconfont z_left-icon">&#xe607;</i>
            </div>
            <a href="javascript:scroll(0,0)">
                <div class="z_left-weChat">
                    <i class="iconfont z_left-icon">&#xe701;</i>
                </div>
            </a>
        </div>
        <section class="w_article w_reading-bg z_fl">
            <h1>${article.title }</h1>
            <p><fmt:formatDate value="${article.createTime }" type="both" pattern="yyyy年MM月dd日"/></p>
            <div>
                ${article.content }
                <p>来源：${article.source }</p>
                <p><span class="z_intro">haikevr.com发布的内容部分来源于互联网，目的在于传递信息，但不代表本站赞同其观点和立场，版权归属作者，如有侵权请联系删除</span></p>
            </div>
        </section>

        <section class="z_fr">
            <div class="w_relevant">
                <h3 class="w_h3">相关文章</h3>
                <ul class="w_relevant-ul">
                    <c:if test="${not empty xiangguanArticles}">
                        <c:forEach var="xiangguanArticle" items="${xiangguanArticles }">
                            <li>
                                <a class="w_single-ellipsis" href="news/${zixunType[xiangguanArticle.type]}/${xiangguanArticle.articleId}.html">
                                    ${xiangguanArticle.title }
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>

            <div class="w_hot-article">
                <h3 class="w_h3">热门文章</h3>
                <ul>
                    <c:if test="${not empty remenToutiaos}">
                        <c:forEach var="remenToutiao" items="${remenToutiaos }" begin="0" end="0" step="1">
                            <li class="w_hot-article-cur">
                                <a href="news/${zixunType[remenToutiao.type]}/${remenToutiao.articleId}.html">
                                    <h4 class="w_title-mask w_single-ellipsis">${remenToutiao.title}</h3>
                                    <img src="${remenToutiao.preimage}" alt="${remenToutiao.title}">
                                </a>
                            </li>
                        </c:forEach>
                        <c:forEach var="remenToutiao" items="${remenToutiaos }" begin="1" step="1">
                            <li>
                                <a href="news/${zixunType[remenToutiao.type]}/${remenToutiao.articleId}.html">
                                    <h4 class="w_title-mask w_single-ellipsis">${remenToutiao.title}</h3>
                                    <img src="${remenToutiao.preimage}" alt="${remenToutiao.title}">
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
        </section>
    </section>
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
    <!-- <script src="./scripts/w_base.js"></script> -->
    <!-- <script type="text/javascript" src="./scripts/z_home-header.js"></script> -->
    <!-- <script type="text/javascript" src="./scripts/z_article.js"></script> -->
    <script type="text/javascript" src="./scripts/bundle_pc.js"></script>
</body>
</html>
