
nn=$(date)
echo "normal: ${nn}" > timeR
cd /home/oracle/pengyuan/exp16/endtoend/per10X/
# mypython experiment_normal.py
/opt/rh/rh-python38/root/bin/python3.8 experiment_normal.py


nn=$(date)
echo "recuse: ${nn}" >> timeR
cd /home/oracle/pengyuan/exp16/endtoend/per10X/
# mypython experiment_recuse.py
/opt/rh/rh-python38/root/bin/python3.8 experiment_recuse.py


nn=$(date)
echo "increm: ${nn}" >> timeR
cd /home/oracle/pengyuan/exp16/endtoend/per10X/
# mypython experiment_inc.py
/opt/rh/rh-python38/root/bin/python3.8 experiment_inc.py


