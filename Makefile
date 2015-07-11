
### HINTS
# "cat .git/refs/heads/master" shows head of master branch, ie a commit id
edit:
	@sudo gedit \
		.git/config .git/info/exclude \
		Makefile \
		string.c \
		&#

vad:
	@gedit --new-window Makefile \
		./pythonConverter/3to2 \
		.git/config .git/info/exclude \
		string_operations.c \
		&#
		
convert:
	@./pythonConverter/3to2	-w ./palindrome/palindrome.py	
		
		
file:
	@g++ -Wall -o ./src/a.out ./src/string_operations.c

run:
	@valgrind --leak-check=full ./src/a.out

