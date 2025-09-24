function getmonth(month)
	local months = { "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" }
	return months[tonumber(month)]
end

function getdayofweek(dayofweek)
    local daysofweek = { "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" }
	return daysofweek[tonumber(dayofweek)]
end

function GameListSubtitleSystemLink(Content)
	if Content.SystemLink == true then
		return "LiNK Supported"
	end

	return "LiNK Not Supported"
end

function GameListSubtitleDeveloper(Content)
	if Content.Developer ~= "" then
	  return string.format("Developer: %s", Content.Developer )
	end
	return "Developer:  Not Available"
end

function GameListSubtitlePublisher(Content)
	if Content.Publisher ~= "" then
	  return string.format("Publisher: %s", Content.Publisher )
	end
	return "Publisher:  Not Available"
end

function GameListSubtitleDateAdded(Content)
	if Content.DateAdded.HighPart == 0 then
	   return string.format( "Date Added:  Unknown" )
	end

	local month = getmonth( Content.DateAdded.Month )
	local dayofweek = getdayofweek( Content.DateAdded.DayOfWeek )

	return string.format("Date Added:  %s, %s %d, %d", dayofweek, month, Content.DateAdded.Day, Content.DateAdded.Year )
end

function GameListSubtitleLastPlayed(Content)
	if Content.LastPlayed.HighPart == 0 then
	   return string.format( "Last Played:  Never" )
	end

	local month = getmonth( Content.LastPlayed.Month )
	local dayofweek = getdayofweek( Content.LastPlayed.DayOfWeek )

	return string.format("Last Played:  %s, %s %d, %d", dayofweek, month, Content.LastPlayed.Day, Content.LastPlayed.Year )
end

function GameListSubtitleVirtualPath(Content)
	local value = "Disconnected"
	if Content.Root ~= "" then
		value = string.format("Virtual Path: %s%s\\", Content.VirtualRoot, Content.Directory )
	end
	return value
end

function GameListSubtitleContentPath(Content)
	local value = "Disconnected"
	if Content.Root ~= "" then
		value = string.format("Path: %s%s\\", Content.Root, Content.Directory )
	end
	return value
end

function GameListSubtitleTitleMediaId(Content)
	return string.format("Title ID: %08X | Media ID: %08X", Content.TitleId, Content.MediaId)
end

function GameListSubtitleTitleMediaIdBase(Content)
	return string.format("Title ID: %08X | Media ID: %08X | Base Version: %08X", Content.TitleId, Content.MediaId, Content.BaseVersion)
end

function GameListSubtitleTitleId(Content)
	return string.format("Title ID: %08X", Content.TitleId)
end

function GameListSubtitleMediaId(Content)
	return string.format("Media ID: %08X", Content.MediaId)
end

function GameListSubtitleBaseVersion(Content)
	return string.format("Base Version: %08X", Content.BaseVersion)
end

function GameListSubtitleContentId(Content)
	return string.format("Content ID:  %08X", Content.Id)
end

function GameListSubtitleReleaseDate(Content)
	if Content.ReleaseDate ~= "" then
	  return string.format("Release Date: %s", Content.ReleaseDate )
	end
	return "Release Date:  Not Available"
end

function GameListSubtitleGenre(Content)
	if Content.GenreStr ~= "" then
	  return string.format("Genre: %s", Content.GenreStr )
	end
	return "Genre:  Not Available"
end

function GameListSubtitleDiscInfo(Content)
   discNum = Content.DiscNum
   discCount = Content.DiscsInSet
   if discNum == 0 then
      discNum = 1
   end
   if discCount == 0 then
      discCount = 1
   end
   return string.format("Disc: %d of %d", discNum, discCount)
end

function GameListSubtitleDefault(Content)
	return ""
end

function GameListSubtitleAchievement(Content)
	local value = "Sign in to view achievements..."
	local result = Profile.GetTitleAchievement( 1, Content.TitleId )
	if type(result) == "table" then
		return string.format("Achievements Unlocked:  %d of %d (%d of %dG)", result["EarnedCount"], result["MaxCount"], result["EarnedScore"], result["MaxScore"])
	end
 
	if result == -1 then
		return value
	end

	if result == 0 then 
		return "No Achievements Found"
	end
end