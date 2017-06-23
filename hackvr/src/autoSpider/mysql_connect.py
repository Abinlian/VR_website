# mysqldb.py
# coding=utf-8
# author=zhouj
import MySQLdb
import sys

#默认utf-8 编码
reload(sys)
sys.setdefaultencoding('utf-8')

def mysql_connect(lines):
	# 打开数据库连接
	db = MySQLdb.connect("10.0.0.10","root", "mysql","hackvr",charset="utf8")
	# 使用cursor()方法获取操作游标 
	cursor = db.cursor()
	for line in lines:
		# SQL 插入语句
		try:
			# 执行sql语句
			cursor.execute(line)
			# 提交到数据库执行
			db.commit()
			print "yes"
		except:
			db.rollback()
			db.close()
			print "no"