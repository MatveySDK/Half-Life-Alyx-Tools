-- This method returns true if player in button range

function isInRange(playerPosition, tPx, tPy, tPz)
	local tDiff = 20.0

	local diffx = math.abs(tPx - playerPosition.x)
	local diffy = math.abs(tPy - playerPosition.y)
	local diffz = math.abs(tPz - playerPosition.z)

	if diffx<=tDiff and diffy<=tDiff and diffz<=tDiff then
		return true
	else
		return false
	end
end 

function isInRangeMedium(playerPosition, tPx, tPy, tPz)
	local tDiff = 60.0

	local diffx = math.abs(tPx - playerPosition.x)
	local diffy = math.abs(tPy - playerPosition.y)
	local diffz = math.abs(tPz - playerPosition.z)

	if diffx<=tDiff and diffy<=tDiff and diffz<=tDiff then
		return true
	else
		return false
	end
end 

function isInRangeLarge(playerPosition, tPx, tPy, tPz)
	local tDiff = 120.0

	local diffx = math.abs(tPx - playerPosition.x)
	local diffy = math.abs(tPy - playerPosition.y)
	local diffz = math.abs(tPz - playerPosition.z)

	if diffx<=tDiff and diffy<=tDiff and diffz<=tDiff then
		return true
	else
		return false
	end
end 