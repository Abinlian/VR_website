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
    <title>7x24VR快讯_VR资讯_Hi客VR</title>
    <meta name="keywords" content="VR,VR产业,VR科技资讯,VR商业观察,Oculus,HTCvive,PSVR,VR技术,VR新闻媒体,VR眼镜,VR游戏">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" href="./styles/app.css">
    <link rel="stylesheet" href="./iconfont/my_icon_font.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>
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
            <li class="nav-li font-size-1 font-color-5 nav-li-cur"><a  class="font-color-5" href="news/newsflash/">7x24</a></li>
        </ul>
    </nav>
    <c:if test="${not empty kuaixunSet }">
        <section class="roll-load">
            <c:forEach var="kuaixuns" items="${kuaixunSet }">
                <section class="w_flash-day font-size-2 font-color-4 clear-f">
                    <ol class="fl w_time">
                        <c:forEach var="kuaixun" items="${kuaixuns}" begin="0" end="0" step="1">
                            <li>
                                <fmt:formatDate value="${kuaixun.createTime }" type="both" pattern="yyyy年MM月dd日"/>
                                <em class="w_dot"></em>
                            </li>
                        </c:forEach>
                        <c:forEach var="kuaixun" items="${kuaixuns}">
                            <li>
                                <fmt:formatDate value="${kuaixun.createTime }" type="both" pattern="MM月dd日 HH:mm"/>
                                <em class="w_dot"></em>
                            </li>
                        </c:forEach>
                    </ol>
                    <ul class="w_flash-detail fr">
                        <c:forEach var="kuaixun" items="${kuaixuns}">
                            <li>
                                <h2 class="w_h2">
                                    <a rel="nofollow" class="font-size-1 single-ellipsis">${kuaixun.title }</a>
                                </h2>
                                <div class="multi-ellipsis">
                                    <p class="font-size-4">${kuaixun.preinfo }</p>
                                </div>
                                <a class="w_flash-btn font-size-4" href="${kuaixun.link }" rel="nofollow">阅读原文</a>
                            </li>
                        </c:forEach>
                    </ul>
                </section>
            </c:forEach>
        </section>
        <input type="button" value="点击加载更多" class="wu_load btn">
        <p class="wu_is-end">已经没有了</p>
    </c:if>

    <script src="./scripts/bundle.js"></script>
</body>

</html>
    
