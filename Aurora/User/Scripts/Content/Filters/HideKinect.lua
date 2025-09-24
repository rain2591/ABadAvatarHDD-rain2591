GameListFilterCategories.User["Hide Kinect"] = function(Content)
	-- Return if this game isn't a kinect game
	return not bit32.btest( Content.Flags, ContentFlag.KinectCompatible )
end