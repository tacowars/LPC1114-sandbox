rs485
=====================
Example project to demonstrate configuring rs485.

To test RS485 mode, connect two boards, one is set to TX and the
other is RX. The test is conducted on the inter-board communication.

To get the test result, program the boards with both TX and RX program, 
power up the board with the RX program first, start the debugger on the
board with the RX program, power up the board with the TX program, stop 
the debugger, and check the content of the UARTBuffer on the RX program,
it should be the same as seen on UARTTxBuffer, 0x01-0x02-0x03....

On both boards:
 change jumper j18 from PIO1_8 to PIO1_9
 remove jumper A from j7
 remove jumber 3-4 from j20

Connect j15 between the two boards in the following manner:
 board A   board B
  j15-1     j15-1
  j15-2     j15-4
  j15-3     j15-5
  j15-4     j15-2
  j15-5     j15-3

Note: both base boards MUST be powered via either USB connection, this example will not work if the base boards are powered only via LPC-Link.
