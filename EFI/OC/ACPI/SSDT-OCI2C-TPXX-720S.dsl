// TPxx is my new's device
DefinitionBlock("", "SSDT", 2, "ACDT", "I2C-TPXX", 0)
{
    External(_SB.PCI0.I2C1, DeviceObj)
    External(TPTY, FieldUnitObj)
    External(GPEN, FieldUnitObj)
    External(CDSM, MethodObj)
    External(INUM, MethodObj)
    
    Scope (\)
    {
        If (_OSI ("Darwin"))
        {
            GPEN = 0
            TPTY = 1
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
                If (LEqual (TPTY, One))
                {
                    Store ("MSFT0001", _HID) /* \_SB_.PCI0.I2C1.TPXX._HID */
                    Store (0x15, BADR) /* \_SB_.PCI0.I2C1.TPXX.BADR */
                    Store (One, HID2) /* \_SB_.PCI0.I2C1.TPXX.HID2 */
                }

                If (LEqual (TPTY, 0x02))
                {
                    Store ("MSFT0001", _HID) /* \_SB_.PCI0.I2C1.TPXX._HID */
                    Store (0x2C, BADR) /* \_SB_.PCI0.I2C1.TPXX.BADR */
                    Store (0x20, HID2) /* \_SB_.PCI0.I2C1.TPXX.HID2 */
                }

                Store (0x00061A80, SPED) /* \_SB_.PCI0.I2C1.TPXX.SPED */
                Return (Zero)
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                Return (CDSM (Arg0, Arg1, Arg2, Arg3, HID2))
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If (_OSI ("Darwin"))
                {
                    Return (0x0F)
                }
                else
                {
                    If (LEqual (TPTY, Zero))
                    {
                        Return (Zero)
                    }
                    Else
                    {
                        Return (0x0F)
                    }
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If (LEqual (TPTY, One))
                {
                    Name (SBFB, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                }

                If (LEqual (TPTY, 0x02))
                {
                    Name (SBFS, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                }

                Name (SBFI, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, ExclusiveAndWake, ,, _Y1F)
                    {
                        0x00000000,
                    }
                })
                CreateDWordField (SBFI, \_SB.PCI0.I2C1.TPXX._CRS._Y1F._INT, INT2)  // _INT: Interrupts
                Store (INUM (0x02010003), INT2) /* \_SB_.PCI0.I2C1.TPXX._CRS.INT2 */
                
                // add by zhbchwin start
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
                // add by zhbchwin end
                
                If (LEqual (TPTY, One))
                {
                    // upd by zhbchwin start
                    //Return (ConcatenateResTemplate (SBFB, SBFI))
                    Return (ConcatenateResTemplate (SBFB, SBFG))
                    // upd by zhbchwin end
                }

                If (LEqual (TPTY, 0x02))
                {
                    // upd by zhbchwin start
                    //Return (ConcatenateResTemplate (SBFS, SBFI))
                    Return (ConcatenateResTemplate (SBFS, SBFG))
                    // upd by zhbchwin end
                }
                
                Return (ConcatenateResTemplate (SBFB, SBFG))
            }

            // del by zhbchwin start
            /*
            Method (TPRD, 0, Serialized)
            {
                Return (^^^LPCB.EC0.ECTP)
            }

            Method (TPWR, 1, Serialized)
            {
                Store (Arg0, ^^^LPCB.EC0.ECTP)
            }
            */
            // del by zhbchwin end
        }
    }

}
//EOF