// FnDebug for ideapad 720s 13ikb
// In config ACPI, _Q11 to XQ11
// Find:     5F 51 31 31
// Replace:  58 51 31 31

// In config ACPI, _Q12 to XQ12
// Find:     5F 51 31 32
// Replace:  58 51 31 32
DefinitionBlock("", "SSDT", 2, "ACDT", "FnDebug", 0)
{
    External(_SB.PCI0.LPCB.PS2K, DeviceObj)
    External(_SB.PCI0.LPCB.EC0, DeviceObj)
    External(_SB.PCI0.LPCB.EC0.XQ11, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ12, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ15, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ16, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ20, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ1D, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ25, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ37, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ38, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ31, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ32, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ3E, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ3F, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ44, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ62, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ63, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ66, MethodObj)
    External(_SB.PCI0.LPCB.EC0.XQ67, MethodObj)
    
    External(RMDT.P1, MethodObj)
    
    Scope (_SB.PCI0.LPCB.EC0)
    {
        /*
        Method (_Q11, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q11")
            }
            \_SB.PCI0.LPCB.EC0.XQ11()
        }
    
        Method (_Q12, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q12")
            }
            \_SB.PCI0.LPCB.EC0.XQ12()
        }
        */
        
        Method (_Q15, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q15")
            }
            \_SB.PCI0.LPCB.EC0.XQ15()
        }
        
        Method (_Q16, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q16")
            }
            \_SB.PCI0.LPCB.EC0.XQ16()
        }
        
        Method (_Q20, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q20")
            }
            \_SB.PCI0.LPCB.EC0.XQ20()
        }
        
        Method (_Q1D, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q1D")
            }
            \_SB.PCI0.LPCB.EC0.XQ1D()
        }
        
        Method (_Q25, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q25")
            }
            \_SB.PCI0.LPCB.EC0.XQ25()
        }
        
        Method (_Q37, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q37")
            }
            \_SB.PCI0.LPCB.EC0.XQ37()
        }
        
        Method (_Q38, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q38")
            }
            \_SB.PCI0.LPCB.EC0.XQ38()
        }
        
        Method (_Q31, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q31")
            }
            \_SB.PCI0.LPCB.EC0.XQ31()
        }
        
        Method (_Q32, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q32")
            }
            \_SB.PCI0.LPCB.EC0.XQ32()
        }
        
        Method (_Q3E, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q3E")
            }
            \_SB.PCI0.LPCB.EC0.XQ3E()
        }
        
        Method (_Q3F, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q3F")
            }
            \_SB.PCI0.LPCB.EC0.XQ3F()
        }
        
        Method (_Q44, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q44")
            }
            \_SB.PCI0.LPCB.EC0.XQ44()
        }
        
        Method (_Q62, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q62")
            }
            \_SB.PCI0.LPCB.EC0.XQ62()
        }
        
        Method (_Q63, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q63")
            }
            \_SB.PCI0.LPCB.EC0.XQ63()
        }
        
        Method (_Q66, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q66")
            }
            \_SB.PCI0.LPCB.EC0.XQ66()
        }
        
        Method (_Q67, 0, NotSerialized)
        {
            If (_OSI ("Darwin"))
            {
                \RMDT.P1 ("FnDebug _Q67")
            }
            \_SB.PCI0.LPCB.EC0.XQ67()
        }
    }
}
//EOF
