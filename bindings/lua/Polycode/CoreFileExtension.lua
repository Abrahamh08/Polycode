class "CoreFileExtension"


function CoreFileExtension:__getvar(name)
	if name == "extension" then
		return Polycode.CoreFileExtension_get_extension(self.__ptr)
	elseif name == "description" then
		return Polycode.CoreFileExtension_get_description(self.__ptr)
	end
end

function CoreFileExtension:__setvar(name,value)
	if name == "extension" then
		Polycode.CoreFileExtension_set_extension(self.__ptr, value)
		return true
	elseif name == "description" then
		Polycode.CoreFileExtension_set_description(self.__ptr, value)
		return true
	end
	return false
end
function CoreFileExtension:CoreFileExtension(...)
	local arg = {...}
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycode.CoreFileExtension(unpack(arg))
	end
end

function CoreFileExtension:__delete()
	if self then Polycode.delete_CoreFileExtension(self.__ptr) end
end
