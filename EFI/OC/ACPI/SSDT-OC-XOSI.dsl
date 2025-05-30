//
// In config ACPI, OSID to XSID
// Find:     4F534944
// Replace:  58534944
//
// In config ACPI, _OSI to XOSI
// Find:     5F4F5349
// Replace:  584F5349
//
// Search _OSI......
//
// https://github.com/dortania/Getting-Started-With-ACPI/blob/master/extra-files/decompiled/SSDT-XOSI.dsl
//
// How to identify the Windows version in ACPI by using _OSI
// https://learn.microsoft.com/en-us/windows-hardware/drivers/acpi/winacpi-osi#_osi-strings-for-windows-operating-systems
DefinitionBlock("", "SSDT", 2, "ACDT", "OC-XOSI", 0)
{
    Method(XOSI, 1)
    {
        If (_OSI ("Darwin"))
        {
//            If (Arg0 == //"Windows 2009"  //  = win7, Win Server 2008 R2
//                        //"Windows 2012"  //  = Win8, Win Server 2012
//                        //"Windows 2013"  //  = win8.1
//                        "Windows 2015"  //  = Win10 // using this before
//                        //"Windows 2016"  //  = Win10 version 1607
//                        //"Windows 2017"  //  = Win10 version 1703
//                        //"Windows 2017.2"//  = Win10 version 1709
//                        //"Windows 2018"  //  = Win10 version 1803
//                        //"Windows 2018.2"//  = Win10 version 1809
//                        //"Windows 2019"  //  = Win10 version 1903
//                )
//            {
//                Return (0xFFFFFFFF)
//            }

            // Windows 2021 -> Windows 11
            If ( Arg0 == "Windows 2021" )
            {
                Return (0xFFFFFFFF)
            }

            
            Else
            {
                Return (Zero)
            }
        }
        
        Else
        {
            Return (_OSI (Arg0))
        }
    }
}
//EOF
