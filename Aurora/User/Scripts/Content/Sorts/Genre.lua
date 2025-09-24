GameListSorters["Genre"] = function(Item1, Item2, Type)
	-- First if Item1 has no Genre, but Item2 does, then it goes below it
	if Item1.GenreStr == "" and Item2.GenreStr ~= "" then
		return false
	end
	if Item1.GenreStr ~= "" and Item2.GenreStr == "" then
		return true
	end
	
	-- Check if sort Descending
	if Type == SortType.Descending then
	   if string.lower( Item1.GenreStr ) == string.lower(Item2.GenreStr ) then
		  return string.lower(Item1.Name) > string.lower(Item2.Name)
	   end
	   return string.lower(Item1.GenreStr) > string.lower(Item2.GenreStr)
	end

	-- Sort Ascending
	if string.lower( Item1.GenreStr ) == string.lower(Item2.GenreStr ) then
	   return string.lower(Item2.Name) > string.lower(Item1.Name)
	end
	return string.lower(Item2.GenreStr) > string.lower(Item1.GenreStr)
end