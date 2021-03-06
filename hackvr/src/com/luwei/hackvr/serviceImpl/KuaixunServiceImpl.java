package com.luwei.hackvr.serviceImpl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.apache.commons.collections.CollectionUtils;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.luwei.hackvr.mapper.KuaixunMapper;
import com.luwei.hackvr.pojo.Kuaixun;
import com.luwei.hackvr.pojo.KuaixunExample;
import com.luwei.hackvr.service.KuaixunService;
import com.luwei.hackvr.utils.DateUtil;

@Service("kuaixunService")
public class KuaixunServiceImpl implements KuaixunService {
    @Autowired
    private KuaixunMapper kuaixunMapper;

    @Override 
    public List<Kuaixun> getKuaixuns() {
        KuaixunExample example = new KuaixunExample();
        example.setOrderByClause("create_time desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        List<Kuaixun> kuaixuns = kuaixunMapper.selectByExample(example);
        
        if (CollectionUtils.isEmpty(kuaixuns)) {
            return null;
        }
        
        return kuaixuns;
    }

    @Override
    public List<Kuaixun> getLateKuaixuns(int index, int num) {
        KuaixunExample example = new KuaixunExample();
        example.setOrderByClause("create_time desc");
        example.createCriteria().andFlagEqualTo((byte)1);
        
        RowBounds rowBounds = new RowBounds(index, num);
        List<Kuaixun> kuaixuns = kuaixunMapper.selectByExampleWithRowbounds(example, rowBounds);
        
        if (CollectionUtils.isEmpty(kuaixuns)) {
            return null;
        }
        
        return kuaixuns;
    }

    @Override
    public List<Kuaixun> getKuaixunsByTime(long start, long end) {
        KuaixunExample example = new KuaixunExample();
        Date startDate = new Date(start);
        Date endDate = new Date(end);
        example.setOrderByClause("create_time desc");
        example.createCriteria().andCreateTimeGreaterThanOrEqualTo(startDate).andCreateTimeLessThan(endDate).andFlagEqualTo((byte)1);
        List<Kuaixun> kuaixuns = kuaixunMapper.selectByExample(example);
        
        if (CollectionUtils.isEmpty(kuaixuns)) {
            return null;
        }
        
        return kuaixuns;
    }

    @Override
    public List<List<Kuaixun>> getDayKuaixunsByNum(int index, int num) {
        List<List<Kuaixun>> kuaixunSet = new ArrayList<List<Kuaixun>>();
        List<Kuaixun> kuaixuns = new ArrayList<Kuaixun>();
        KuaixunExample example = new KuaixunExample();
        long currentTime = DateUtil.getCurrentDayBeginTimeStamp();
        int time = 0;
        for (int i = 0; i < index+num; ) {
            long start = currentTime - 86400000*time;
            long end = start + 86400000;
            time++;
            kuaixuns = getKuaixunsByTime(start, end);
            if (kuaixuns != null) {
                kuaixunSet.add(kuaixuns);
                i++;
            }
            
            Date startDate = new Date(start);
            example.clear();
            example.createCriteria().andCreateTimeLessThan(startDate).andFlagEqualTo((byte)1);
            if (kuaixunMapper.countByExample(example) <= 0) {
                break;
            }
        }
        
        if (kuaixunSet.size() >= index+num) {
            kuaixunSet = kuaixunSet.subList(index, index+num);
        } else if (kuaixunSet.size() > index) {
            kuaixunSet = kuaixunSet.subList(index, kuaixunSet.size());
        } else {
            return null;
        }
        
        return kuaixunSet;
    }
}
