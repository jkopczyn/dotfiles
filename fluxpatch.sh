dbus-monitor --session "type='signal',interface='com.ubuntu.Upstart0_6'" | \
(
  while true; do
    read X
    if echo $X | grep "desktop-unlock" &> /dev/null; then
      echo -n "Restarting daemon: "$NAME
      start-stop-daemon --stop --quiet --oknodo --retry 30 --name "fluxgui"
      start-stop-daemon --start --quiet  --name "fluxgui"
      echo "."
      ;;
    fi
  done
)
