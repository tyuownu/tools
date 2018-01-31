#!/bin/bash

rm local_costmap.rostopic global_costmap.rostopic map.rostopic
rm local_costmap.map global_costmap.map map.map

rostopic echo -n 1 /move_base_node/local_costmap/costmap > local_costmap.rostopic &
rostopic echo -n 1 /move_base_node/global_costmap/costmap > global_costmap.rostopic &
rostopic echo -n 1 /map > map.rostopic &


sleep 1

grep width global_costmap.rostopic > global_costmap.map
grep height global_costmap.rostopic >> global_costmap.map

grep width local_costmap.rostopic > local_costmap.map
grep height local_costmap.rostopic >> local_costmap.map

grep width map.rostopic > map.map
grep height map.rostopic >> map.map

# grep data global_costmap.rostopic | tee global_costmap.rostopic

grep data global_costmap.rostopic | sed -e 's/data//' -e 's/\://' -e 's/\[//' -e 's/\]//' >> global_costmap.map
grep data local_costmap.rostopic | sed -e 's/data//' -e 's/\://' -e 's/\[//' -e 's/\]//' >> local_costmap.map
grep data map.rostopic | sed -e 's/data//' -e 's/\://' -e 's/\[//' -e 's/\]//' >> map.map


python txt.py
