
require("user.novractions.isInRange")

local answeredEliCall = false
local first_light_switch_enabled = true

function a1IntroWorld(playerPosition)
	--Answer Eli.s call
	if isInRange(playerPosition, -241.84, 1874.76, 246.07) then
		SendToConsole("ent_fire call_button_relay trigger")
		answeredEliCall = true
		return true
	end

	--Open greenhouse door
	if isInRange(playerPosition, -193.66857910156, 1802.1606445313, 246.07470703125) and answeredEliCall then
		SendToConsole("ent_remove greenhouse_door")
		return true
	end

	--first light switcher
	if isInRange(playerPosition, -868.849365, 1683.975586, 118.074722) then
		if first_light_switch_enabled then
			first_light_switch_enabled = false
			SendToConsole("ent_fire 205_6594_switch_off_relay trigger")
		else
			first_light_switch_enabled = true
			SendToConsole("ent_fire 205_6594_switch_on_relay trigger")
		end
		return true
	end

	--call first elevator
	if isInRange(playerPosition, -897.075256, 1710.025635, 118.074715) then
		SendToConsole("ent_fire debug_roof_elevator_call_relay trigger")
		return true
	end

	--first elavator teleport
	if isInRange(playerPosition, -948.063660, 1716.333008, 118.074707) then
		SendToConsole("ent_fire debug_elevator_relay trigger")
		return true
	end

	--break vent door
	if isInRange(playerPosition, 531.130920, -2335.440186, -120.570938) then
		SendToConsole("ent_fire 563_vent_door break")
		return true
	end

	--second elavator teleport
	if isInRange(playerPosition, 590.702209, -2340.974365, -217.718750) then
		SendToConsole("ent_fire relay_start_hallway_scene trigger")
		return true
	end
	
	return false
end 

local headsetOn = false

function a1IntroWorld2(playerPosition)
	--put on headset
	if isInRange(playerPosition, -1370.488647, 2311.687012, -58.980598) then
		SendToConsole("ent_fire debug_relay_put_on_headphones trigger")
		headsetOn = true
		return true
	end

	--crouch out car
	if isInRangeMedium(playerPosition, -1370.488647, 2311.687012, -58.980598) and headsetOn then
		SendToConsole("setpos -1436.638062 2368.752686 -52.497437;setang 9.711599 -110.431732 0.000000")
		return true
	end

	--climb ladder
	if isInRange(playerPosition, -1268.335327, 576.023926, -63.968750) then
		SendToConsole("setpos -1295.331177 576.093567 128.031250;setang 0.405739 -178.980408 0.000000")
		return true
	end

	--close car.s door
	if isInRange(playerPosition, -1014.229004, 1224.372925, -63.968750) then
		SendToConsole("ent_fire 4962_car_door_left_front close")
		return true
	end

	--open russel.s entry window
	if isInRange(playerPosition, -1729.116455, 333.028564, 136.031250) then
		SendToConsole("ent_remove russell_entry_window")
		return true
	end

	--Open rassel.s door
	if isInRange(playerPosition, -1752.979736, 107.954437, 146.114548) then
		SendToConsole("ent_fire locker_open_relay trigger")
		return true
	end

	--Put on gloves, skip training
	if isInRange(playerPosition, -2174.139648, -54.692318, 153.559082) then
		SendToConsole("map a2_quarantine_entrance")
		return true
	end

	return false
end