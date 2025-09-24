scriptTitle = "Aurora Repo Browser"
scriptAuthor = "Phoenix"
scriptVersion = 2
scriptDescription = "The Phoenix script repository browser, Download and install new Content Scripts (Filters, Sorts and Subtitles) or new Utility Scripts"
scriptIcon = "icon.png"
scriptPermissions = { "http", "filesystem" }

require("MenuSystem");

local reloadRequired = false;
local refreshRequired = false;

-- Main entry point to script
function main()
	if Aurora.HasInternetConnection() ~= true then
		Script.ShowMessageBox("ERROR", "ERROR: This script requires an active internet connection to work...\n\nPlease make sure you have internet to your console before running the script", "OK");
		return;
	end
	print("-- " .. scriptTitle .. " Started...");
	init();
	if CheckUpdate() then
		goto mainend;
	end
	MakeMainMenu();
	DoShowMenu(); -- This is basically where all the magic starts
	if reloadRequired then
		local ret = Script.ShowMessageBox("Reload Required", "A Reload is required for your changes to take effect\n\nDo you want to reload Aurora now?", "Yes", "No");
		if ret.Button == 1 then
			Aurora.Restart();
		end
	end
	::mainend::
	FileSystem.DeleteDirectory(absoluteDownloadsPath);
	Script.RefreshListOnExit(refreshRequired);
	print("-- " .. scriptTitle .. " Ended...");
end

function init()
	repoPath = "repos.ini";
	repoIni = IniFile.LoadFile(repoPath);
	repoIniSections = repoIni:GetAllSections();
	downloadsPath = "Downloads\\";
	absoluteDownloadsPath = Script.GetBasePath() .. downloadsPath;
	FileSystem.DeleteDirectory(absoluteDownloadsPath);
end

function MakeMainMenu()
	Menu.SetTitle(scriptTitle);
	Menu.SetGoBackText("");
	for _, v in pairs(repoIniSections) do
		local title = repoIni:ReadValue(v, "name", "");
		if title ~= "" then
			Menu.AddMainMenuItem(Menu.MakeMenuItem(title, repoIni:GetSection(v)))
		end
	end
end

function DoShowMenu(menu)
	local ret = {}
	local canceled = false;
	local menuItem = {}
	if menu == nil then
		ret, menu, canceled, menuItem = Menu.ShowMainMenu();
	else
		ret, menu, canceled, menuItem = Menu.ShowMenu(menu);
	end
	if not canceled then
		if Menu.IsMainMenu(menu) and menu.SubMenu == nil then
			Script.SetStatus("Downloading Repo Data...");
			Script.SetProgress(0);
			local http = Http.Get(ret.iniurl);
			if http.Success then
				Script.SetStatus("Processing Repo Data...");
				Script.SetProgress(50);
				local ini = IniFile.LoadString(http.OutputData);
				for _, v in pairs(ini:GetAllSections()) do
					local title = ini:ReadValue(v, "scriptTitle", "");
					local ver = ini:ReadValue(v, "scriptVersion", "");
					local author = ini:ReadValue(v, "scriptAuthor", "");
					if (title ~= "" and ver ~= "" and author ~= "") then
						Menu.AddSubMenuItem(menuItem, Menu.MakeMenuItem(title .. " v" .. ver .. " by " .. author, ini:GetSection(v)))
					elseif (title ~= "" and author ~= "") then
						Menu.AddSubMenuItem(menuItem, Menu.MakeMenuItem(title .. " by " .. author, ini:GetSection(v)))				
					end
				end
			else
				Script.ShowMessageBox("ERROR", "An error occurred while downloading repo data...\n\nPlease try again later", "OK");
				DoShowMenu(menu);
				return;
			end
		end
		if menuItem.SubMenu ~= nil then
			DoShowMenu(menuItem.SubMenu);
		elseif not Menu.IsMainMenu(menu) then
			HandleSelection(ret, menu.Parent.Data, menu);
		else
			Script.ShowMessageBox("ERROR", "An unknown error occurred!\n\nExiting...", "OK");
		end
	end
end

function HandleSelection(selection, repo, menu)
	local info = "";
	info = info .. "Name: "..selection.scriptTitle.."\n";
	if selection.scriptAuthor ~= nil and selection.scriptAuthor ~= "" then
		info = info .. "Author: "..selection.scriptAuthor.."\n";
	else
		info = info .. "Author: N/A\n";
	end
	if selection.scriptDescription ~= nil and selection.scriptDescription ~= "" then
		info = info .. "Description:\n"..string.gsub(selection.scriptDescription, "\\n", "\n");
	else
		info = info .. "Description: N/A";
	end
	info = info .. "\n\n\nDo you want to install this ".. repo.type .."?";
	local ret = Script.ShowMessageBox("", info, "Yes", "No");
	if ret.Button == 1 then
		if HandleInstallation(selection, repo.path, repo.type) then
			if repo.reload == "true" then
				reloadRequired = true;
			end
			if repo.refresh == "true" then
				refreshRequired = true;
			end
		end
	end
	DoShowMenu(menu);
end

