#!/usr/bin/env python

'''
Test miscellaneous language attributes.

'''

from __future__ import print_function;

import os;
import sys;
import re;

#import MySQLdb;
import pymysql;
#pymysql.install_as_MySQLdb();
#import MySQLdb;


'''
testing database connection using pymysql module

'''
def test_pymysql():
	print('hi');
	
	with pymysql.connect(host='localhost',user='root',password='',
		database='testdb') as cursor:
		
		cursor.execute('select version();');
		print(cursor.fetchone());
	


'''
testing regular expression
'''
def test_regex():
	txt = "My houseis moving!";
	phone = "236-965-9652 # unknown phone number";

	matchObject = re.match(r'([Rr])ub[ye]+\1.*?(?:u)', 'rubyr ! rubyy rubye');
	matchObject2 = re.search(r'[\s]??is', txt, re.M|re.I);

	if matchObject is not None:
		print(matchObject.group());
		#print(matchObject);

	if matchObject2 is not None:
		print(matchObject2.group());
	
	print(re.sub(r'#.*','',phone));
	print(re.sub(r'\D','',phone));
	###<<<<<<< HEAD

	#lenovo here
	###=======
	print('======================================================================');
	print(sys.version);
	print(re.search(r'2.{1}\d+.{1}\d+', sys.version).group());
	print(re.search(r'2(.{1})\d+?\1\d{0,2}.*', sys.version).group());
	###>>>>>>> 93b40f9f0aa2166193be81ea48e741862b7ea442

'''

'''
def regex2():
	po = patternObject = re.compile(
		r'''
		\b(?P<first>[a-zA-Z]+)\ (?P<second>\1)\b
		(?x)
		'''
	);

	subject = 'the woof woof must sit sit all the the time'
	iterator = po.finditer(subject);
	for x in list(iterator): #list of match objects
		sys.stdout.write('%s %s\n' % (x.group('first'), x.group(2)) );


	pass;



def socket():
	print(sys.executable); # /usr/bin/python --> /usr/bin/python2.7
	pass;
	
	


'''

'''
def testCursor():
	with pymysql.connect(host='localhost', user='root', password='') as cursor:
		#cursor.execute('select * from testdb.employee where first_name=\'mo\';');
		cursor.executemany("insert into testdb.employee(first_name,last_name) "
			"values (%s, %s);", [('Sam','Wise'),('Sarah','Cutler'),('Mick','Jag')]);
		data = cursor.fetchone();
		print(data);
		print(cursor.arraysize);
		print(cursor.description);
		pass
		
		po = re.compile(r'(abc|)def');
		mo = po.search('xxabcdef');
		if mo:
			print(mo.group(0)); # abcdef
		mo = po.search('xxdef');
		if mo:
			print(mo.group(0));	# def

def test01():
	#po = re.compile(r'(?x) (?P<open> \( )? [^()]{2} (?(open) \) )');#\ a
	#po = re.compile(r'(?x) (?P<open> \( )?\ [^()]{2} (?(open) \) )');#\ ab	
	po = re.compile(r'(?x) (?P<open> \( )?\ [abc]{1}? [xyz]? (?(open) \) )');
	#mo = po.search('( abc )');
	mo = po.search('( abcxyz )');
	if mo:
		print(mo.group(0));
		print(re.escape(mo.group(0)));
	
#print('======================================================================');

#test = test_pymysql;
#test = lambda:'';
#test = socket;
#test = testCursor;
test = test01;



test();





























