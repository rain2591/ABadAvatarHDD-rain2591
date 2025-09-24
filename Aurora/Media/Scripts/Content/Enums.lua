-- This is now hardcoded into c, so it can be called from both
--[[
function enum(table)
   return setmetatable({}, {
     __index = table,
     __newindex = function(table, key, value)
                    error("Attempt to modify read-only table")
                  end,
     __metatable = false
   });
end
--]]

-- Enum used for setting type
SettingType = enum {
  Unknown = 0,
  System = 1,
  User = 2,
  ScanPath = 3,
  Hidden = 4,
  Favorites = 5,
  Ratings = 6,
  RecentGames = 7,
  TitleUpdates = 8,
  Error = 9
}

-- Enum used for sorting
SortType = enum {
  Ascending   = 0,
  Descending  = 1
}

-- Enum used for groups
ContentGroup = enum {
	Start = 0,
	Hidden = 0,
	Xbox360 = 1,
	XBLA = 2,
	Indie = 3,
	XboxClassic = 4,
	Unsigned = 5,
	LibXenon = 6,
	Count = 7
}

AssetFlag = enum {
	Icon = 1,
	Banner = 2,
	Boxart = 4,
	Slot = 8,
	Background = 16,
	Screenshot = 32,
	Trailer = 67108864
}

ContentFlag = enum {
	KinectCompatible = 1,
	SystemLinkCompatible = 2,
	RetailSigned = 4,
	DevkitSigned = 8,
  DiscTitle = 32,
}

ContentGenre = enum {
	Other = 1,
	ActionAdventure = 2,
	Family = 4,
	Fighting = 8,
	Music = 16,
	Platformer = 32,
	RacingFlying = 64,
	RolePlaying = 128,
	Shooter = 256,
	StrategySimulation = 512,
	SportsRecreation = 1024,
	CardBoard = 2048,
	Classics = 4096,
	PuzzleTrivia = 8192
}

DvdMediaType = enum {
  None = 0,
  Xbox360Game = 1,
  XboxGame = 2,
  Unknown = 3,
  DVDAudio = 4,
  DVDMovie = 5,
  CDVideo = 6,
  CDAudio = 7,
  CDData = 8,
  Hybrid = 9,
  DVDHD = 10
}

DvdTrayState = enum {
  Closing = 1,
  Open = 2,
  Opening = 3,
  Closed = 4,
  Error = 5
}

-- print("Enums.lua done!")