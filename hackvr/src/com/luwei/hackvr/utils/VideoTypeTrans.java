package com.luwei.hackvr.utils;

import java.util.ArrayList;
import java.util.List;

public class VideoTypeTrans {
    
    /*
     * 
  体验
  0: Experimental
  娱乐 
  1:Animation
  2:Comedy
  3:Films
  4:Gaming
  5:Music
  生活
  6:Everyday
  7:Arts
  8:Cooking & Food
  9:Relaxation & Spirituality
  10:Sports & Fitness
  科技
  11:Education & DIY
  12:Science & Technology
  13:Vehicles
  时尚
  14:Fashion & Style
  风光
  15:Aerial
  16:Nature & Wildlife
  17:Travel & Events
  社会
  18:Activism & Nonprofits
  19:News & Politics

体验
41:创意42:自拍40:拍客36:体育
  娱乐 
20:电影21:电视剧22:音乐23:综艺24:搞笑25:动漫26:游戏30:娱乐31:广告
  生活
32:生活38:亲子
  科技
28:汽车29:教育33:科技
  时尚
35:时尚
  风光
34:旅游
  社会
27:纪录片37:资讯



修改后：
体验：50
娱乐：51
生活：52
科技：53
时尚：54
风光：55
社会：56
     */
    
    
    /*
     * @param type
     * @return
     *  根据显示页面的分类映射数据库的分类
     */
    public static List<Integer> displayToStore(int type) {
        List<Integer> typeList = new ArrayList<Integer>();
        if (type == 0) {
            typeList.add(0); typeList.add(36); typeList.add(40); typeList.add(41); typeList.add(42);
            typeList.add(50);
        } else if (type == 1) {
            typeList.add(14); typeList.add(35);
            typeList.add(51);
        } else if (type == 2) {
            typeList.add(1); typeList.add(2); typeList.add(3); typeList.add(4); typeList.add(5);
            typeList.add(20); typeList.add(21); typeList.add(22); typeList.add(23); typeList.add(24);
            typeList.add(25); typeList.add(26); typeList.add(30); typeList.add(31);
            typeList.add(52);
        } else if (type == 3) {
            typeList.add(15); typeList.add(16); typeList.add(17); typeList.add(34);
            typeList.add(53);
        } else if (type == 4) {
            typeList.add(11); typeList.add(12); typeList.add(13);
            typeList.add(28); typeList.add(29); typeList.add(33);
            typeList.add(54);
        } else if (type == 5) {
            typeList.add(6); typeList.add(7); typeList.add(8); typeList.add(9); typeList.add(10);
            typeList.add(32); typeList.add(38);
            typeList.add(55);
        } else if (type == 6) {
            typeList.add(18); typeList.add(19); typeList.add(27); typeList.add(37);
            typeList.add(56);
        }
        return typeList;
    }
    
    /*
     * @param type
     * @return
     *  根据数据库中的类型映射要显示的分类
     */
    public static int storeToDisplay(int type) {
        if (type == 0 || type == 36 || type == 40 || type == 41 || type == 42
                || type == 50) {
            return 0;
        } else if (type == 14 || type == 35
                || type == 51) {
            return 1;
        } else if (type == 1 || type == 2 || type == 3 || type == 4 || type == 5
                || type == 20 || type == 21 || type == 22 || type == 23 || type == 24
                || type == 25 || type == 26 || type == 30 || type == 31
                || type == 52) {
            return 2;
        } else if (type == 15 || type == 16 || type == 17 || type == 34
                || type == 53) {
            return 3;
        } else if (type == 11 || type == 12 || type == 13 || type == 28
                || type == 29 || type == 33
                || type == 54) {
            return 4;
        } else if (type == 6 || type == 7 || type == 8 || type == 9 || type == 10
                || type == 32 || type == 38
                || type == 55) {
            return 5;
        } else if (type == 18 || type == 19 || type == 27 || type == 37
                || type == 56) {
            return 6;
        }
        return 0;
    }
    
}
