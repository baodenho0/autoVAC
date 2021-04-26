#include <Math.au3>
#include <WinAPI.au3>
#include <WinAPIConstants.au3>
#include <WinAPIGdi.au3>
#include <WinAPISys.au3>
#include <WindowsConstants.au3>

Opt("TrayMenuMode",1)
Opt("TrayOnEventMode",1)

$author    = TrayCreateItem("Author")
TrayCreateItem("")
$thoat    = TrayCreateItem("Exit")

TrayItemSetOnEvent ($author, "author" )
TrayItemSetOnEvent ($thoat, "exit1" )

HotKeySet("-","hotKeyVAC")



While 1
    Sleep(5000)
WEnd

func exit1()
    Exit
EndFunc

Func author()
    $text = "Tac gia" & @CRLF & _
	"test"
TrayTip("Tac gia",$text,"",1)
EndFunc

Func hotKeyVAC()
   $window = WinGetHandle('[ACTIVE]')
   $centerAddress = centerAddress($window)

   $currentAdress = MouseGetPos();
   MouseClick('left', $currentAdress[0], $currentAdress[1], 1, 1)
   Sleep(20)
   MouseClick('left', $centerAddress[0] + 10, $centerAddress[1] + 10, 1, 1)
   MouseClick('left', $currentAdress[0], $currentAdress[1], 1, 1)
   Sleep(20)
   MouseClick('left', $centerAddress[0] + 10, $centerAddress[1] + 10, 1, 1)
   Send("{8}")
   MouseClick('left', $currentAdress[0], $currentAdress[1], 1, 1)

EndFunc


Func centerAddress($hWnd)
    Local $aWinGetPos = WinGetPos($hWnd)
    If Not IsArray($aWinGetPos) Then Return SetError(1, 0, 0)

   Local $results[2]
   $results[0] = $aWinGetPos[0]+($aWinGetPos[2]/2)
   $results[1] = $aWinGetPos[1]+($aWinGetPos[3]/2)

	Return $results
EndFunc
