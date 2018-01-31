clear all; clc ; close all

map = load('map.txt');
map = map(end:-1:1, :);

local_costmap = load('local_costmap.txt');
local_costmap = local_costmap(end:-1:1, :);

global_costmap = load('global_costmap.txt');
global_costmap = global_costmap(end:-1:1, :);

figure
imshow(map, [])
title('map')

figure
imshow(local_costmap, [])
title('local_costmap')

figure
imshow(global_costmap, [])
title('global_costmap')
