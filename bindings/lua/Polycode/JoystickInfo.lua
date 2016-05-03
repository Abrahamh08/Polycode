class "JoystickInfo"



function JoystickInfo:__getvar(name)
	if name == "deviceID" then
		return Polycore.JoystickInfo_get_deviceID(self.__ptr)
	elseif name == "deviceIndex" then
		return Polycore.JoystickInfo_get_deviceIndex(self.__ptr)
	end
end


function JoystickInfo:__setvar(name,value)
	if name == "deviceID" then
		Polycore.JoystickInfo_set_deviceID(self.__ptr, value)
		return true
	elseif name == "deviceIndex" then
		Polycore.JoystickInfo_set_deviceIndex(self.__ptr, value)
		return true
	end
	return false
end


function JoystickInfo:JoystickInfo(...)
	local arg = {...}
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycore.JoystickInfo(unpack(arg))
	end
end

function JoystickInfo:__delete()
	if self then Polycore.delete_JoystickInfo(self.__ptr) end
end
