#!/usr/bin/env python
# coding=utf-8

#-----------------------------------------
#   >File Name: txt.py
#   > Main: tyuownu@gmail.com
#-----------------------------------------

# map process

f = open('map.map')
f_output = open('map.txt', 'w')

line = f.readline()

string = line.split()

width = int(string[1])
print width

line = f.readline()

height = int(line.split()[1])
print height

line = f.readline()
string = line.split(',')


for i in range(len(string)):
    if i % width == 0:
        f_output.write('\n')

    f_output.write(string[i]),

f_output.close()

# local map process

f = open('local_costmap.map')
f_output = open('local_costmap.txt', 'w')

line = f.readline()

string = line.split()

width = int(string[1])
print width

line = f.readline()

height = int(line.split()[1])
print height

line = f.readline()
string = line.split(',')


for i in range(len(string)):
    if i % width == 0:
        f_output.write('\n')

    f_output.write(string[i]),

f_output.close()

# global map process

f = open('global_costmap.map')
f_output = open('global_costmap.txt', 'w')

line = f.readline()

string = line.split()

width = int(string[1])
print width

line = f.readline()

height = int(line.split()[1])
print height

line = f.readline()
string = line.split(',')


for i in range(len(string)):
    if i % width == 0:
        f_output.write('\n')

    f_output.write(string[i]),

f_output.close()

