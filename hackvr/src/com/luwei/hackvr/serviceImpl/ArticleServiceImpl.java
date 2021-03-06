package com.luwei.hackvr.serviceImpl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.ibatis.session.RowBounds;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luwei.hackvr.mapper.ArticleMapper;
import com.luwei.hackvr.pojo.Article;
import com.luwei.hackvr.pojo.ArticleExample;
import com.luwei.hackvr.pojo.Toutiao;
import com.luwei.hackvr.service.ArticleService;
import com.luwei.hackvr.service.ToutiaoService;
import com.luwei.hackvr.utils.BeansUtils;
import com.luwei.hackvr.utils.DateUtil;

@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    
    @Autowired
    private ArticleMapper articleMapper;
    @Autowired 
    private ToutiaoService toutiaoService;
    
    @Override
    public List<Article> getLateArticles(int index, int num) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("create_time desc, article_id desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        
        RowBounds rowBounds = new RowBounds(index, num);
        List<Article> articles = articleMapper.selectByExampleWithBLOBsWithRowbounds(example, rowBounds);

        if (CollectionUtils.isEmpty(articles)) {
            return null;
        }
        
        return articles;
    }
    
    public List<Article> getLateArticles(int index, int num, Byte typeString) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("create_time desc, article_id desc");
        example.createCriteria().andTypeEqualTo(typeString).andFlagEqualTo((byte)1);
        
        RowBounds rowBounds = new RowBounds(index, num);
        List<Article> articles = articleMapper.selectByExampleWithBLOBsWithRowbounds(example, rowBounds);

        if (CollectionUtils.isEmpty(articles)) {
            return null;
        }
        
        return articles;
    }
    
    @Override
    public List<Article> getTypeArticles(Byte typeString) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("create_time desc, article_id desc");
        example.createCriteria().andTypeEqualTo(typeString).andFlagEqualTo((byte)1);
        List<Article> articles = articleMapper.selectByExampleWithBLOBs(example);
        
        if (CollectionUtils.isEmpty(articles)) {
            return null;
        }
        
        return articles;
    }
    
    @Override
    public List<Article> getArticles() {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("create_time desc, article_id desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        List<Article> articles = articleMapper.selectByExampleWithBLOBs(example);
        
        if (CollectionUtils.isEmpty(articles)) {
            return null;
        }
        
        return articles;
    }
    
    @Override
    public List<Article> getArticlesByTime(long start, long end) {
        ArticleExample example = new ArticleExample();
        Date startDate = new Date(start);
        Date endDate = new Date(end);
        example.setOrderByClause("create_time desc, article_id desc");
        example.createCriteria().andCreateTimeGreaterThanOrEqualTo(startDate).andCreateTimeLessThan(endDate).andFlagEqualTo((byte)1);
        List<Article> articles = articleMapper.selectByExampleWithBLOBs(example);
        
        if (CollectionUtils.isEmpty(articles)) {
            return null;
        }
        
        return articles;
    }
    
    @Override
    public List<List<Article>> getDayArticlesByNum(int index, int num) {
        List<List<Article>> articleSet = new ArrayList<List<Article>>();
        List<Article> articles = new ArrayList<Article>();
        ArticleExample example = new ArticleExample();
        long currentTime = DateUtil.getCurrentDayBeginTimeStamp();
        int time = 0;
        for (int i = 0; i < index+num; ) {
            long start = currentTime - 86400000*time;
            long end = start + 86400000;
            time++;
            articles = getArticlesByTime(start, end);
            if (articles != null) {
                articleSet.add(articles);
                i++;
            }
            
            Date startDate = new Date(start);
            example.clear();
            example.createCriteria().andCreateTimeLessThan(startDate).andFlagEqualTo((byte)1);
            if (articleMapper.countByExample(example) <= 0) {
                break;
            }
        }
        
        if (articleSet.size() >= index+num) {
            articleSet = articleSet.subList(index, index+num);
        } else if (articleSet.size() > index) {
            articleSet = articleSet.subList(index, articleSet.size());
        } else {
            return null;
        }
        
        return articleSet;
    }
    
    @Override
    public List<Article> getRemenToutiaoArticles(int index, int num) {
        ArticleExample example = new ArticleExample();
        example.setOrderByClause("click_num desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        
        RowBounds rowBounds = new RowBounds(index, num);
        List<Article> articles = articleMapper.selectByExampleWithBLOBsWithRowbounds(example, rowBounds);

        if (CollectionUtils.isEmpty(articles)) {
            return null;
        }
        
        return articles;
    }
    
    @Override
    public Article getArticleById(int id) {
        Article article = articleMapper.selectByPrimaryKey(id);
        
        return article;
    }

    @Override
    public List<Map<String, Object>> getShouyeToutiaoArticles(int num) {
        List<Toutiao> toutiaos = toutiaoService.getShouyeToutiaos(num);
        
        if (CollectionUtils.isEmpty(toutiaos)) {
            return null;
        }
        
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for (Toutiao toutiao : toutiaos) {
            Map<String, Object> map = new HashMap<String, Object>();
            Article article = articleMapper.selectByPrimaryKey(toutiao.getArticleId());
            map.put("articleId", article.getArticleId());
            map.put("title", article.getTitle());
            map.put("preinfo", article.getPreinfo());
            map.put("type", article.getType());
            map.put("createTime", article.getCreateTime());
            map.put("preimage", toutiao.getImgUrl());
            
            retList.add(map);
        }

        return retList;
    }
    
    @Override
    public Map<String, Object> getShixunToutiaoArticle() {
        Toutiao toutiao = toutiaoService.getShixunToutiao();
        
        if (toutiao == null) {
            return null;
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        Article article = articleMapper.selectByPrimaryKey(toutiao.getArticleId());
        map.put("articleId", article.getArticleId());
        map.put("title", article.getTitle());
        map.put("preinfo", article.getPreinfo());
        map.put("type", article.getType());
        map.put("createTime", article.getCreateTime());
        map.put("preimage", toutiao.getImgUrl());
        
        return map;
    }
    
    @Override
    public Map<String, Object> getGuanchaToutiaoArticle() {
        Toutiao toutiao = toutiaoService.getGuanchaToutiao();
        
        if (toutiao == null) {
            return null;
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        Article article = articleMapper.selectByPrimaryKey(toutiao.getArticleId());
        map.put("articleId", article.getArticleId());
        map.put("title", article.getTitle());
        map.put("preinfo", article.getPreinfo());
        map.put("type", article.getType());
        map.put("createTime", article.getCreateTime());
        map.put("preimage", toutiao.getImgUrl());
        
        return map;
    }
    
    @Override
    public Map<String, Object> getYingshiToutiaoArticle() {
        Toutiao toutiao = toutiaoService.getYingshiToutiao();
        
        if (toutiao == null) {
            return null;
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        Article article = articleMapper.selectByPrimaryKey(toutiao.getArticleId());
        map.put("articleId", article.getArticleId());
        map.put("title", article.getTitle());
        map.put("preinfo", article.getPreinfo());
        map.put("type", article.getType());
        map.put("createTime", article.getCreateTime());
        map.put("preimage", toutiao.getImgUrl());
        
        return map;
    }
    
    @Override
    public Map<String, Object> getYouxiToutiaoArticle() {
        Toutiao toutiao = toutiaoService.getYouxiToutiao();
        
        if (toutiao == null) {
            return null;
        }
        
        Map<String, Object> map = new HashMap<String, Object>();
        Article article = articleMapper.selectByPrimaryKey(toutiao.getArticleId());
        map.put("articleId", article.getArticleId());
        map.put("title", article.getTitle());
        map.put("preinfo", article.getPreinfo());
        map.put("type", article.getType());
        map.put("createTime", article.getCreateTime());
        map.put("preimage", toutiao.getImgUrl());
        
        return map;
    }
    
    @Override
    public List<Map<String, Object>> getZixunToutiaoArticles(int num) {
        List<Toutiao> toutiaos = toutiaoService.getZixunToutiaos(num);
        
        if (CollectionUtils.isEmpty(toutiaos)) {
            return null;
        }
        
        List<Map<String, Object>> retList = new ArrayList<Map<String, Object>>();
        for (Toutiao toutiao : toutiaos) {
            Map<String, Object> map = new HashMap<String, Object>();
            Article article = articleMapper.selectByPrimaryKey(toutiao.getArticleId());
            map.put("articleId", article.getArticleId());
            map.put("title", article.getTitle());
            map.put("preinfo", article.getPreinfo());
            map.put("type", article.getType());
            map.put("createTime", article.getCreateTime());
            map.put("preimage", toutiao.getImgUrl());
            
            retList.add(map);
        }

        return retList;
    }
    
    @Override
    public int addClickNum(int id) {
        Article article = articleMapper.selectByPrimaryKey(id);
        article.setClickNum(article.getClickNum()+1);
        int affectCount = articleMapper.updateByPrimaryKeyWithBLOBs(article);
        if (affectCount == 0) {
            throw new RuntimeException("更新点击量失败");
        }
        return affectCount;
    }
    
    @Override
    public int offLineArticleById(int id) {
        Article article = articleMapper.selectByPrimaryKey(id);
        article.setFlag((byte)0);
        int affectCount = articleMapper.updateByPrimaryKeyWithBLOBs(article);
        if (affectCount == 0) {
            throw new RuntimeException("忽略文章失败");
        }
        return affectCount;
    }
}
