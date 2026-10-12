# Force Fast Charging
if [ -e /sys/kernel/fast_charge/force_fast_charge ]; then
    chmod 0664 /sys/kernel/fast_charge/force_fast_charge
    echo 1 > /sys/kernel/fast_charge/force_fast_charge
fi

# On pipa this node installs a zero-current USER charging vote.
# Leave charging policy to the charger and charging controls on that device.
if [ "$(getprop ro.product.vendor.device)" != "pipa" ] &&
        [ -e /sys/class/power_supply/battery/battery_input_suspend ]; then
    chmod 0664 /sys/class/power_supply/battery/battery_input_suspend
    echo 1 > /sys/class/power_supply/battery/battery_input_suspend
fi

# XiaomiParts owns pipa's vendor thermal scenario after boot.
# Do not overwrite an already restored per-app scenario with a delayed write.
if [ "$(getprop ro.product.vendor.device)" = "pipa" ]; then
    exit 0
fi

# Delay before restoring the default vendor scenario on other devices.
sleep 20
if [ -e /sys/class/thermal/thermal_message/sconfig ]; then
    chmod 0664 /sys/class/thermal/thermal_message/sconfig
    echo 0 > /sys/class/thermal/thermal_message/sconfig
fi
