wdt
=====================
This project shows how to set up the watchdog timer and then detect
when it has timed out and reset the part.

When this example is first started, it blinks an LED. After the
watchdog timer times out, the part will be reset. If the project is
being run in the debugger, the debugger will stop at this point. If
it is being run stand-alone, the LPC chip will reset and the code
will check the reset status. If the reset status shows that a WDT
timeout has reset the part, it will begin to blink the LED at a fast
speed to indicate that a WDT timeout was detected. The watchdog
timeout is set to about five seconds.
