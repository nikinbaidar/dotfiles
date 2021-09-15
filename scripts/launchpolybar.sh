
# Terminate already running bar instances
killall -q polybar

if type "xrandr" > /dev/null ; then
  for monitor in $(xrandr --query | grep "connected" | cut -d " " -f1)
  do
    MONITOR=$monitor polybar --reload example >& /dev/null &
  done
else
  polybar --reload example >& /dev/null &
fi

