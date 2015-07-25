
### VARIABLES
javabin = ./resources/javadir/jdk1.8.0_45/bin

### HINTS
# "cat .git/refs/heads/master" shows head of master branch, ie a commit id
gituser:
	@gedit --new-window Makefile \
		.git/config .git/info/exclude \
		./src/string_operations.c \
		& #
		
mycodeDir = /home/vad/challenges/mycode
vad:
	@gedit --new-window \
		Makefile \
		./resources/3to2 \
		.git/config .git/info/exclude \
		./src/string_operations.c \
		${mycodeDir}/palindrome/problem_description.txt \
		${mycodeDir}/palindrome/*.py \
		${mycodeDir}/palindrome/*.java \
		${mycodeDir}/palindrome/*.cpp ${mycodeDir}/palindrome/*.h \
		${mycodeDir}/right_triangle/problem_description.txt \
		${mycodeDir}/right_triangle/*.py \
		${mycodeDir}/right_triangle/*.java \
		${mycodeDir}/right_triangle/*.cpp ${mycodeDir}/right_triangle/*.h \
		${mycodeDir}/hailo/*.txt \
		${mycodeDir}/hailo/*.py ${mycodeDir}/hailo/*.java \
		${mycodeDir}/hailo/*.cpp ${mycodeDir}/hailo/*.h \
		${mycodeDir}/pebbles/*.txt \
		${mycodeDir}/pebbles/*.py ${mycodeDir}/pebbles/*.java \
		${mycodeDir}/pebbles/*.cpp ${mycodeDir}/pebbles/*.h \
		$$(find ${mycodeDir}/fibonacci/ -type f | \
			grep -E '\.txt$$|\.py$$|\.java$$|\.cpp$$|\.h$$') \
		${mycodeDir}/reverse/*.txt \
		${mycodeDir}/smoke_signals/*.txt \
		${mycodeDir}/hello_coin/*.txt \
		${mycodeDir}/knights_and_knaves/*.txt \
		${mycodeDir}/hello_world/*.txt \
		& #


		

### VARIABLES	
#problemName = palindrome
#problemName = right_triangle
#problemName = hailo
#problemName = pebbles
problemName = fibonacci
cc:# compile c++ source files
	@g++ -Wall -o ${mycodeDir}/${problemName}/a.out \
		${mycodeDir}/${problemName}/${problemName}.cpp

rc:# run c++ executable
	@valgrind --leak-check=full ${mycodeDir}/${problemName}/a.out

#example:  @${javabin}/javac ./my_codes/palindrome/palindrome.java
#java doc:  google-chrome ./resources/javadir/jdk1.8.0_45/docs/index.html &
cjava:#compile java
	@${javabin}/javac -help
	@${javabin}/javac ${mycodeDir}/${problemName}/${problemName}.java

#example:  @${javabin}/java -classpath ./my_codes/palindrome: palindrome
rjava:#run java	
	@${javabin}/java -help
	@${javabin}/java -classpath ${mycodeDir}/${problemName}: ${problemName}

# convert python3 to python2; original python3 file stored as pyfile.py.bak
# and python2 converted file stored as pyfile.py per the -w flag		
convert:#convert python3 to python2
	@./resources/3to2	-w ${mycodeDir}/palindrome/palindrome.py
	
py:# run python program
	@python ${mycodeDir}/${problemName}/${problemName}.py	
			
	
	
	
### extract source code files on Gateway Laptop
# Cloudstack contains 5830 java files	
countJavaCloudFiles = $$(find ./resources/sourceCode/apache-cloudstack-4.5.1-src \
	-type f | grep --color -E '.*(.{1}java)$$' | wc -l)
javaCloudFiles = $$(find ./resources/sourceCode/apache-cloudstack-4.5.1-src \
	-type f | grep --color -E '.*(.{1}java)$$' | sed '1,20!d')
	#read?
# Cloudstack contains 341 python files	
countPythonCloudFiles = $$(find ./resources/sourceCode/apache-cloudstack-4.5.1-src \
	-type f | grep --color -E '.*(.{1}py)$$' | wc -l)
pythonCloudFiles = $$(find ./resources/sourceCode/apache-cloudstack-4.5.1-src \
	-type f | grep --color -E '.*(.{1}py)$$' | sed -n '1,20p')
	#read?
# MySQL Connector contains 322 java files
javaMysqlConnFiles = $$(find \
	./resources/sourceCode/mysql-connector-java-5.1.35 \
	-type f | grep --color -E '.*(.{1}java)$$' | sed '1,20!d')
	#read?
# MySQL Connector contains 107 python files
pythonMysqlConnFiles = $$(find \
	./resources/sourceCode/mysql-connector-python-2.0.4 \
	-type f | grep --color -E '.*(.{1}py)$$' | sed -n '1,20p')
	#read?
# MySQL Connector contains 195 C++ files
cppMysqlConnFiles = $$(find \
	./resources/sourceCode/mysql-connector-c++-1.1.6 \
	-type f | grep --color -E '.*(.cpp|.h|.c)$$' | sed '1,20!d')
	#read?
studyjava:
	#@echo ${countPythonFiles}	
	@gedit --new-window ${javaCloudFiles} & #read? AddNetworkServiceProviderCmdTest.java 
	#@gedit --new-window ${javaMysqlConnFiles} & #read?
studypython:
	#@gedit --new-window ${pythonCloudFiles} & #read?
	@gedit --new-window ${pythonMysqlConnFiles} & #read?
pymysql:	
	@gedit --new-window $$(find ./resources/pymysql/ -type f \
		| grep -Ev '\.pyc$$') & #read? ER.py
studycpp:
	@gedit --new-window ${cppMysqlConnFiles} & #read?
	
	























