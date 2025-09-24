GameListFilterCategories.User["Hide Backups"] = function(Content)
	-- Matches NXE2GOD backups
	if (string.match(Content.Directory, "0000000000000000\\[a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9][a-fA-F0-9]\\00007000\\backup") ~= nil) then
		return false -- Don't show this item
	end
	-- Return if this game ends with .bak
	return not (string.lower(string.sub(Content.Executable, -4)) == ".bak")
end
