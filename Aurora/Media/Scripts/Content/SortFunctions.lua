-- Obsolete now (Replaced by GameListSortNameRootDisc)
function GameListSortAlphabetically(Item1, Item2, Type)
	-- Check if sort Descending
	if Type == SortType.Descending then
		return string.lower(Item1.Name) > string.lower(Item2.Name)
	end

	-- Sort Ascending
	return string.lower(Item1.Name) < string.lower(Item2.Name)
end

function GameListSortNameRootDisc(Item1, Item2, Type)
	
    -- Check if sort Descending
	if Type == SortType.Descending then
        
        -- Sort on Title
        if string.lower(Item1.Name)~= string.lower(Item2.Name) then
            return string.lower(Item1.Name) > string.lower(Item2.Name)
        end
        
        -- Sort on Root
        if string.lower(Item1.Root) ~= string.lower(Item2.Root) then
            
            -- ConnectX always first
            if string.find(string.lower(Item1.Root), "connx:\\") ~= nil then
                return true
            end
            if string.find(string.lower(Item2.Root), "connx:\\") ~= nil then
                return false
            end
            
            return string.lower(Item1.Root) > string.lower(Item2.Root)
        end
        
        -- Sort on Disc Number
        return Item1.DiscNum > Item2.DiscNum
	end

	-- Sort Ascending
	
    -- Sort on Title
    if string.lower(Item1.Name)~= string.lower(Item2.Name) then
        return string.lower(Item1.Name) < string.lower(Item2.Name)
    end
    
    -- Sort on Root
    if string.lower(Item1.Root) ~= string.lower(Item2.Root) then
        
        -- ConnectX always last
        if string.find(string.lower(Item1.Root), "connx:\\") ~= nil then
            return false
        end
        if string.find(string.lower(Item2.Root), "connx:\\") ~= nil then
            return true
        end
        
        return string.lower(Item1.Root) < string.lower(Item2.Root)
    end
    
    -- Sort on Disc Number
    return Item1.DiscNum < Item2.DiscNum
end

function GameListSortPublisher( Item1, Item2, Type )
	-- First if Item1 has no publisher, but Item2 does, then it goes below it
	if Item1.Publisher == "" and Item2.Publisher ~= "" then
		return false
	end
	if Item1.Publisher ~= "" and Item2.Publisher == "" then
		return true
	end

	-- Check if sort Descending
	if Type == SortType.Descending then
	   if string.lower( Item1.Publisher ) == string.lower(Item2.Publisher ) then
	      return string.lower(Item1.Name) > string.lower(Item2.Name)
	   end
	   return string.lower(Item1.Publisher) > string.lower(Item2.Publisher)
	end

	-- Sort Ascending
	if string.lower( Item1.Publisher ) == string.lower(Item2.Publisher ) then
	   return string.lower(Item2.Name) > string.lower(Item1.Name)
	end
	return string.lower(Item2.Publisher) > string.lower(Item1.Publisher)
end

function GameListSortDeveloper( Item1, Item2, Type )
	-- First if Item1 has no developer, but Item2 does, then it goes below it
	if Item1.Developer == "" and Item2.Developer ~= "" then
		return false
	end
	if Item1.Developer ~= "" and Item2.Developer == "" then
		return true
	end
	
	-- Check if sort Descending
	if Type == SortType.Descending then
	   if string.lower( Item1.Developer ) == string.lower(Item2.Developer ) then
		  return string.lower(Item1.Name) > string.lower(Item2.Name)
	   end
	   return string.lower(Item1.Developer) > string.lower(Item2.Developer)
	end

	-- Sort Ascending
	if string.lower( Item1.Developer ) == string.lower(Item2.Developer ) then
	   return string.lower(Item2.Name) > string.lower(Item1.Name)
	end
	return string.lower(Item2.Developer) > string.lower(Item1.Developer)
end

function GameListSortRecentActivity(Item1, Item2, Type)
	
	-- Check if sort Descending
	if Type == SortType.Descending then
		if Item2.LastPlayed.HighPart == 0 and Item1.LastPlayed.HighPart == 0 then
		   if Item2.DateAdded.HighPart == Item1.DateAdded.HighPart then 
			   return Item2.DateAdded.LowPart > Item1.DateAdded.LowPart 
		   end
		   return Item2.DateAdded.HighPart > Item1.DateAdded.HighPart
		elseif Item2.LastPlayed.HighPart == 0 and Item1.LastPlayed.HighPart ~= 0 then
		   if Item2.DateAdded.HighPart == Item1.LastPlayed.HighPart then
			  return Item2.DateAdded.LowPart > Item1.LastPlayed.LowPart
		   end
		   return Item2.DateAdded.HighPart > Item1.LastPlayed.HighPart
		elseif Item2.LastPlayed.HighPart ~= 0 and Item1.LastPlayed.HighPart == 0 then
		   if Item2.LastPlayed.HighPart == Item1.DateAdded.HighPart then
			  return Item2.LastPlayed.LowPart > Item1.DateAdded.LowPart
		   end
		   return Item2.LastPlayed.HighPart > Item1.DateAdded.HighPart
		else
		   if Item2.LastPlayed.HighPart == Item1.LastPlayed.HighPart then
			  return Item2.LastPlayed.LowPart > Item1.LastPlayed.LowPart
		   end
		   return Item2.LastPlayed.HighPart > Item1.LastPlayed.HighPart
		end
	end

	-- Sort Ascending
	if Item2.LastPlayed.HighPart == 0 and Item1.LastPlayed.HighPart == 0 then
	   if Item2.DateAdded.HighPart == Item1.DateAdded.HighPart then 
	       return Item1.DateAdded.LowPart > Item2.DateAdded.LowPart 
	   end
	   return Item1.DateAdded.HighPart > Item2.DateAdded.HighPart
	elseif Item2.LastPlayed.HighPart == 0 and Item1.LastPlayed.HighPart ~= 0 then
	   if Item2.DateAdded.HighPart == Item1.LastPlayed.HighPart then
	      return Item1.LastPlayed.LowPart > Item2.DateAdded.LowPart
	   end
	   return Item1.LastPlayed.HighPart > Item2.DateAdded.HighPart
	elseif Item2.LastPlayed.HighPart ~= 0 and Item1.LastPlayed.HighPart == 0 then
	   if Item2.LastPlayed.HighPart == Item1.DateAdded.HighPart then
	      return Item1.DateAdded.LowPart > Item2.LastPlayed.LowPart
	   end
	   return Item1.DateAdded.HighPart > Item2.LastPlayed.HighPart
    else
	   if Item2.LastPlayed.HighPart == Item1.LastPlayed.HighPart then
	      return Item1.LastPlayed.LowPart > Item2.LastPlayed.LowPart
	   end
	   return Item1.LastPlayed.HighPart > Item2.LastPlayed.HighPart
	end
end
      
function GameListSortRecentlyAdded(Item1, Item2, Type)
	
	-- Check if sort Descending
	if Type == SortType.Descending then
		return Item1.Id < Item2.Id
	end

	-- Sort Ascending
	return Item1.Id > Item2.Id

end
      