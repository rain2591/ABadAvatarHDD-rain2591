-- Our main game list filter registration method
function RegisterMiscFilters()

	-- Create our global table
	local miscFilters = {}

	-- Add a filter method
	miscFilters["LiNK Supported"] = FilterCategoryMiscLinkSupported
	miscFilters["Enabled Only"] = FilterCategoryMiscEnabledOnly
	miscFilters["Retail Only"] = FilterCategoryMiscRetailOnly
	miscFilters["Unsigned Only"] = FilterCategoryMiscDevkitOnly
	miscFilters["Hidden Only"] = FilterCategoryMiscHiddenOnly
	miscFilters["Hide Indie"] = FilterCategoryMiscHideIndie
	miscFilters["Hide ConnectX"] = FilterCategoryMiscHideConnectX

	-- All done
	return miscFilters

end

function FilterCategoryMiscHideIndie(Content)
    return not (Content.Group == ContentGroup.Indie)
end

function FilterCategoryMiscLinkSupported(Content)
	return Content.SystemLink
end

function FilterCategoryMiscEnabledOnly(Content)
   return Content.Enabled
end

function FilterCategoryMiscRetailOnly(Content)
   	return bit32.btest( Content.Flags, ContentFlag.RetailSigned )
end

function FilterCategoryMiscDevkitOnly(Content)
   return bit32.btest( Content.Flags, ContentFlag.DevkitSigned )
end

function FilterCategoryMiscHiddenOnly(Content)
   return Content.Hidden
end

function FilterCategoryMiscHideConnectX(Content)
	return not ((string.find(string.lower(Content.Root), 'connx:\\', 1)) or (string.lower(Content.ScriptData) == 'connectx'))
end