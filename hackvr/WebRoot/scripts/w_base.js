// 立即调用函数
// 封装了热门文章的交互效果
(function() {
    // 热门文章中的交互效果
    $('.w_hot-article ul li').hover(function() {
        $('.w_hot-article ul li').attr('class', '');
        $(this).attr('class', 'w_hot-article-cur');
    });

})(); // End of 封装了热门文章的交互效果

// 立即调用函数
// 封装了information.html、flash.html、news.html，三个页面中的点击加载更多交互效果
(function() {
    var wuRollLoad = document.getElementsByClassName('roll-load')[0];
    if (wuRollLoad) {
        document.getElementsByClassName('roll-load')[0].isEnd = 'false';
    }

    // modified by Nicholas 7/26/2016 改成点击加载更多
    $('.wu_load').bind('click', function(e) {
        e.preventDefault();

        // 点击加载更多的话，就不需要这个了
        // var scrollHeight = $(document).scrollTop(), // 滚动条到顶部的垂直高度
        //      browserHeight = $(window).height(), // 浏览器的高度
        //      docHeight =  $(document).height(); // 页面的文档高度

        var rollLoad = document.getElementsByClassName('roll-load')[0],
              rollLoadIsEnd = rollLoad.isEnd,
              hadLoadCount = rollLoad.getElementsByTagName('li').length,
              wantToLoad = 5,
              host = 'http://' + location.host, // 不知道为什么要加上http://
              pathType = location.pathname,
              pathTypeArray = pathType.split('/'), // add by Nicholas 8/5/2016,主要是锐彬修改了项目的目录结构
              pathTypeArrayLength = pathTypeArray.length,
              url = '',
              flag = 0; // 标志是那个页面

        // 这四个只是用来测试
        // url = 'http://10.0.0.10:8080/json/type.do?index=' + hadLoadCount + '&num=' + wantToLoad + '&type=1';
        // url = 'http://10.0.0.10:8080/json/article.do?index=' + hadLoadCount + '&num=' + wantToLoad;
        // url = 'http://10.0.0.10:8080/json/kuaixun.do?index=' + hadLoadCount + '&num=' + wantToLoad;
        // url = 'http://www.haikevr.com/json/kuaixun.do?index=2&num=5';

        var zixunType = ["newsletter", "observation", "game", "movie"], // add by 锐彬 8/5/2016，主要是修改了项目的目录结构
            zixunTypeLength = zixunType.length;

        if (pathTypeArrayLength === 3) {
            // 资讯
            hadLoadCount = rollLoad.getElementsByTagName('li').length;

            url = host + '/json/article.do?index=' + hadLoadCount + '&num=' + wantToLoad;

            flag = 2;
        } else {
            // 资讯页面下的几种分类，以及7*24快讯
            if (pathType.indexOf("newsflash") > 0) {
                // 快讯 7*24
                hadLoadCount = rollLoad.getElementsByTagName('section').length;

                url = host + '/json/kuaixun.do?index=' + hadLoadCount + '&num=' + wantToLoad;

                flag = 3;
            } else {
                // 资讯下的分类
                var type = pathTypeArray[pathTypeArrayLength - 2],
                    typeKey = 0; // zixunType的下标

                for (var i = 0; i < zixunTypeLength; i++) {
                    if (type === zixunType[i]) {
                        typeKey = i + 1;
                        break;
                    }
                }

                hadLoadCount = rollLoad.getElementsByTagName('li').length;

                url = host + '/json/type.do?index=' + hadLoadCount + '&num=' + wantToLoad + '&type=' + typeKey;

                flag = 1;
            }
        }

        // 注意，后台传过来的json中bool型可能是字符串，而且!"false"的值是true
        var wuLoad = $('.wu_load');

        wuLoad.attr('disabled', false); // 按钮不可点击
        wuLoad.html('正在加载...');

        $.ajax({
            url: url,
            type: 'GET',
            success: function(data) {
                var jsonObj = JSON.parse(data),
                    conData = jsonObj['dataList'],
                    isEnd = jsonObj.isEnd,
                    articles  = null,
                    kuaixuns  = null,
                    tempDOM = '';

                rollLoad.isEnd = isEnd;

                if (conData.length === 0) {
                    // 已经数据了
                    wuLoad.css('display', 'none'); // 隐藏按钮
                    wuLoad.val('点击加载更多');
                    wuLoad.attr('disabled', false); // 按钮可点击
                    $('.wu_is-end').css('display', 'block');
                } else {
                    switch(flag) {
                        case 1:
                        case 2:
                            tempDOM = fashLi(conData, zixunType); // modified by Nicholas 8/5/2016，主要是后台修改了目录结构，这里同步修改
                            break;
                        case 3:
                            tempDOM = newsLi(conData);
                            break;
                        default:
                            tempDOM = '';
                    }
                    $(rollLoad).append(tempDOM); // 在加载更多前面加入新增节点 
                    wuLoad.val('点击加载更多');
                    wuLoad.attr('disabled', false); // 按钮可点击
                    $('.wu_is-end').css('display', 'none');
                }
            },
            error: function() {
                wuLoad.val('点击加载更多');
                wuLoad.attr('disabled', false); // 按钮可点击
                $('.wu_is-end').css('display', 'none');
            }
        });
    });

    var newsLi = function (news) {
        var tempDOM = '',
              newsCount = news.length,
              dayNews  = null,
              dayNewsCount = 0;

        for (var i = 0; i < newsCount; i++) {
            dayNews = news[i]; // 每天的新闻
            dayNewsCount = dayNews.length;

            tempDOM += '<section class="w_flash-day w_reading-bg w_clear-f">';
                tempDOM += '<ol class="w_time z_fl">';
                    tempDOM += '<li>' + format(dayNews[0].createTime, '年月日', 'cn') + '<em class="w_dot"></em></li>';
                    for (var j = 1; j < dayNewsCount; j++) {
                        tempDOM += '<li>' + format(dayNews[j].createTime, '月日 时:分', 'cn') + '<em class="w_dot"></em></li>';
                    }
                tempDOM += '</ol>';

                tempDOM += '<ul class="w_flash-detail z_fr">';
                    for (var k = 0; k < dayNewsCount; k++) {
                        tempDOM += '<li>';
                            tempDOM += '<h2 class="w_h2">' + dayNews[k].title + '</h2>';
                            tempDOM += '<div class="w_multi-ellipsis">';
                                tempDOM += '<p>' + dayNews[k].preinfo + '</p>';
                            tempDOM += '</div>';
                            tempDOM +='<a class="w_flash-btn" href="' + dayNews[k].link + '">阅读原文</a>';
                        tempDOM += '</li>';
                    }
                tempDOM += '</ul>';
            tempDOM += '</section>';
        }

        return tempDOM;
    }

    var fashLi = function (articles, zixunType) {
        var tempDOM = '',
              articleCount = articles.length;
        
        for (var i = 0; i < articleCount; i++) {
            tempDOM += '<li class="w_news-li w_clear-f">';
                tempDOM += '<a class="w_news-img z_fl" href="news/' + zixunType[articles[i].type - 1] + '/' + articles[i].articleId +'.html " target="_blank">';
                    tempDOM += '<img src="' + articles[i].preimage+ '" alt="' + articles[i].title + '">';
                tempDOM += '</a>';
                tempDOM += '<div class="w_news-detail z_fr">';
                    tempDOM += '<div class="w_news-title">';
                        tempDOM += '<a class="w_clear-f" href="news/' + zixunType[articles[i].type - 1] + '/' + articles[i].articleId +'.html " target="_blank">';
                            tempDOM += '<h4 class="w_single-ellipsis z_fl">' + articles[i].title + '</h4>';
                        tempDOM += '</a>';
                    tempDOM += '</div>';
                    tempDOM += '<div class="w_multi-ellipsis">';
                        tempDOM += '<p>' + articles[i].preinfo + '</p>';
                    tempDOM += '</div>';
                    tempDOM += '<div class="w_new_tag">';
                        tempDOM += '<a class="w_tag" href="news/' + zixunType[articles[i].type - 1] + '/">';

                            switch (articles[i].type) {
                                case 1:
                                    tempDOM += '时讯';
                                    break;
                                case 2:
                                    tempDOM += '观察';
                                    break;
                                case 3:
                                    tempDOM += '游戏';
                                    break;
                                case 4:
                                    tempDOM += '影视';
                                    break;
                                default:
                                    tempDOM += '';
                            }

                        tempDOM += '</a>';
                        tempDOM += '<span>' + format(articles[i].createTime, 'yyyy年MM月dd日', 'en') + '</span>';
                    tempDOM += '</div>';
                tempDOM += '</div>';
            tempDOM += '</li>';
        }

        return tempDOM;
    }

    var format = function(time, format, lang) {
        var t = new Date(time);
        var tf = function(i) {
            return (i < 10 ? '0' : '') + i
        };

        if (lang === 'en') {
            return format.replace(/yyyy|MM|dd|HH|mm|ss/g, function(a) {
                switch (a) {
                    case 'yyyy':
                        return tf(t.getFullYear());
                        break;
                    case 'MM':
                        return tf(t.getMonth() + 1);
                        break;
                    case 'mm':
                        return tf(t.getMinutes());
                        break;
                    case 'dd':
                        return tf(t.getDate());
                        break;
                    case 'HH':
                        return tf(t.getHours());
                        break;
                    case 'ss':
                        return tf(t.getSeconds());
                        break;
                }
            });
        } else {
            return format.replace(/年|月|日|时|分|秒/g, function(a) {
                switch (a) {
                    case '年':
                        return tf(t.getFullYear()) + '年';
                        break;
                    case '月':
                        return tf(t.getMonth() + 1) + '月';
                        break;
                    case '分':
                        return tf(t.getMinutes());
                        break;
                    case '日':
                        return tf(t.getDate()) + '日';
                        break;
                    case '时':
                        return tf(t.getHours());
                        break;
                    case '秒':
                        return tf(t.getSeconds());
                        break;
                }
            });
        }
    }

})(); // End of 封装了information.html、flash.html、news.html，三个页面中的点击加载更多交互效果
