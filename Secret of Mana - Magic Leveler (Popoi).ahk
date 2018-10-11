;
;           Script:  Secret of Mana - Magic Leveler (Popoi)
;    Script Author:  singularity098
;          Created:  2018-10-08
;          Version:  v1.0
;    Last Modified:  2018-10-11
;
;    Preconditions:  1. Keyboard controls enabled, default mapping.
;                    2. All elementals are collected.
;                    3. Standing inside Mandala village, near entrance.
;                    4. Selected character is Popoi.
;                    5. BOTH of the other character's last used ring
;                         menu is the weapons ring.
;                    6. Popoi's menu ring is up, on spell elemental
;                         selector, Dryad highlighted.
;

TrayTip, AutoHotkey, Successfully loaded script..., 1, 17



; Magic Leveler
^!m::
TrayTip, AutoHotkey, Secret of Mana - Magic Leveler (Popoi) Initiated..., 5, 17

; Assign keyboard keys to human readable variables
ButtonUp     := "w"
ButtonLeft   := "a"
ButtonDown   := "s"
ButtonRight  := "d"
ButtonMenu   := "b"
ButtonAltMenu:= "h"
ButtonClose  := "n"
ButtonOk     := "space"

Weapon_Cycling := true

; Close the menu... ***Dryad*** must be highlighted at start for the script to operate properly!!!
SendGameKey(ButtonClose)

Loop
{
	Loop, 7
	{
		SendGameKey(ButtonDown, 3000, 2000)
		
		; Open menu and move one to the right, to select next elemental
		SendGameKey(ButtonMenu)
		SendGameKey(ButtonRight)
		SendGameKey(ButtonOk)
		
		; Send left or right to navigate to spell
		
		if A_Index = 1      ; Shade, Dark Force
		{
			SendGameKey(ButtonRight)
		}
		else if A_Index = 2 ; Gnome, Speed Down
		{
			SendGameKey(ButtonLeft)
		}
		else if A_Index = 3 ; Undine, Freeze
		{
			Sleep 800
		}
		else if A_Index = 4 ; Salamando, Fireball
		{
			Sleep 800
		}
		else if A_Index = 5 ; Sylphid, Air Blast
		{
			Sleep 800
		}
		else if A_Index = 6 ; Luna, Magic Absorb
		{
			SendGameKey(ButtonRight)
		}
		else if A_Index = 7 ; Dryad, Sleep Flower
		{
			Sleep 800
		}
		
		; Cast the spell on a bad guy
		SendGameKey(ButtonOk)
		SendGameKey(ButtonOk)
		
		; Attempt to close menu, just in case no bad guys to target
		SendGameKey(ButtonClose)
		SendGameKey(ButtonClose)
		
		; Additional wait for when Popoi is frozen from Magic Absorb
		if A_Index = 6
			Sleep 4000
		
		; Run around as to not get stuck, then return to town
		SendGameKey(ButtonLeft , 4300, 10)
		SendGameKey(ButtonRight, 600 , 10)
		SendGameKey(ButtonUp, 3000, 2500)
		
	}
	
	if (Mod(A_Index, 7) = 0) and (Weapon_Cycling = true)
	{
		; Change Popoi to different weapon
		SendGameKey(ButtonMenu)
		SendGameKey(ButtonDown)
		SendGameKey(ButtonRight)
		SendGameKey(ButtonOk)
		SendGameKey(ButtonOk)
		
		; Go back to magic menu
		SendGameKey(ButtonMenu)
		SendGameKey(ButtonUp)
		SendGameKey(ButtonMenu)
		
		; Change first ally to different weapon
		SendGameKey(ButtonAltMenu)
		SendGameKey(ButtonRight)
		SendGameKey(ButtonOk)
		SendGameKey(ButtonOk)
		
		; Change second ally to different weapon
		SendGameKey(ButtonAltMenu)
		SendGameKey(ButtonAltMenu)
		SendGameKey(ButtonRight)
		SendGameKey(ButtonOk)
		SendGameKey(ButtonOk)
	}
	
}
Return



; Abort script!
^!a::
TrayTip, AutoHotkey, Killing AutoHotkey..., 5, 17
Sleep 1500
ExitApp
Return



; Reload the script
^!r::
TrayTip, AutoHotkey, Attempting to reload AutoHotkey script..., 5, 17
Sleep 1500
Reload
Return



; Test things here
^!t::
TrayTip, AutoHotkey, Test toast message, 5, 17
Return



SendGameKey(GameButton, KeyStrokeDuration := 60, RestPeriod := 800)
{
	SendInput {%GameButton% down}
	Sleep %KeyStrokeDuration% ; Hold down briefly to ensure game registers the keystroke

	SendInput {%GameButton% up}
	Sleep %RestPeriod% ; Added delay after the keystroke is finished, optional parameter
}


