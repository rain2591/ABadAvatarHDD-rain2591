-- Require additional lua scripts
require("Enums")
require("FilterCategories.FilterCategoryGenres")
require("FilterCategories.FilterCategoryMisc")
require("FilterCategories.FilterCategoryUser")
require("FilterCategories.FilterCategoryName")
require("FilterFunctions")

--[[ 
	Create a global table that holds all our filter functions.
	Don't change the name of the table as Aurora looks
	for this specific table "GameListFilterCategories"
--]]

-- Create our global table
GameListFilterCategories = { }

-- Add a Category
GameListFilterCategories["Genres"] = RegisterGenreFilters()
GameListFilterCategories["Misc"] = RegisterMiscFilters()
GameListFilterCategories["User"] = RegisterUserFilters()
GameListFilterCategories["NameFilter"] = RegisterNameFilter()
GameListFilterCategories["Xbox 360"] = GameListFilterXbox360
GameListFilterCategories["Xbox Live Arcade"] = GameListFilterXBLA
GameListFilterCategories["Xbox Classic"] = GameListFilterXboxClassic
GameListFilterCategories["Indie"] = GameListFilterIndie
GameListFilterCategories["Kinect"] = GameListFilterKinect
GameListFilterCategories["Applications"] = GameListFilterApplications
GameListFilterCategories["Homebrew"] = GameListFilterHomebrew
GameListFilterCategories["Emulators"] = GameListFilterEmulators
GameListFilterCategories["ConnectX"] = GameListFilterConnectX
GameListFilterCategories["Disc"] = GameListFilterDisc

-- Let us know we are all done
print("Filter.lua done!")