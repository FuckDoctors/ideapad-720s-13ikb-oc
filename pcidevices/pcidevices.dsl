DefinitionBlock ("", "SSDT", 2, "HACK", "PCI", 0x00000000)
{
	External (_SB_.PCI0.MCHC, DeviceObj)
	Device (_SB.PCI0.MCHC)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers" },
				"device_type", Buffer () { "Host bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,0,0" },
			})
		}
	}
	External (_SB_.PCI0.IGPU, DeviceObj)
	Device (_SB.PCI0.IGPU)
	{
		Name (_ADR, 0x00020000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"framebuffer-con1-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
				"framebuffer-con3-type", Buffer () { 0x00, 0x08, 0x00, 0x00 },
				"framebuffer-con3-busid", Buffer () { 0x04, 0x00, 0x00, 0x00 },
				"enable-lspcon-support", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con3-has-lspcon", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"enable-hdmi20", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con0-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con1-has-lspcon", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con1-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con2-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con2-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
				"framebuffer-con3-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"device-id", Buffer () { 0x16, 0x59, 0x00, 0x00 },
				"framebuffer-con2-busid", Buffer () { 0x05, 0x00, 0x00, 0x00 },
				"enable-hdmi-dividers-fix", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con0-pipe", Buffer () { 0x12, 0x00, 0x00, 0x00 },
				"framebuffer-con2-index", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con2-has-lspcon", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con2-type", Buffer () { 0x00, 0x08, 0x00, 0x00 },
				"model", Buffer () { "Intel HD Graphics 620" },
				"AAPL,ig-platform-id", Buffer () { 0x00, 0x00, 0x1B, 0x59 },
				"framebuffer-con0-type", Buffer () { 0x00, 0x04, 0x00, 0x00 },
				"framebuffer-con1-index", Buffer () { 0xFF, 0xFF, 0xFF, 0xFF },
				"AAPL,slot-name", Buffer () { "Internal@0,2,0" },
				"device_type", Buffer () { "VGA compatible controller" },
				"framebuffer-patch-enable", Buffer () { 0x01, 0x00, 0x00, 0x00 },
				"framebuffer-con3-pipe", Buffer () { 0x0A, 0x00, 0x00, 0x00 },
				"framebuffer-con3-flags", Buffer () { 0x87, 0x01, 0x00, 0x00 },
			})
		}
	}
	External (_SB_.PCI0.B0D4, DeviceObj)
	Device (_SB.PCI0.B0D4)
	{
		Name (_ADR, 0x00040000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem" },
				"device_type", Buffer () { "Signal processing controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,4,0" },
			})
		}
	}
	External (_SB_.PCI0.XHC, DeviceObj)
	Device (_SB.PCI0.XHC)
	{
		Name (_ADR, 0x00140000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP USB 3.0 xHCI Controller" },
				"device_type", Buffer () { "USB controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,20,0" },
			})
		}
	}
	External (_SB_.PCI0.I2C0, DeviceObj)
	Device (_SB.PCI0.I2C0)
	{
		Name (_ADR, 0x00150000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP Serial IO I2C Controller #0" },
				"device_type", Buffer () { "Signal processing controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,21,0" },
			})
		}
	}
	External (_SB_.PCI0.I2C1, DeviceObj)
	Device (_SB.PCI0.I2C1)
	{
		Name (_ADR, 0x00150001)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP Serial IO I2C Controller #1" },
				"device_type", Buffer () { "Signal processing controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,21,1" },
			})
		}
	}
	External (_SB_.PCI0.IMEI, DeviceObj)
	Device (_SB.PCI0.IMEI)
	{
		Name (_ADR, 0x00160000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP CSME HECI #1" },
				"device_type", Buffer () { "Communication controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,22,0" },
			})
		}
	}
	External (_SB_.PCI0.RP04, DeviceObj)
	Device (_SB.PCI0.RP04)
	{
		Name (_ADR, 0x001c0000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP PCI Express Root Port #4" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,28,0" },
			})
		}
	}
	External (_SB_.PCI0.RP05, DeviceObj)
	Device (_SB.PCI0.RP05)
	{
		Name (_ADR, 0x001c0004)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP PCI Express Root Port #5" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,28,4" },
			})
		}
	}
	External (_SB_.PCI0.RP09, DeviceObj)
	Device (_SB.PCI0.RP09)
	{
		Name (_ADR, 0x001d0000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP PCI Express Root Port #9" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,0" },
			})
		}
	}
	External (_SB_.PCI0.LPCB, DeviceObj)
	Device (_SB.PCI0.LPCB)
	{
		Name (_ADR, 0x001f0000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point LPC Controller/eSPI Controller" },
				"device_type", Buffer () { "ISA bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,31,0" },
			})
		}
	}
	External (_SB_.PCI0.PPMC, DeviceObj)
	Device (_SB.PCI0.PPMC)
	{
		Name (_ADR, 0x001f0002)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP PMC" },
				"device_type", Buffer () { "Memory controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,31,2" },
			})
		}
	}
	External (_SB_.PCI0.HDEF, DeviceObj)
	Device (_SB.PCI0.HDEF)
	{
		Name (_ADR, 0x001f0003)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP HD Audio" },
				"layout-id", Buffer () { 0x16, 0x00, 0x00, 0x00 },
				"AAPL,slot-name", Buffer () { "Internal@0,31,3" },
				"device_type", Buffer () { "Audio device" },
			})
		}
	}
	External (_SB_.PCI0.SBUS, DeviceObj)
	Device (_SB.PCI0.SBUS)
	{
		Name (_ADR, 0x001f0004)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "Sunrise Point-LP SMBus" },
				"device_type", Buffer () { "SMBus" },
				"AAPL,slot-name", Buffer () { "Internal@0,31,4" },
			})
		}
	}
	External (_SB_.PCI0.RP05.PXSX, DeviceObj)
	Device (_SB.PCI0.RP05.PXSX)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "NVMe SSD Controller SM961/PM961" },
				"device_type", Buffer () { "Non-Volatile memory controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,28,4/0,0" },
			})
		}
	}
	External (_SB_.PCI0.RP04.PXSX, DeviceObj)
	Device (_SB.PCI0.RP04.PXSX)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"device_type", Buffer () { "Airport Extreme" },
				"model", Buffer () { "BCM4350 802.11ac Wireless Network Adapter" },
				"name", Buffer () { "Airport" },
				"AAPL,slot-name", Buffer () { "WLAN" },
				"compatible", Buffer () { "pci14e4,4331" },
			})
		}
	}
	External (_SB_.PCI0.RP09.PXSX, DeviceObj)
	Device (_SB.PCI0.RP09.PXSX)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "JHL6340 Thunderbolt 3 Bridge (C step) [Alpine Ridge 2C 2016]" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,0/0,0" },
			})
		}
	}
	External (_SB_.PCI0.RP09.PXSX.TBDU, DeviceObj)
	Device (_SB.PCI0.RP09.PXSX.TBDU)
	{
		Name (_ADR, 0x00020000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "JHL6340 Thunderbolt 3 Bridge (C step) [Alpine Ridge 2C 2016]" },
				"device_type", Buffer () { "PCI bridge" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,0/0,0/2,0" },
			})
		}
	}
	External (_SB_.PCI0.RP09.PXSX.TBDU.XHC, DeviceObj)
	Device (_SB.PCI0.RP09.PXSX.TBDU.XHC)
	{
		Name (_ADR, 0x00000000)
		Method (_DSM, 4, NotSerialized)
		{
			If (LEqual (Arg2, Zero)) { Return (Buffer() { 0x03 } ) }
			Return (Package ()
			{
				"model", Buffer () { "JHL6340 Thunderbolt 3 USB 3.1 Controller (C step) [Alpine Ridge 2C 2016]" },
				"device_type", Buffer () { "USB controller" },
				"AAPL,slot-name", Buffer () { "Internal@0,29,0/0,0/2,0/0,0" },
			})
		}
	}
}
