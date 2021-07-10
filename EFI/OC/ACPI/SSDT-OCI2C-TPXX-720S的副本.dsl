// TPxx is my new's device
DefinitionBlock("", "SSDT", 2, "ACDT", "I2C-TPXX", 0)
{
    External(_SB.PCI0.I2C1, DeviceObj)
    External(TPTY, FieldUnitObj)
    External(GPEN, FieldUnitObj)
    External(OSYS, FieldUnitObj)
    External(CDSM, MethodObj)
    External(INUM, MethodObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            // disable TPD0
            TPTY = 0
        }
    }
    
    //path:_SB.PCI0.I2C1.TPD0
    Scope (_SB.PCI0.I2C1)
    {
        Device (TPXX)
        {
            Name (HID2, Zero)
            Name (SPED, Zero)
            Name (BADR, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                /*
                If (_OSI ("Darwin"))
                {
                    Store (0x07DF, OSYS)
                }
                */
                
                Store ("MSFT0001", _HID) /* \_SB_.PCI0.I2C1.TPXX._HID */
                Store (0x15, BADR) /* \_SB_.PCI0.I2C1.TPXX.BADR */
                Store (One, HID2) /* \_SB_.PCI0.I2C1.TPXX.HID2 */

                Store (0x00061A80, SPED) /* \_SB_.PCI0.I2C1.TPXX.SPED */
                Return (Zero)
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                //Return (CDSM (Arg0, Arg1, Arg2, Arg3, HID2))
                If (LEqual (Arg0, ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
	            {
	                If (LEqual (Arg2, Zero))
	                {
	                    If (LEqual (Arg1, One))
	                    {
	                        Return (Buffer (One)
	                        {
	                             0x03                                             // .
	                        })
	                    }
	                }

	                If (LEqual (Arg2, One))
	                {
	                    Return (One)
	                }
	            }

	            Return (Buffer (One)
	            {
	                 0x00                                             // .
	            })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (0x00)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                Name (SBFB, ResourceTemplate ()
                {
                    I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                        0x00, ResourceConsumer, , Exclusive,
                        )
                })

                Name (SBFG, ResourceTemplate ()
                {
                    GpioInt (Level, ActiveLow, ExclusiveAndWake,PullDefault,0x0000,
                        "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                    )
                    {
                        // Pin list
                        0x1B
                    }
                })
                
                return (ConcatenateResTemplate (SBFB, SBFG))
                
            }

        }
    }

}
//EOF