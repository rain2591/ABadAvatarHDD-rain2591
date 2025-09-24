# badavatarHDD-rain2591

ABadAvatarHDD is a HEX modified copy of ABadAvatar by Shutterbug (https://github.com/shutterbug2000/ABadAvatar) which is based on BadUpdate by Grimdoomer (https://github.com/grimdoomer/Xbox360BadUpdate)

ABadAvatarHDD is run from the Xbox360 Internal HDD instead of having to be run off of a USB stick, means no more USB sticks protruding from your system.

All stage and profile files are HEX modified to point to the HDD locations instead of MASS, all files in this github are tested and ready to go, included within the package are all the files to get your Xbox360 running straight to Aurora.

Included all ready to go in the package and setup:

Aurora 0.7b.2 (https://phoenix.xboxunity.net/)
Proto V2.4 (https://www.freestealth.com/)
XeUnshackle 1.03 Autostart (https://github.com/Byrom90/XeUnshackle/pull/54)
AbadAvatarHDD (https://github.com/rain2591/badavatarHDD-rain2591/)
NXE Aurora Skin (https://www.realmodscene.com/index.php?/topic/18985-auroranxe-nxe-skin-layout-for-aurora-07b/)

No messing about with launch.ini as by default it is setup ready to go

1) Drag the files into your Xbox360 Internal Hard Drive with what ever method you like
2) Power on your Xbox360 and wait for ABadAvatarHDD to load into Aurora Dashboard
3) Configure your Content Paths to add your games to the Aurora Dashboard
4) Play ;)


*IMPORTANT NOTE*

If Proto server plugin is enabled as it is by default then Original Xbox games will fail to load so make sure you edit the Launch.ini in the root of the Xbox360 Hard Drive.

1) Open launch.ini in root of your Xbox360 hard drive
2) Scroll down to the section that says [PLUGINS] and go to plugin number 2 and place a ; at beginning of line so it reads as ;plugin2 = Hdd:\Aurora\Plugins\Proto.xex instead of plugin2 = Hdd:\Aurora\Plugins\Proto.xex
3) Save the file and load Xbox360 and Proto plugin will be disabled so you can play Xbox Original games.
