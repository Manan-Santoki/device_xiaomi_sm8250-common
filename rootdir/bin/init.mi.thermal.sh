# Force Fast Charging
if [ -e /sys/kernel/fast_charge/force_fast_charge ]; then
    chmod 0664 /sys/kernel/fast_charge/force_fast_charge
    echo 1 > /sys/kernel/fast_charge/force_fast_charge
fi

# Battery Input Suspend
if [ -e /sys/class/power_supply/battery/battery_input_suspend ]; then
    chmod 0664 /sys/class/power_supply/battery/battery_input_suspend
    echo 1 > /sys/class/power_supply/battery/battery_input_suspend
fi

# Delay before thermal change
sleep 20

# Thermal Evaluation Override
# sconfig 0 = default/balanced scenario (10 = benchmark, no thermal limits).
# Force the balanced scenario at boot so thermals are not disabled by default.
if [ -e /sys/class/thermal/thermal_message/sconfig ]; then
    chmod 0664 /sys/class/thermal/thermal_message/sconfig
    echo 0 > /sys/class/thermal/thermal_message/sconfig
fi
