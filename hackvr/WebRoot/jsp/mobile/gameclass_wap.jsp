<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
int typeRank = 0;
int deviceRank = 0;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="cn">
<head>
    <base href="<%=path%>/"/>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <title>游戏列表_VR游戏_Hi客VR</title>
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
    <nav class="nav nav-class clear-f">
        <ul>
            <li class="font-color-5 iconfont nav-class-li nav-li-cur fl"><a href="javascript:;" name="new" class="font-size-1 classify-btn">最新</a></li>
            <li class="font-color-5 iconfont nav-class-li fl"><a href="javascript:;" name="recommend" class="font-size-1 classify-btn">推荐</a></li>
            <li class="font-color-5 iconfont nav-class-li fl"><a href="javascript:;" name="rankList" class="font-size-1 classify-btn">排行</a></li>
            <li class="font-color-5 iconfont nav-class-li fl"><a href="javascript:;" name="classify" class="font-size-1 classify-btn">分类&#xe615;</a></li>
        </ul>
    </nav>
    <section class="game-class">
        <ul class="font-color-5">
            <li class="game-class-li">
                <h2 class="font-size-9">游戏类型</h2>
                <div class="font-size-13 center-center">
                    <a href="javascript:;" name="type-0" class="game-class-all game-class-cur-btn">全部</a>
                    <div class="flex-1">
                        <c:if test="${not empty gametypeList }">
                            <c:forEach var="gameType" items="${gametypeList}" begin="1">
                                <a href="javascript:;" name="type-<%=++typeRank%>" class="game-class-btn">${gameType}</a>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </li>
            
            <li class="game-class-li">
                <h2 class="font-size-9">游戏系统</h2>
                <div class="font-size-13 center-center">
                    <a href="javascript:;" name="system-0" class="game-class-all game-class-cur-btn">全部</a>
                    <div class="flex-1">
                        <a href="javascript:;" name="system-1" class="game-class-btn">PC</a>
                        <a href="javascript:;" name="system-2" class="game-class-btn">android</a>
                        <a href="javascript:;" name="system-3" class="game-class-btn">iOS</a>
                        <a href="javascript:;" name="system-4" class="game-class-btn">PlaySation</a>
                        <a href="javascript:;" name="system-5" class="game-class-btn">其他</a>
                    </div>
                </div>
            </li>
            
            <li class="game-class-li">
                <h2 class="font-size-9">显示设备</h2>
                <div class="font-size-13 center-center">
                    <a href="javascript:;" name="device-0" class="game-class-all game-class-cur-btn">全部</a>
                    <div class="flex-1">
                        <c:if test="${not empty displayDeviceList }">
                            <c:forEach var="displayDevice" items="${displayDeviceList}" begin="1">
                                <a href="javascript:;" name="device-<%=++deviceRank%>" class="game-class-btn">${displayDevice}</a>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </li>
        </ul>
    </section>
    <section class="container game-container">
        <ul class="game-class-container roll-load">
            <c:if test="${not empty games }">
                <c:forEach var="game" items="${games}">
                    <li>
                        <a href="game/${youxiMap[game.type]}/${game.gameId}.html" class="game-intro">
                            <img src="${game.preimage }" alt="${game.title }">
                            <div class="font-color-5 game-detail">
                                <h2 class="font-size-9">${game.title }</h2>
                                <p class="font-color-4 font-size-11">${game.preinfo }</p>
                                <div class="iconfont center-between">
                                    <span class="font-size-8">
                                        <fmt:formatDate value="${game.createTime }" type="both" pattern="yyyy年MM月dd日"/>
                                    </span>
                                    <div class="center-center">
                                        <em class="font-size-7">&#xe60d;</em>
                                        <span class="font-size-9">${game.downloadNum}</span>
                                    </div>
                                </div>
                            </div>
                        </a>
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
