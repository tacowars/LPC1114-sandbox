swuart
=====================
Software UART example. This project is from a separately published
application note and demonstrates how to implement a software UART.
More details can be found in AN10955 "Full-duplex software UART for
LPC111x and LPC13xx" available at www.nxp.com.

In summary before trying this example, make sure that P0.11 and P1.7
are jumpered together on the EA baseboard. Also jumper P1.5 and P1.6.
Make sure that the jumper from PIO0_2 on J56 is in the "upper"
position closest to J51. The jumper to the potentiometer marked
PIO0_11 on J56 should also be removed. The baud rate is 9600 8/n/1.
