/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200925 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLUxRBlI.aml, Mon Oct 12 15:50:39 2026
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x000002A5 (677)
 *     Revision         0x02
 *     Checksum         0xF2
 *     OEM ID           "ACDT"
 *     OEM Table ID     "I2C-TPXX"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200925 (538970405)
 */
DefinitionBlock ("", "SSDT", 2, "ACDT", "I2C-TPXX", 0x00000000)
{
    External (_SB_.PCI0.I2C1, DeviceObj)
    External (_SB_.PCI0.LPCB.EC0_.ECTP, FieldUnitObj)
    External (GPEN, FieldUnitObj)
    External (OSYS, FieldUnitObj)
    External (TPTY, FieldUnitObj)

    Scope (\)
    {
        Name (TPTX, Zero)
        If (_OSI ("Darwin"))
        {
            TPTX = (TPTY + Zero) // Store the original TPTY value
            TPTY = Zero
            GPEN = One // GPI0 enable
        }
    }

    Scope (_SB.PCI0.I2C1)
    {
        Device (TPXX)
        {
            Name (HID2, Zero)
            Name (SPED, Zero)
            Name (BADR, Zero)
            Method (_INI, 0, NotSerialized)  // _INI: Initialize
            {
                /*This is the */
                If ((TPTX == One))
                {
                    _HID = "MSFT0001"
                    BADR = 0x15
                    HID2 = One
                }

                If ((TPTX == 0x02))
                {
                    _HID = "MSFT0001"
                    BADR = 0x2C
                    HID2 = 0x20
                }

                SPED = 0x00061A80
                Return (Zero)
            }

            Name (_HID, "XXXX0000")  // _HID: Hardware ID
            Name (_CID, "PNP0C50" /* HID Protocol Device (I2C bus) */)  // _CID: Compatible ID
            Name (_S0W, 0x03)  // _S0W: S0 Device Wake State
            Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
            {
                /* Rewrite _DSM method based on the original CDSM implementation to 
                get the device specification */
                
                If ((Arg0 == ToUUID ("3cdff6f7-4267-4555-ad05-b30a3d8938de") /* HID I2C Device */))
                {
                    If ((Arg2 == Zero))
                    {
                        If ((Arg1 == One))
                        {
                            Return (Buffer (One)
                            {
                                 0x03                                             // .
                            })
                        }
                    }

                    If ((Arg2 == One))
                    {
                        If ((TPTX == One))
                        {
                            Return (One)
                        }

                        If ((TPTX == 0x02))
                        {
                            Return (0x20)
                        }
                    }
                }

                Return (Buffer (One)
                {
                     0x00                                             // .
                })
            }

            Method (_STA, 0, NotSerialized)  // _STA: Status
            {
                If ((TPTX == Zero))
                {
                    Return (Zero)
                }
                Else
                {
                    Return (0x0F)
                }
            }

            Method (_CRS, 0, NotSerialized)  // _CRS: Current Resource Settings
            {
                If ((TPTX == One))
                {
                    Name (SBFB, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x0015, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                }

                If ((TPTX == 0x02))
                {
                    Name (SBFS, ResourceTemplate ()
                    {
                        I2cSerialBusV2 (0x002C, ControllerInitiated, 0x00061A80,
                            AddressingMode7Bit, "\\_SB.PCI0.I2C1",
                            0x00, ResourceConsumer, , Exclusive,
                            )
                    })
                }
                
                // GPIO-Pin Scope
                Name (SBFG, ResourceTemplate ()
                {
                    GpioInt (Level, ActiveLow, ExclusiveAndWake, PullDefault, 0x0000,
                        "\\_SB.PCI0.GPI0", 0x00, ResourceConsumer, ,
                        )
                        {   /* All MSFT0001 touchpad 's GPIO pin in ideapad 720s-ikb 
                            is 0x1B */
                            0x001B
                        }
                })
                
                // Return to the original implementation
                If ((TPTX == One))
                {
                    Return (ConcatenateResTemplate (SBFB, SBFG))
                }

                If ((TPTX == 0x02))
                {
                    Return (ConcatenateResTemplate (SBFS, SBFG))
                }
            }
        }
    }
}

