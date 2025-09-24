-- Require additional lua scripts
require("Enums")
require("SortFunctions")

--[[ 
	Create a global table that holds all our sort functions.
	Don't change the name of the table as aurora looks
	for this specific table "GameListSorters"

	Note:  Sort method returns true/false.  A true value indicates
	that Item1 belongs in the list BEFORE Item2.  A false value 
	indicates that Item1 does not belong before Item2
--]]

-- Set up our global table
GameListSorters = {}

-- Add a sort method
-- GameListSorters["Title Name"] = GameListSortAlphabetically
-- GameListSorters["Title, Root, then Disc (ConnectX Last)"] = GameListSortNameRootDisc
-- Replace the Title Name sort with the new Title / Root / Disc (ConnectX last) sort
GameListSorters["Title Name"] = GameListSortNameRootDisc
GameListSorters["Publisher"] = GameListSortPublisher
GameListSorters["Developer"] = GameListSortDeveloper
GameListSorters["Recent Activity"] = GameListSortRecentActivity
GameListSorters["Recently Added"] = GameListSortRecentlyAdded

-- Let us know we are all done
print("Sort.lua done!")