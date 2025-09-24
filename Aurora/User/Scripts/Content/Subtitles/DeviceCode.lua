GameListSubtitles["DeviceCode"] = function(Content)
	local value = "Disconnected"
	if Content.Root ~= "" then
		value = string.format("%s  %08X", string.upper(Content.Root), Content.TitleId)
	end
	return value
end