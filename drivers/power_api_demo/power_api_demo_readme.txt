power_api_demo
=====================
This project demonstrates how to use the power API in ROM on some
newer LPC products. It is designed to run on the LPC1114/302 and
newer LPC11xx products. It cycles through 48 MHz operation, 24
MHz operation, 18 MHz, and 3 MHz operation. The results can be
seen if the code is stepped through in the debugger and the current
is monitored using an external ammeter.

Please note that this project is different from most of the
LPCXpresso examples; it does not execute SystemInit() to set up
the part clocking and PLL. This is caused by removing the __USE_CMSIS
define from the LPCXpresso Project, Properties, C/C++ Build, Settings,
Symbols dialog.