require("user.novractions.bymaps.a1maps")
require("user.novractions.bymaps.a2maps")

local lastPosx = 0.0
local lastPosy = 0.0
local lastPosz = 0.0

Convars:RegisterCommand("getPlayerPositionExtraAction", function()
	
	local player = Entities:GetLocalPlayer()
	local playerPosition = player:EyePosition()

	if lastPosx == playerPosition.x and lastPosy == playerPosition.y and lastPosz == playerPosition.z then
		return
	end

	lastPosx = playerPosition.x
	lastPosy = playerPosition.y
	lastPosz = playerPosition.z

	mapName = GetMapName()

	print(mapName)
	print(string.format("%f, %f, %f", playerPosition.x, playerPosition.y, playerPosition.z))

	if mapName == "a1_intro_world" then
		if a1IntroWorld(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a1_intro_world_2" then
		if a1IntroWorld2(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a2_quarantine_entrance" then
		if a2QuarantineEntrance(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a2_pistol" then
		if a2Pistol(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a2_hideout" then
		if a2Hideout(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a2_headcrabs_tunnel" then
		if a2HeadcrabsTunnel(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a2_drainage" then
		if a2Drainage(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

	if mapName == "a2_train_yard" then
		if a2TrainYard(playerPosition) then
			print("Wow something happened with VR interact")
		end
	end

end, "Player Pos!", 0)

Convars:RegisterCommand("give_me_pistol", function()
	if caWeUsePistol() then
		SendToConsole("give weapon_pistol; givecurrentammo")
	end
end, "Toggles the flashlight", 0)

Convars:RegisterCommand("give_me_shotgun", function()
	if caWeUseShotgun() then
		SendToConsole("give weapon_shotgun; givecurrentammo")
	end
end, "Toggles the flashlight", 0)

--Checkick current play progress

function canWeUseFlashLight()

	mapName = GetMapName()

	if mapName == "a1_intro_world" or mapName == "a1_intro_world_2" or mapName == "a2_quarantine_entrance" or mapName == "a2_pistol" or mapName == "a2_hideout" then
		return false
	end

	if mapName == "a2_headcrabs_tunnel" then
		return isFlashlightTaken
	end

	return true
end 

function caWeUsePistol()

	mapName = GetMapName()

	if mapName == "a1_intro_world" or mapName == "a1_intro_world_2" then
		return false
	end

	return true
end 

function caWeUseShotgun()

	mapName = GetMapName()

	if mapName == "a1_intro_world" or mapName == "a1_intro_world_2" or mapName == "a2_quarantine_entrance" or mapName == "a2_pistol" or mapName == "a2_hideout" then
		return false
	end

	if mapName == "a2_headcrabs_tunnel" then
		return isShotGunTaken
	end

	return true
end 