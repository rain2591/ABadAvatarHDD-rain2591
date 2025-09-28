scriptTitle = "Set Fan Speed"
scriptAuthor = "Gavin_Darkglider"
scriptVersion = 1
scriptDescription = "Set Fan Speed To A Specific Percentage"

scriptPermissions = { "kernel" };
FanSpeedPercent=55; -- Set Percentage Here
function main()

	-- Main entry point to script
	print("-- " .. scriptTitle .. " Started..."); --Debug Info
	--Could add Mesagebox, but I am lazy, and if it works, you should hear fan speed up.
	if Kernel.SetFanSpeed(FanSpeedPercent) then
			print("-- " .. scriptTitle .. " Fan Speed Set Correctly...");
	else
			print("-- " .. scriptTitle .. " Fan Speed Not Set Correctly...")
	end

	print("-- " .. scriptTitle .. " Ended...");

end
