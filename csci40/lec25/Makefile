# This is a Makefile comment

# every rule looks like:
# target: ingredient1 ingredient2 ...
# 											terminal commands to
# 											make the target
# 											from the ingredients

main: main.o searching.o
	g++ main.o searching.o -o main

main.o: main.cpp
	g++ -c main.cpp

searching.o: searching.cpp
	g++ -c searching.cpp


