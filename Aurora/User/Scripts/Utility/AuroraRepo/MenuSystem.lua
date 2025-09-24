local TopLevelMenu = {}
TopLevelMenu.SubMenu = {}
local TitleText = "Menu";
local EmptyText = "No Menu Available";
local ExitOnCancel = false;
local GoBackText = "Go Back";
local SortAlphaBetically = true;

_ShowMenu = function(menuItem)
	local menu = {}
	if SortAlphaBetically then
		table.sort(menuItem, function(a, b) return type(a) == "table" and type(b) == "table" and a.Name < b.Name; end);
	end	
	for k, v in ipairs(menuItem) do
		if type(v) == "table" then
			menu[k] = v.Name;
		else
			if GoBackText ~= nil and GoBackText ~= "" then
				menu[k] = GoBackText; -- Only show the "Go Back" option if we actually have it set to something
			end
		end
	end
	local ret = Script.ShowPopupList(TitleText, EmptyText, menu);
	if ret.Canceled == true or (ret.Selected.Key == 1 and ret.Selected.Value == GoBackText) then
		if ret.Canceled == true then
			if ExitOnCancel == true then
				return nil, menuItem, ret.Canceled, nil;
			end
		end
		if menuItem.Parent == nil or menuItem.Parent.Parent == nil then
			return nil, menuItem, ret.Canceled, nil;
		else
			menu = nil;
			ret = nil;
			return _ShowMenu(menuItem.Parent.Parent);
		end
	else
		ret = menuItem[ret.Selected.Key];
		if ret.SubMenu == nil then
			return ret.Data, menuItem, false, ret;
		else
			menu = nil;
			return _ShowMenu(ret.SubMenu);
		end
	end
end

Menu = {
	ShowMenu = function(menuItem) 
		return _ShowMenu(menuItem); -- Call the actual function^
	end,
	ShowMainMenu = function()
		return _ShowMenu(TopLevelMenu.SubMenu); -- Show the main menu (TopLevelMenu.SubMenu)
	end,
	ResetMenu = function()
		TopLevelMenu.SubMenu = {} -- Reset the menu to be empty
		TitleText = "Menu"; -- Reset title to the default one
		EmptyText = "No Menu Available"; -- Reset empty text to the default one
		ExitOnCancel = false; -- Reset ExitOnCancel to it's default value
		GoBackText = "Go Back"; -- Reset GoBackText to it's default value
	end,
	MakeMenuItem = function(displayName, data)
		return {
			Name = displayName; -- Set the Name Property to be displayed in the menu
			Data = data; -- Set the data property, if any...
		}
	end,
	AddSubMenuItem = function(menuItem, subMenuItem)
		if menuItem.SubMenu == nil then -- Check if we have a SubMenu already or not
			menuItem.SubMenu = {} -- Add the SubMenu table
			menuItem.SubMenu[1] = GoBackText; -- Add a "Go Back" to the Sub Menu
			menuItem.SubMenu.Parent = menuItem; -- Set the parent of the SubMenu to the menu we're adding it to
		end
		subMenuItem.Parent = menuItem.SubMenu; -- Set the parent of the subMenuItem to the SubMenu table so we can go further up the chain
		table.insert(menuItem.SubMenu, subMenuItem); -- Insert the subMenuItem to the menu
	end,
	AddMainMenuItem = function(menuItem)
		if TopLevelMenu.SubMenu == nil then -- Check if we have a SubMenu already or not
			TopLevelMenu.SubMenu = {} -- Add the SubMenu table
			TopLevelMenu.SubMenu.Parent = TopLevelMenu; -- Set SubMenu parent to TopLevelMenu
		end
		menuItem.Parent = TopLevelMenu.SubMenu; -- Set the parent of the subMenuItem to the SubMenu table so we can go further up the chain
		table.insert(TopLevelMenu.SubMenu, menuItem); -- Insert the menuItem to the menu
	end,
	SetTitle = function(title)
		TitleText = title; -- Set the TitleText
	end,
	SetEmptyText = function(emptyText)
		EmptyText = emptyText; -- Set the text to be shown if the menu is empty
	end,
	SetExitOnCancel = function(exitOnCancel)
		ExitOnCancel = exitOnCancel == true; -- Set the flag that tells the menu system to exit upon being canceled (B being pressed)
	end,
	SetGoBackText = function(goBackText)
		GoBackText = goBackText; -- Set the text for the return/back menu item
	end,
	SetSortAlphaBetically = function(sortAlphaBetically)
		SortAlphaBetically = sortAlphaBetically == true; -- Set the flag that tells us if we should sort alphabetically
	end,
	IsMainMenu = function(menu)
		return menu == TopLevelMenu.SubMenu;
	end
}

return Menu;