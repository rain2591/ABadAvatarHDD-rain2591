-- Our main game list filter registration method
function RegisterNameFilter()
	local nameFilters = {}
	
	nameFilters["A - F"] = {}
	nameFilters["A - F"]["A"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "A") end
	nameFilters["A - F"]["B"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "B") end
	nameFilters["A - F"]["C"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "C") end
	nameFilters["A - F"]["D"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "D") end
	nameFilters["A - F"]["E"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "E") end
	nameFilters["A - F"]["F"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "F") end
	nameFilters["G - L"] = {}
	nameFilters["G - L"]["G"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "G") end
	nameFilters["G - L"]["H"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "H") end
	nameFilters["G - L"]["I"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "I") end
	nameFilters["G - L"]["J"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "J") end
	nameFilters["G - L"]["K"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "K") end
	nameFilters["G - L"]["L"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "L") end
	nameFilters["M - R"] = {}
	nameFilters["M - R"]["M"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "M") end
	nameFilters["M - R"]["N"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "N") end
	nameFilters["M - R"]["O"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "O") end
	nameFilters["M - R"]["P"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "P") end
	nameFilters["M - R"]["Q"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "Q") end
	nameFilters["M - R"]["R"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "R") end
	nameFilters["S - X"] = {}
	nameFilters["S - X"]["S"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "S") end
	nameFilters["S - X"]["T"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "T") end
	nameFilters["S - X"]["U"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "U") end
	nameFilters["S - X"]["V"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "V") end
	nameFilters["S - X"]["W"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "W") end
	nameFilters["S - X"]["X"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "X") end
	nameFilters["Y - Z"] = {}
	nameFilters["Y - Z"]["Y"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "Y") end
	nameFilters["Y - Z"]["Z"] = function(Content) return (string.upper(string.sub(Content.Name, 0, 1)) == "Z") end
	nameFilters["Other"] = function(Content) return (string.match(string.sub(Content.Name, 0, 1), "[a-zA-Z]") == nil) end

	return nameFilters
end