-- Require additional lua scripts
require("Enums")
require("SubtitleFunctions")

--[[ 
	Create a global table that holds all our subtitle functions.
	Don't change the name of the table as Aurora looks
	for this specific table "GameListSubtitles"
--]]

-- Set up our global table
GameListSubtitles = {}

-- Add a subtitle method
GameListSubtitles["Publisher"] = GameListSubtitlePublisher
GameListSubtitles["Developer"] = GameListSubtitleDeveloper
GameListSubtitles["DateAdded"] = GameListSubtitleDateAdded
GameListSubtitles["LastPlayed"] = GameListSubtitleLastPlayed
GameListSubtitles["ReleaseDate"] = GameListSubtitleReleaseDate
GameListSubtitles["MediaID"] = GameListSubtitleMediaId
GameListSubtitles["TitleID"] = GameListSubtitleTitleId
GameListSubtitles["ContentID"] = GameListSubtitleContentId
GameListSubtitles["BaseVersion"] = GameListSubtitleBaseVersion
GameListSubtitles["TitleIDMediaID"] = GameListSubtitleTitleMediaId
GameListSubtitles["TitleIDMediaIDBaseVersion"] = GameListSubtitleTitleMediaIdBase
GameListSubtitles["VirtualPath"] = GameListSubtitleVirtualPath
GameListSubtitles["ContentPath"] = GameListSubtitleContentPath
GameListSubtitles["DiscInfo" ] = GameListSubtitleDiscInfo
GameListSubtitles["Genre"] = GameListSubtitleGenre
GameListSubtitles["SystemLink"] = GameListSubtitleSystemLink
GameListSubtitles["Achievement"] = GameListSubtitleAchievement
GameListSubtitles["_Blank"] = GameListSubtitleDefault

-- Let us know we are all done
print("Subtitle.lua done!")