function GameListFilterXbox360(Content)
   -- Add only legit xbox 360 games
   return Content.Group == ContentGroup.Xbox360
end

function GameListFilterXBLA(Content)
   -- Add only Xbox Live Arcade games
   return Content.Group == ContentGroup.XBLA
end

function GameListFilterIndie(Content)
   -- Add only XNA games 
   return Content.Group == ContentGroup.Indie
end

function GameListFilterXboxClassic(Content)
   -- Add only Xbox Classic Games
   return Content.Group == ContentGroup.XboxClassic
end

function GameListFilterKinect(Content)
	-- Return if this game is a kinect game
	return bit32.btest( Content.Flags, ContentFlag.KinectCompatible )
end

function GameListFilterApplications(Content)
	-- Return if this has the script variable Applications
	return Content.ScriptData == 'Applications'
end

function GameListFilterHomebrew(Content)
	-- Return if this has the script variable homebrew
	return Content.ScriptData == 'Homebrew'
end

function GameListFilterEmulators(Content)
	-- Return if this has the script variable emulators
	return Content.ScriptData == 'Emulators'
end

function GameListFilterConnectX(Content)
	-- Return if this has ConnectX as root
	return ((string.find(string.lower(Content.Root), 'connx:\\', 1)) or (string.lower(Content.ScriptData) == 'connectx'))
end

function GameListFilterDisc(Content)
  -- Return if this Content is a DiscTitle
  return bit32.btest( Content.Flags, ContentFlag.DiscTitle )
end