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
    <title>${game.title }_VR视频_Hi客VR</title>
    <meta name="keywords" content="VR,VR游戏，VR游戏资源，VR游戏下载，VR免费下载，VR游戏分享，VR游戏攻略，VR游戏体验测评，VR游戏大全，VR游戏排行">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" href="./styles/app.css">
    <link rel="stylesheet" href="./iconfont/my_icon_font.css">
    <script src="./scripts/jquery-3.1.0.min.js"></script>

</head>
<body>
    <header class="logo-header center-center iconfont">
        <a href="/" class="logo"></a>
    </header>

    <section class="container game-snapshoot font-color-3">
        <h1 class="font-size-12">${game.title }</h1>
        <img src="${game.preimage }" alt="${game.title }">
        <div class="font-size-11 game-infor">
            <p><span class="single-ellipsis">游戏类型：${game.type }</span><span class="single-ellipsis">更新时间：<fmt:formatDate value="${game.createTime }" type="both" pattern="yyyy年MM月dd日"/></p>
            <p><span class="single-ellipsis">运行平台：
<c:if test="${1 == game.system }">PC</c:if>
<c:if test="${2 == game.system }">Android</c:if>
<c:if test="${3 == game.system }">iOS</c:if>
<c:if test="${4 == game.system }">PlayStation</c:if></span><span class="single-ellipsis">游戏大小：${game.installationSize}</span></p>
            <p><span class="single-ellipsis">显示设备：${game.displayDevice }</span><span class="single-ellipsis">下载次数：${game.downloadNum}</span></p>
        </div>
    </section>

    <section class="container game-detail-intro font-color-3 font-size-11 t-border b-border">
        <h2 class="font-size-9">游戏简介</h2>
        ${game.content }
    </section>

    <section class="game-to-pc font-color-5">
        <p class="font-size-4 font-color-4 center-center">游戏大小：${game.installationSize}&nbsp;&nbsp;&nbsp;&nbsp;下载次数：${game.downloadNum}</p>
        <div class="btn font-size-9"><em class="iconfont">&#xe60d;</em>访问PC端网页下载</div>
    </section>

    <script src="./scripts/bundle.js"></script>
</body>

</html>