function HandleInstallation(selection, path, type)
	if selection.luaurl ~= nil then
		return HandleLuaInstall(selection, path, type);
	elseif selection.zipurl ~= nil then
		return HandleZipInstall(selection, path, type, true);
	else
		Script.ShowMessageBox("ERROR", "Unknown repo entry type", "OK");
		return false;
	end
end

function HandleLuaInstall(selection, path, type)
	local installPath = path..selection.filename;
	local filename = selection.filename;
	if FileSystem.FileExists(installPath) then
		if  not HandleAlreadyExists(type, filename) then
			while FileSystem.FileExists(installPath) do
				installPath, filename, canceled = GetNewName(filename, path, "Select new filename:", ".lua");
				if canceled then
					return false; -- We're not going to continue trying this
				end
			end
		end
	end
	Script.SetStatus("Downloading LUA script...");
	Script.SetProgress(0);
	local http = Http.Get(selection.luaurl, downloadsPath..selection.filename);
	if http.Success then
		Script.SetStatus("Installing LUA script...");
		Script.SetProgress(50);
		local result = FileSystem.MoveFile(http.OutputPath, installPath, true);
		Script.SetStatus("Done! Returning to menu...");
		Script.SetProgress(100);
		if result == true then
			return true;
		else
			Script.ShowMessageBox("ERROR", "Installation failed!", "OK");
		end
	else
		Script.ShowMessageBox("ERROR", "Download failed\n\nPlease try again later...", "OK");
	end
	return false;
end

function HandleZipInstall(selection, path, type, checkExists)
	local installPath = path;
	if checkExists == true then
		installPath = installPath .. selection.path;
		local filename = selection.path;
		if FileSystem.FileExists(installPath) then
			if  not HandleAlreadyExists(type, filename) then
				while FileSystem.FileExists(installPath) do
					installPath, filename, canceled = GetNewName(filename, path, "Select new folder name:");
					if canceled then
						return false; -- We're not going to continue trying this
					end
				end
			end
		end
	end
	Script.SetStatus("Downloading Script...");
	Script.SetProgress(0);
	local dlpath = downloadsPath.."tmp.7z";
	local http = Http.Get(selection.zipurl, dlpath);
	if http.Success then
		Script.SetStatus("Extracting Script...");
		Script.SetProgress(25);
		local zip = ZipFile.OpenFile(dlpath);
		if zip == nil then
			Script.ShowMessageBox("ERROR", "Extraction failed!", "OK");
			return false;
		end
		local result = zip.Extract(zip, downloadsPath.."tmp\\");
		FileSystem.DeleteFile(http.OutputPath);
		if result == false then
			Script.ShowMessageBox("ERROR", "Extraction failed!", "OK");
		else
			Script.SetStatus("Installing Script...");
			Script.SetProgress(75);
			result = FileSystem.MoveDirectory(absoluteDownloadsPath.."tmp\\", installPath, true);
			Script.SetStatus("Done! Returning to menu...");
			Script.SetProgress(100);
			if result == true then
				return true;
			else
				Script.ShowMessageBox("ERROR", "Installation failed!", "OK");
			end
		end
	else
		Script.ShowMessageBox("ERROR", "Download failed\n\nPlease try again later...", "OK");
	end
	return false;
end

function HandleAlreadyExists(type, name)
	local msg = "There is a "..type.." already installed with the name:\n"..name.."\n\nDo you want to overwrite/replace it?";
	local ret = Script.ShowMessageBox("Script Already Exists", msg, "No", "Yes");
	if ret.Canceled or ret.Button ~= 2 then
		return false;
	end
	return true;
end

function GetNewName(currentName, path, prompt, extension)
	local extlen = 0;
	if extension ~= nil then
		extlen = 0 - string.len(extension);
		if string.lower(string.sub(currentName, extlen)) == extension then
			currentName = string.sub(currentName, 0, extlen - 1);
		end
	end
	local ret = Script.ShowKeyboard(scriptTitle, prompt, currentName, 0);
	if ret.Canceled == false then
		if extension ~= nil then
			if string.lower(string.sub(ret.Buffer, extlen)) ~= extension then
				ret.Buffer = ret.Buffer..extension;
			end
		end
		return path..ret.Buffer, ret.Buffer, ret.Canceled;
	end
	return path..currentName, currentName, ret.Canceled;
end

function CheckUpdate()
	local url = repoIni:ReadValue("Global", "updateurl", "");
	if url ~= "" then
		Script.SetStatus("Downloading Update information...");
		Script.SetProgress(0);
		local http = Http.Get(url);
		if http.Success then
			Script.SetStatus("Parsing Update information...");
			Script.SetProgress(50);
			local ini = IniFile.LoadString(http.OutputData);
			local section = ini:GetSection("AuroraRepo");
			if tonumber(section.scriptVersion) > tonumber(scriptVersion) then
				local ret = Script.ShowMessageBox("Repo Update Available", "A new version of the repo browser is available, do you want to download it now?", "Yes", "No");
				if ret.Button == 1 then
					refreshRequired = HandleZipInstall(section, Script.GetBasePath(), "", false);
					return refreshRequired;
				end
			end
			Script.SetStatus("Update check finished...");
			Script.SetProgress(100);
		else
			Script.ShowNotification("Error downloading update information...");
		end
	end
	return false;
end
