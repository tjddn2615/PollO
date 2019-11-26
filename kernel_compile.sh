for x in /sys/devices/system/cpu/cpu*/online; do
  echo 1 >"$x"
done

# created by invain for the best performance when compiling kernel source.
realnum=`cat /proc/cpuinfo | grep cores | wc -l `
let bestnum=$realnum+$(printf %.0f `echo "$realnum*0.2"|bc`)

sudo make -j `echo $bestnum` && sudo make modules_install -j `echo $bestnum` && sudo make install -j `echo $bestnum`
