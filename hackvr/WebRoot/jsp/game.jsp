<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <meta charset="UTF-8"/>
    <title>VR游戏_Hi客VR,让VR走进生活</title>
    <meta name="keywords" content="VR,VR游戏，VR游戏资源，VR游戏下载，VR免费下载，VR游戏分享，VR游戏攻略，VR游戏体验测评，VR游戏大全，VR游戏排行">
    <meta name="description" content="Hi客VR，让VR走进生活，我们致力于为VR虚拟现实爱好者提供最优质、专业的VR产业资讯、VR产业观察报告、VR视频娱乐、VR游戏资源下载、游戏评测、游戏攻略、互动交流。VR生活，从Hi客开始！">
    <link rel="stylesheet" href="./iconfont/iconfont.css">
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
    <div class="z_fix z_game-header">
      <div class="z_fl z_pr z_game-header-son1">
        <c:if test="${not empty toutiaoGames }">
            <c:forEach var="game" items="${toutiaoGames}" begin="0" end="0" step="1">
                <a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img src="${game.preimage }" alt="${game.title }" class="z_pa z_game-header-img"></a>
            </c:forEach>
        </c:if>
        <c:if test="${not empty toutiaoGames }">
            <c:forEach var="game" items="${toutiaoGames}" begin="1">
                <a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img src="${game.preimage }" alt="${game.title }" class="z_pa z_hide z_game-header-img"></a>
            </c:forEach>
        </c:if>
        <div class="z_pa z_game-header-bg"></div>
        <c:if test="${not empty toutiaoGames }">
            <c:forEach var="game" items="${toutiaoGames}" begin="0" end="0" step="1">
                <div class="z_pa z_game-header-content-father">
                    <a href="game/${youxiMap[game.type]}/${game.gameId}.html"><span class="z_game-header-content">${game.title }</span></a>
                </div>
            </c:forEach>
        </c:if>
        <c:if test="${not empty toutiaoGames }">
            <c:forEach var="game" items="${toutiaoGames}" begin="1">
                <div class="z_pa z_hide z_game-header-content-father">
                    <a href="game/${youxiMap[game.type]}/${game.gameId}.html"><span class="z_game-header-content">${game.title }</span></a>
                </div>
            </c:forEach>
        </c:if>
        <div class="z_pa z_game-cycle z_game-cycle-first"></div>
        <div class="z_pa z_game-cycle z_game-cycle-second"></div>
        <div class="z_pa z_game-cycle z_game-cycle-third"></div>
      </div>
      <div class="z_fr z_game-news">
        <div class="z_game-news-title">
            <span class="z_game-news-title-content">最新资讯</span>
            <span class="z_fr z_game-news-more">
                <a href="news/game/">更多</a>
            </span>
        </div>
        <ul>
            <c:if test="${not empty lateArticles }">
                <c:forEach var="article" items="${lateArticles}">
                  <li class="z_game-news-list">
                    <p class="z_game-news-list-content"><a href="news/${zixunType[article.type]}/${article.articleId}.html" target="_blank">${article.title }</a></p>
                  </li>
                </c:forEach>
            </c:if>
        </ul>
      </div>
    </div>
    <div class="z_fix z_game-Hike-intro-father">
      <div class="z_game-Hike-intro-header">
        <p class="z_fl">Hi客推介</p>
        <ul class="z_fr">
              <li class="z_fr z_game-Hike-intro-menu">Android</li>
              <li class="z_fr z_game-Hike-intro-menu">iOS</li>
              <li class="z_fr z_game-Hike-intro-menu">PC</li>
        </ul>
      </div>
      <ul id="zGameAndroid" class="z_hide">
        <c:if test="${not empty androidTuijieList }">
            <c:forEach var="game" items="${androidTuijieList}">
                <li class="z_fl z_game-Hike-intro-body-list"><a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img alt="${game.title }" src="${game.preimage }" class="z_game-Hike-intro-img"></a>
                  <p class="z_game-Hike-intro-title"><a href="game/${youxiMap[game.type]}/${game.gameId}.html">${game.title }</a></p>
                </li>
            </c:forEach>
        </c:if>
      </ul>
      <ul id="zGameIOS" class="z_hide">
        <c:if test="${not empty iosTuijieList }">
            <c:forEach var="game" items="${iosTuijieList}">
                <li class="z_fl z_game-Hike-intro-body-list"><a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img alt="${game.title }" src="${game.preimage }" class="z_game-Hike-intro-img"></a>
                  <p class="z_game-Hike-intro-title"><a href="game/${youxiMap[game.type]}/${game.gameId}.html">${game.title }</a></p>
                </li>
            </c:forEach>
        </c:if>
      </ul>
      <ul id="zGamePC">
        <c:if test="${not empty pcTuijieList }">
            <c:forEach var="game" items="${pcTuijieList}">
                <li class="z_fl z_game-Hike-intro-body-list"><a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img alt="${game.title }" src="${game.preimage }" class="z_game-Hike-intro-img"></a>
                  <p class="z_game-Hike-intro-title"><a href="game/${youxiMap[game.type]}/${game.gameId}.html">${game.title }</a></p>
                </li>
            </c:forEach>
        </c:if>
      </ul>
    </div>
    <div class="z_fix z_game-body w_clear-f">
      <div class="z_fl z_game-game-list-father">
        <p class="z_game-game-list-header">游戏列表</p>
        <ul id="zGameFather">
            <c:if test="${not empty lateGames }">
                <c:forEach var="game" items="${lateGames}">
                  <li class="z_fl z_game-game-list"><a href="game/${youxiMap[game.type]}/${game.gameId}.html"><img alt="${game.title }" src="${game.preimage }" class="z_game-game-list-img"></a>
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
        <ul amount="${amount }" class="z_fr z_game-page-father z_game-page-father-new">
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
      <div class="z_fr z_game-game-class">
        <div class="z_game-game-class-header">游戏类型</div>
        <ul class="z_game-game-class-menu">
            <c:if test="${not empty gametypeList }">
                <c:forEach var="gameType" items="${gametypeList}" begin="1">
                    <a href="game/${youxiMap[gameType]}/"><li class="z_fl z_game-game-class-list">${gameType}</li></a>
                </c:forEach>
            </c:if>
        </ul>
      </div>
      <div class="z_fr z_game-game-platform">
        <div class="z_game-game-class-header">运行平台</div>
        <ul class="z_game-game-class-menu">
            <a href="game/pc/"><li class="z_fl z_game-game-platform-list">PC</li></a>
            <a href="game/android/"><li class="z_fl z_game-game-platform-list">android</li></a>
            <a href="game/ios/"><li class="z_fl z_game-game-platform-list">iOS</li></a>
            <a href="game/playstation/"><li class="z_fl z_game-game-platform-list">PlaySation</li></a>
            <a href="game/systemothers/"><li class="z_fl z_game-game-platform-list">其他</li></a>
        </ul>
      </div>
      <div class="z_fr z_game-game-platform">
        <div class="z_game-game-class-header">显示设备</div>
        <ul class="z_game-game-class-menu">
            <c:if test="${not empty displayDeviceList }">
                <c:forEach var="displayDevice" items="${displayDeviceList}" begin="1">
                    <a href="game/${deviceMap[displayDevice]}/"><li class="z_fl z_game-game-present-list">${displayDevice}</li></a>
                </c:forEach>
            </c:if>
        </ul>
      </div>
      <div class="z_fr z_game-game-rank">
        <div class="z_game-game-rank-header">
          <div class="z_fl z_game-game-rank-title">游戏排行</div>
          <ul class="z_fr z_game-game-rank-menu">
                <li id="z_pcIcon" class="z_fl z_game-game-rank-menu-list">PC</li>
                <li id="z_androidIcon" class="z_fl z_game-game-rank-menu-list">安卓</li>
                <li id="z_iOSIcon" class="z_fl z_game-game-rank-menu-list">iOS</li>
          </ul>
        </div>
        <div class="z_home-news2-son2-body">
          <ul id="z_pcGame" class="z_game z_pc">
            <c:if test="${not empty pcPaihangGames }">
                <c:forEach var="game" items="${pcPaihangGames}" begin="0" end="2" step="1">
                    <li class="z_game-PC-game">
                      <div class="z_type">
                        <p class="z_fl z_type-colorY"><%=++rank0%></p><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank" class="z_game-Pc-game-name">${game.title }</a>
                      </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${not empty pcPaihangGames }">
                <c:forEach var="game" items="${pcPaihangGames}" begin="3">
                    <li class="z_game-PC-game">
                      <div class="z_type">
                        <p class="z_fl z_type-colorG"><%=++rank0%></p><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank" class="z_game-Pc-game-name">${game.title }</a>
                      </div>
                    </li>
                </c:forEach>
            </c:if>
          </ul>
          <ul id="z_androidGame" class="z_game z_android z_hide">
            <c:if test="${not empty androidPaihangGames }">
                <c:forEach var="game" items="${androidPaihangGames}" begin="0" end="2" step="1">
                    <li class="z_game-PC-game">
                      <div class="z_type">
                        <p class="z_fl z_type-colorY"><%=++rank1%></p><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank" class="z_game-Pc-game-name">${game.title }</a>
                      </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${not empty androidPaihangGames }">
                <c:forEach var="game" items="${androidPaihangGames}" begin="3">
                    <li class="z_game-PC-game">
                      <div class="z_type">
                        <p class="z_fl z_type-colorG"><%=++rank1%></p><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank" class="z_game-Pc-game-name">${game.title }</a>
                      </div>
                    </li>
                </c:forEach>
            </c:if>
          </ul>
          <ul id="z_iOSGame" class="z_game z_iOS z_hide">
            <c:if test="${not empty iosPaihangGames }">
                <c:forEach var="game" items="${iosPaihangGames}" begin="0" end="2" step="1">
                    <li class="z_game-PC-game">
                      <div class="z_type">
                        <p class="z_fl z_type-colorY"><%=++rank2%></p><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank" class="z_game-Pc-game-name">${game.title }</a>
                      </div>
                    </li>
                </c:forEach>
            </c:if>
            <c:if test="${not empty iosPaihangGames }">
                <c:forEach var="game" items="${iosPaihangGames}" begin="3">
                    <li class="z_game-PC-game">
                      <div class="z_type">
                        <p class="z_fl z_type-colorG"><%=++rank2%></p><a href="game/${youxiMap[game.type]}/${game.gameId}.html" target="_blank" class="z_game-Pc-game-name">${game.title }</a>
                      </div>
                    </li>
                </c:forEach>
            </c:if>
          </ul>
        </div>
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
    