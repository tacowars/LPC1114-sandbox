LPCXpresso examples template
============================
Welcome to the LPCXpresso examples template project. This project is
a project factory that can be used to create other projects. The
basic example project will have access to the driver library.

To set up a new project, use the following steps:

1. Browse to the "Import and Export" section of the LPCXpresso
Quickstart Panel in the lower left quadrant of the LPCXpresso
workspace. Click "Smart Import Wizard."

2. Find your workspace- to do this, click "template" in the bottom
of the LPCXpresso window boarder. You should get a file browser
showing where the template project is saved on your PC. Please make
a note of this path for the next step.

3. Browse for the lpc11xx_template.xml "Wizard Script" in the template
project. This script will be located inside the template project in
your LPCXpresso Workspace (the same directory as this readme file) now
click Next.

4. Enter a project name, without spaces. Then click Next to move to
the next panel in the wizard.

5. Select your clock settings. You can choose to enable the crystal
oscillator. This provides the best frequency stability but requites a
crystal on your target board. You can also choose the PLL multiplier
which determines the part's speed. Usually the crystal is 12 MHz and
the default PLL multiplier of x4 results in 48 MHz operation. Now
click Next.

6. The next panel in the wizard allows you to select which drivers
will be included in your new project. Choose the ones you want then
click Next.

7. This is the last panel and includes more driver options. You may now
click Finish. The new project will be created.

Note: There are three common subfolders in each project. The three
subfolders are cmsis, driver, and linker. In our system we use svn to
manage these by adding an externals property to the project. These
subfolders are included in the projects rather than referenced as a
library because they have many conditional compile options to save
code space.


Template project organization
=============================
template/
	config/
		cr_startup_lpc11.c	LPCXpresso startup code by Code Red
		driver_config.h		Configuration file for driver library
		system_LPC??xx.h	Configuration file for clock init code
		target_config.h		Configuration for board- used by "user
							code" under src/. Often contains things
							like time delays and LED port pins.
	src/
		blinky_main.c		Demo LED blinking program. Put your
							code in this directory.
		
	----- The files below are intended to be shared not modified -----
	cmsis/
		LPC11xx.h, core_cm0.[c|h]
							chip and core header files
		system_LPC11xx.c	standard clock initialization code
	driver/
		adc.c, uart.c, etc.
							This is a thin driver/hal library.
	linker/
		lpc1114_flash_crp.ld...
							Linker scripts. Use the files that do not
							end in _lib or _mem. The _lib.ld and _mem.ld
							files are included by the other files. The
							_crp_ scripts reserve a location for the Code
							Read Protection word. They also move SystemInit
							and a few other functions to flash between the
							end of the vector table and the CRP word.
							
							Normally LPCXpresso dynamically generates
							linker scripts, however these linker scripts
							are static and need to be updated to support
							different chips. This provides more freedom
							to utilize the on-chip ROM drivers or use the
							CRP feature.
