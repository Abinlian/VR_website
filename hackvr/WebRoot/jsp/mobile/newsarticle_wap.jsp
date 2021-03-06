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
    <title>${article.title }_VR资讯_Hi客VR</title>
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

    <section class="_article">
        <h1 class="font-color-3 font-size-3">${article.title }</h1>
        <p class="tag-time">
            <a href="news/${zixunType[article.type]}/" class="tag">
                <c:if test="${1 == article.type }">时讯</c:if>
                <c:if test="${2 == article.type }">观察</c:if>
                <c:if test="${3 == article.type }">游戏</c:if>
                <c:if test="${4 == article.type }">影视</c:if>
            </a>
            <span class="font-color-4 font-size-1">
                <fmt:formatDate value="${article.createTime }" type="both" pattern="yyyy年MM月dd日"/>
            </span>
        </p>
        ${article.content }
        <!-- 
        <p class="font-size-1">这是文章正文这是文章正文这是文章正文这是文章正文这是文</p>
        <p class="article-wap-img"><img src="http://103.224.81.114/images/c/5796c02a7732d~ivr_baidu_autow600~.jpg" alt="相关图片"></p>
        -->
        <p class="font-size-5 font-color-4">haikevr.com发布的内容部分来源于互联网，目的在于传递信息，但不代表本站赞同其观点及立场，版权归属作者，如有侵权请联系删除。</p>
    </section>

    <section>
        <div class="center-center font-size-2 more">
            <hr class="flex-1">
            <span>更多阅读</span>
            <hr class="flex-1">
        </div>
        <c:if test="${not empty xiangguanArticles}">
            <c:forEach var="xiangguanArticle" items="${xiangguanArticles }">
              <div class="more-read">
                <img src="${xiangguanArticle.preimage }" alt="${xiangguanArticle.title }" class="more-read-img">
                <h2 class="center-center">
                    <a href="news/${zixunType[xiangguanArticle.type]}/${xiangguanArticle.articleId}.html" class="font-color-5 more-read-title">
                        ${xiangguanArticle.title }
                    </a>
                </h2>
                <a href="news/${zixunType[xiangguanArticle.type]}/${xiangguanArticle.articleId}.html" class="shade"></a>
              </div>
            </c:forEach>
        </c:if>
    </section>
    
   <script src="./scripts/bundle.js"></script>
</body>
</html>
