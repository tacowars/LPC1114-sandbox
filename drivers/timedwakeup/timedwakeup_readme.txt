timedwakeup example
============================
Welcome to the timedwakeup example project.
This project demonstrates how to put the LPC1114 into deep sleep mode
and wake it back up using a timer. Before using this example, you
should be familiar with using the ISP mode on-chip serial bootloader
to recover debug access to a part. This is because most debuggers will
not enter debug mode if the part is in deep sleep or if it enters deep
sleep while the debugger is communicating to it.

The debug version of this example does not go into deep sleep mode, it
only goes into sleep mode. The debug version is useful to step through
the code and see how it works. The Release version actually enters deep
sleep mode.

To wake the part up, the watchdog oscillator is set to the slowest
speed (near 8 kHz) and used to drive the main CPU clock in deep sleep
mode. This allows the lowest possible current consumption with on-chip
self-wakeup. To improve wakeup time, it is possible to run the watchdog
oscillator at a slightly faster speed at the cost of higher deep sleep
current. Currently we recommend only changing the divisor of the WDO-
the DIVSEL bits in the WDTOSCCTRL register. This will allow clock
speeds up to 500 kHz. It is not supported to change FREQSEL and enable
faster WDO freqencies in deep sleep mode.

