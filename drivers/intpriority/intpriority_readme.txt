intpriority
============================
Welcome to the LPCXpresso intpriority example project. This project
demonstrates the interrupt priority features of the Cortex M0 or M3
CPU. It works by using the start logic GPIO interrupt features of
the NXP LPC1000 family microcontrollers to generate eight pending
interrupts set up to call eight seperate interrupt handlers. Then,
interrupts are enabled, and the order in which the interrupts are
processed is recorded. On the Cortex-M0 LPC1114 the results should
look similar to this:

 N: Vec Pri Pending Cycles
 0:   1   0     bce 0
 1:   7   0     bcc 125
 2:   2   1     b4c 256
 3:   8   1     b48 383
 4:   3   2     a48 511
 5:   9   2     a40 642
 6:   6   3     840 766
 7:  11   3     800 897

This shows that the natural interrupt priority is lower vector
numbers before upper vector numbers being overridden by the
interrupt priority which is lower priority number before higher
priority number.

One thing to note about this project is that it contains modified
startup code to implement the start logic interrupt vectors. The
standard startup code directs all 13 start logic pin interrupts to
a single vector, this modified startup code splits them so that
five of them direct to the STARTUP interrupt and 8 direct to
seperate interrupts.