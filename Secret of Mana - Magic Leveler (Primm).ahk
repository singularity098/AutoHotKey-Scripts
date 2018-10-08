;
;           Script:  Secret of Mana - Magic Leveler (Primm)
;    Script Author:  singularity098
;          Created:  2018-10-06
;          Version:  v0.2
;    Last Modified:  2018-10-08
;
;    Preconditions:  1. All elementals are collected.
;                    2. Have enough MP to cast 1 spell from each
;                         elemental one time before replenish.
;                    3. At Wind Temple, facing north touching the
;                         old man ready to chat with him.
;                    4. Selected character is Primm.
;                    5. Menu ring is up, on spell elemental
;                         selector, Dryad highlighted.
;                    6. Gamepad is turned off... using keyboard.
;

TrayTip, AutoHotkey, Successfully loaded script..., 1, 17



; Magic Leveler
^!m::
TrayTip, AutoHotkey, Secret of Mana - Magic Leveler (Primm) Initiated..., 5, 17

; Assign keyboard keys to human readable variables
ButtonUp    := "w"
ButtonLeft  := "a"
ButtonDown  := "s"
ButtonRight := "d"
ButtonMenu  := "b"
ButtonClose := "n"
ButtonOk    := "space"

; Close the menu... ***Dryad*** must be highlighted at start for the script to operate properly!!!
SendGameKey(ButtonClose)

Loop
{
	Loop, 7
	{
		; Open menu and move one to the right, to select next elemental
		SendGameKey(ButtonMenu)
		SendGameKey(ButtonRight)
		SendGameKey(ButtonOk)
		
		; Send different amount of "lefts" depending upon which elemental spirit in the loop
		
		if A_Index = 1      ; Lumina, Lucid Barrier
		{
			SendGameKey(ButtonLeft)
		}
		else if A_Index = 2 ; Gnome, Defender
		{
			SendGameKey(ButtonLeft)
		}
		else if A_Index = 3 ; Undine, Remedy
		{
			SendGameKey(ButtonLeft)
			SendGameKey(ButtonLeft)
		}
		else if A_Index = 4 ; Salamando, Flame Saber
		{
			Sleep 800
		}
		else if A_Index = 5 ; Sylphid, Thunder Saber
		{
			Sleep 800
		}
		else if A_Index = 6 ; Luna, Moon Energy
		{
			SendGameKey(ButtonLeft)
		}
		else if A_Index = 7 ; Dryad, Wall
		{
			SendGameKey(ButtonLeft)
		}
		
		; Cast the spell on party member
		SendGameKey(ButtonOk)
		SendGameKey(ButtonRight)
		SendGameKey(ButtonOk)
		
		; Wait for a little bit to finish casting
		Sleep 4000
		
	}
	
	; At this point have casted one spell from each elemental, time to talk to the old man and restore MP
	SendGameKey(ButtonUp)
	SendGameKey(ButtonOk, 2000) ; Extra wait time added, for slower menu here
	SendGameKey(ButtonOk, 2000)
	SendGameKey(ButtonRight)
	SendGameKey(ButtonOk, 2000)
	SendGameKey(ButtonOk, 2000)
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



SendGameKey(GameButton, RestPeriod := 800, KeyStrokeDuration := 60)
{
	SendInput {%GameButton% down}
	Sleep %KeyStrokeDuration% ; Hold down briefly to ensure game registers the keystroke

	SendInput {%GameButton% up}
	Sleep %RestPeriod% ; Added delay after the keystroke is finished, optional parameter
}


