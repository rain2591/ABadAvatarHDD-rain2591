GameListFilterCategories.User["Hide MultiDisc"] = function(Content)
	-- Return if this game is disc number 1
	return Content.DiscNum <= 1
end