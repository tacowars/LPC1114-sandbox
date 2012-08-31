ssp
=====================
This project contains an ssp example for the LPCXpresso board. To use
it, compile it as master and slave (SSP_SLAVE=0) and program it into
two different boards. Information should be sent from the src_addr
buffer to the dest_addr buffer. Connect pins PIO0_2, PIO0_6, PIO0_8,
and PIO0_9 between both boards.The code can also be configured to
test loopback or work with an EEPROM.
