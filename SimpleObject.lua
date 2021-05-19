--[[
---------------------------------------------------------------------
Created by: V3N0M_Z
API: https://github.com/00xima/SimpleObject
---------------------------------------------------------------------
]]

local function Set(self, property, value, indexData)
	
	if not indexData then
		indexData = {1}
	elseif #indexData > 5 or string.upper(property) == property then
		error("Invalid property!")
	else
		for iteration, index in ipairs(indexData) do
			iteration = #indexData + 1 - iteration
			if indexData[iteration] == string.len(property) then
				if indexData[iteration - 1] and indexData[iteration - 1] < string.len(property) then
					indexData[iteration - 1] += 1
					indexData[iteration] = 1
				elseif indexData[iteration] < string.len(property) then
					indexData[iteration] += 1
				else
					for iteration, _ in ipairs(indexData) do
						indexData[iteration] = iteration
					end
					table.insert(indexData, #indexData + 1)
				end
			elseif iteration == #indexData then
				indexData[iteration] += 1
				while table.find(indexData, indexData[iteration]) and iteration ~= table.find(indexData, indexData[iteration]) do
					indexData[iteration] += 1
				end
			end
		end
	end
	
	local success, msg = pcall(function() self._instance[property] = value end)
	if success then
		return self
	elseif not string.find(msg, "valid member") then
		error(msg)
	end

	local newProperty = ""
	for index, letter in ipairs(string.split(property, "")) do
		if table.find(indexData, index) then
			newProperty = newProperty..string.upper(letter)
		else
			newProperty = newProperty..string.lower(letter)
		end
	end
	property = newProperty
	
	return Set(self, property, value, indexData)
end

return {
	new = function(_instance)
		return setmetatable({
			_instance = _instance;
		}, {
			__index = function(self, property)
				if pcall(function() return self._instance[property] end) then
					if typeof(self._instance[property]) == "function" then
						return function(self, ...) return self._instance[property](self._instance, ...) end
					else
						return self._instance[property]
					end
				end
				return function(value)
					return Set(self, string.lower(string.sub(property, 4)), value)
				end
			end;
		})
	end;
}