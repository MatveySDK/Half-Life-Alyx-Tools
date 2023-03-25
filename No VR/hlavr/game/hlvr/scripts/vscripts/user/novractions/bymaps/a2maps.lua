isFlashlightTaken = false
isShotGunTaken = false

require("user.novractions.isInRange")

local healthOneNotUsedQuarantineEntrance = true
local healthTwoNotUsedQuarantineEntrance = true

function a2QuarantineEntrance(playerPosition)
	--skip hacking first door
	if isInRange(playerPosition, -935.348755, 1150.334106, 114.031250) then
		SendToConsole("ent_remove powered_combine_door")
		return true
	end

	--use health 1
	if isInRange(playerPosition, -2472.797363, 2929.746582, 248.028778) and healthOneNotUsedQuarantineEntrance then
		healthOneNotUsedQuarantineEntrance = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--use health 2
	if isInRange(playerPosition, -1007.028015, 978.404114, 114.031250) and healthTwoNotUsedQuarantineEntrance then
		healthTwoNotUsedQuarantineEntrance = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--console open hatch
	if isInRange(playerPosition, -2574.286865, 2790.588135, 261.030670) then
		SendToConsole("ent_remove quarantine_door_seal")
		SendToConsole("setpos -2837.727783 2768.220703 73.239052;setang 3.999594 153.033340 0.000000")
		return true
	end

	return false
end

local healthOneNotUsedPistol = true

function a2Pistol(playerPosition)
	--skip door in train
	if isInRange(playerPosition, -548.031433, 896.532837, 450.341919) then
		SendToConsole("ent_fire 9074_relay_shot_rebar trigger")
		SendToConsole("setpos -465.353394 891.796448 425.560242;setang 0.556852 1.472902 0.000000")
		return true
	end

	--use health 
	if isInRange(playerPosition, 199.634445, 1349.359863, 449.735657) and healthOneNotUsedPistol then
		healthOneNotUsedPistol = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--skip door in train
	if isInRange(playerPosition, -1126.499146, 894.704956, 449.970795) then
		SendToConsole("ent_fire 9075_relay_shot_rebar trigger")
		SendToConsole("setpos -1201.959106 897.841187 419.872711;setang 0.327653 178.744278 0.000000")
		return true
	end

	return false
end

local healthOneNotUsedHideout = true

function a2Hideout(playerPosition)
	--skip first door
	if isInRange(playerPosition, 1090.016479, 1759.108887, 64.353554) then
		SendToConsole("ent_fire 4910_139_relay_rollerdoor_disable trigger")
		return true
	end

	--use health 
	if isInRange(playerPosition, 1320.333008, 1366.472900, 65.862518) and healthOneNotUsedHideout then
		healthOneNotUsedHideout = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--solve task
	if isInRange(playerPosition, 425.553040, 594.351318, -38.968765) then
		SendToConsole("ent_fire 8271_relay_puzzle_success trigger")
		return true
	end

	--start vort scene
	if isInRange(playerPosition, -703.498535, -1037.987305, -237.553833) then
		SendToConsole("ent_fire relay_start_greeting trigger")
		return true
	end
	
	return false
end

local healthOneHeadcrabsTunnel = true
local healthTwoHeadcrabsTunnel = true

function a2HeadcrabsTunnel(playerPosition)
	--shotgun skip
	if isInRange(playerPosition, 720.040466, 1299.201660, -142.875244) then
		SendToConsole("ent_fire 12712_relay_player_gets_shotgun trigger")
		SendToConsole("ent_fire 12712_relay_player_shotgun_is_ready trigger")
		SendToConsole("give weapon_shotgun; givecurrentammo")
		isShotGunTaken = true
		return true
	end

	--use health 
	if isInRange(playerPosition, 259.989380, -65.961914, -63.376022) and healthOneHeadcrabsTunnel then
		healthOneHeadcrabsTunnel = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end
	
	--climb ladder
	if isInRange(playerPosition, 348.095032, -245.742981, -63.665512) then
		SendToConsole("setpos 351.407501 -284.770874 47.282471;setang 5.481522 -93.205231 0.000000")
		return true
	end

	--disable shield
	if isInRange(playerPosition, -458.766174, -618.562439, 18.195522) then
		SendToConsole("ent_fire 8999_1355_cfence_relay_disable trigger")
		return true
	end

	--open twohander
	if isInRange(playerPosition, -848.134094, -432.036438, 16.516022) or isInRange(playerPosition, -846.231079, -432.975189, -19.365124) then
		SendToConsole("ent_fire twohander becomeragdoll")
		SendToConsole("ent_fire twohander alpha 0")
		SendToConsole("ent_fire 8999_2020_logic_relay_leaning_zombie trigger")
		return true
	end

	--get flashlight
	if isInRange(playerPosition, -1736.738892, 77.916885, -116.616608) then
		SendToConsole("ent_fire fake_flashlight_for_room turnoff")
		SendToConsole("ent_remove flashlight")
		isFlashlightTaken = true
		return true
	end

	--use health 
	if isInRange(playerPosition, 832.320862, -1223.341309, 16.030968) and healthTwoHeadcrabsTunnel then
		healthTwoHeadcrabsTunnel = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	return false
