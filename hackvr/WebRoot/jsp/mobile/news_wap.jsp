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
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>VR资讯_Hi客VR,让VR走进生活</title>
    <meta name="keywords" content="VR,VR产业,VR科技资讯,VR商业观察,Oculus,HTCvive,PSVR,VR技术,VR新闻媒体,VR眼镜,VR游戏">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" href="./styles/app.css">
    <link rel="stylesheet" href="./iconfont/my_icon_font.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
    <link rel="stylesheet" href="./styles/unslider.css">
    <script src="./scripts/unslider-min.js"></script>
</head>

<body>
    <header class="logo-header center-center iconfont">
        <a href="/" class="logo"></a>
    </header>

    <nav class="nav">
        <ul class="center-center">
            <li class="nav-li font-size-1 font-color-5"><a href="news/newsletter/">时讯</a></li>
            <li class="nav-li font-size-1 font-color-5"><a href="news/observation/">观察</a></li>
            <li class="nav-li font-size-1 font-color-5"><a href="news/game/">游戏</a></li>
            <li class="nav-li font-size-1 font-color-5"><a href="news/movie/">影视</a></li>
            <li class="nav-li font-size-1 font-color-5"><a href="news/newsflash/">7x24</a></li>
        </ul>
    </nav>

    <section class="w_carousel_container">
        <div class="banner">
            <ul class="w_carousel">
                <c:if test="${not empty zixunToutios }">
                    <c:forEach var="toutiao" items="${zixunToutios}">
                        <li>
                            <a href="news/${zixunType[toutiao.type]}/${toutiao.articleId}.html">
                                <img src="${toutiao.preimage }" alt="${toutiao.title }">
                                <p class="single-ellipsis font-color-5">${toutiao.title }</p>
                            </a>
                            <div class="shade"></div>
                        </li>
                    </c:forEach>
                </c:if>
            </ul>
        </div>
    </section>

    <section>
        <ul class="roll-load">
            <c:if test="${not empty articles}">
                <c:forEach var="article" items="${articles }">
                    <li class="listbox">
                        <a class="_image" href="news/${zixunType[article.type]}/${article.articleId}.html">
                            <img src="${article.preimage }" alt="${article.title }">
                        </a>
                        <div class="_text flex-1">
                            <a href="news/${zixunType[article.type]}/${article.articleId}.html" class="multi-ellipsis font-color-3">
                                <h2>${article.title }</h2>
                            </a>
                            <div>
                                <a class="tag">
                                    <c:if test="${1 == article.type }">时讯</c:if>
                                    <c:if test="${2 == article.type }">观察</c:if>
                                    <c:if test="${3 == article.type }">游戏</c:if>
                                    <c:if test="${4 == article.type }">影视</c:if>
                                </a>
                                <span class="font-size-2">
                                    <fmt:formatDate value="${article.createTime }" type="both" pattern="yyyy年MM月dd日"/>
                                </span>
                            </div>
                        </div>
                    </li>
                </c:forEach>
            </c:if>
        </ul>
        <input type="button" value="点击加载更多" class="wu_load btn">
        <p class="wu_is-end">已经没有了</p>
    </section>

    <script src="./scripts/bundle.js"></script>
</body>

</html>
