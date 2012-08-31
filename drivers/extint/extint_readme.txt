extint
=====================
This project demonstrates how to configure external interrupts. It
enables an interrupt on PIO2[1]. The interrupt does not have a
function, but it can be seen in the LPCXpresso debugger with a
breakpoint placed at PIOINT2_IRQHandler in gpio.c.