end

local healthOneDrainage = true
local healthTwoDrainage = true
local isVentTaken = false
local isVentTwoTaken = false

function a2Drainage(playerPosition)
	--use health 
	if isInRange(playerPosition, 3227.069580, -4201.796387, 176.562195) and healthOneDrainage then
		healthOneDrainage = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--open door
	if isInRange(playerPosition, 3172.733154, -4236.994141, 175.700439) then
		SendToConsole("ent_fire 2678_5785_door_hack_prop break")
		return true
	end

	--vent taken
	if isInRangeLarge(playerPosition, 284.065094, -2560.534912, 399.598999) then
		isVentTaken = true
		return true
	end

	--open rolldoor
	if isInRange(playerPosition, 366.495209, -2735.636230, 399.597290) and isVentTaken then
		SendToConsole("ent_fire 2678_4876_relay_rollerdoor_disable trigger")
		return true
	end

	--use health 
	if isInRange(playerPosition, 894.805115, -1574.657959, 34.371719) and healthTwoDrainage then
		healthTwoDrainage = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--vent two taken
	if isInRangeLarge(playerPosition, 942.240662, -1665.631470, 32.031372) then
		isVentTwoTaken = true
		return true
	end

	--open rolldoor two
	if isInRange(playerPosition, 1478.499023, -1854.142700, 96.033463) and isVentTwoTaken then
		SendToConsole("ent_fire 3338_2787_relay_rollerdoor_disable trigger")
		return true
	end

	return false
end

local healthOneTrainYard = true
local healthTwoTrainYard = true
local isConsoleFirstStepHacked = false
local isConsoleSecondtStepHacked = false
local isRailRoadSwitched = false

function a2TrainYard(playerPosition)

	--use health 
	if isInRange(playerPosition, 1983.699707, 842.788696, 105.018311) and healthOneTrainYard then
		healthOneTrainYard = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end

	--skip train doors
	if isInRange(playerPosition, 1479.101685, -31.258911, 104.031250) then
		SendToConsole("setpos 1433.514893 -28.784363 76.880226;setang 10.181714 -178.799408 0.000000")
		return true
	end

	--use health 
	if isInRange(playerPosition, 791.972351, 637.150513, 97.031250) and healthTwoTrainYard then
		healthTwoTrainYard = false
		Entities:GetLocalPlayer():SetHealth(100)
		return true
	end
	
	--disable shield wall
	if isInRange(playerPosition, 754.985413, 612.097107, 96.031242) then
		SendToConsole("ent_fire 5325_4712_cfence_relay_disable trigger")
		return true
	end

	--hack terminal first step
	if isInRange(playerPosition, -823.158203, -151.700806, 104.632484) then
		SendToConsole("ent_fire console_hacked_relay trigger")
		isConsoleFirstStepHacked = true
		return true
	end

	--hack terminal second step
	if isInRange(playerPosition, -826.071106, -182.865845, 104.031509) and isConsoleFirstStepHacked then
		SendToConsole("ent_fire console_handle_relay trigger")
		isConsoleSecondtStepHacked = true
		return true
	end

	--switch rail raod direction
	if isInRangeMedium(playerPosition, 75.830269, -29.070618, 110.191315) and isConsoleSecondtStepHacked then
		SendToConsole("ent_fire train_switch_relay trigger")
		isRailRoadSwitched = true
		return true
	end

	--hack traincar door
	if isInRange(playerPosition, -213.463196, 3989.798584, 53.974350) and isRailRoadSwitched then
		SendToConsole("ent_fire traincar_01_hack_relay trigger")
		return true
	end

	--trigger eli fall down
	if isInRangeMedium(playerPosition, -1058.481201, 3235.552246, -291.955780) then
		SendToConsole("ent_fire eli_fall_relay trigger")
		return true
	end

	--open door
	if isInRange(playerPosition, -1718.615112, 3322.905762, -451.968750) then
		SendToConsole("ent_fire 5325_4205_5030_door_hack_prop turnoff")
		SendToConsole("ent_fire 5325_4205_5030_door_hack_prop disablecollision")
		return true
	end

	return false
end