# getData.py
# coding=utf-8
# author=zhoujl
import re
import urllib
import os

#读取所有文章url
file_objects=open('20160729artImgUrls.txt','r')
file_objects1=open('gotartUrls.txt','r+')

#所有图片的url
imgurls=file_objects.readlines()
#所有视频的url
got_urls=file_objects1.readlines()
file_objects1.close()
file_objects1=open('gotartUrls.txt','a+')

#下载图片
def loadimg(imgurl, imgPath, file_objects1):
	try:
		#下载图片
		urllib.urlretrieve(imgurl, imgPath)
		file_objects1.write(imgurl+'\n')
	except IOError:
		print "Error: 没有找到图片" + imgurl
	except urllib.ContentTooShortError:
		print 'Network conditions is not good.Reloading.' + imgurl
		loadimg(imgurl, imgPath, file_objects1)

#抓取图片
for imgurl in imgurls:
	imgurl = imgurl.split('{#}')
	imgPath = imgurl[1].replace('\n', '')
	imgurl = imgurl[0]
	if imgurl + '\n' in got_urls:
		continue
	print imgurl
	print imgPath
	loadimg(imgurl, imgPath, file_objects1)
