class "SceneEntityInstanceLayer"



function SceneEntityInstanceLayer:__getvar(name)
	if name == "name" then
		return Polycore.SceneEntityInstanceLayer_get_name(self.__ptr)
	elseif name == "layerID" then
		local retVal = Polycore.SceneEntityInstanceLayer_get_layerID(self.__ptr)
		if retVal == nil then return nil end
		local __c = _G["char"]("__skip_ptr__")
		__c.__ptr = retVal
		return __c
	elseif name == "visible" then
		return Polycore.SceneEntityInstanceLayer_get_visible(self.__ptr)
	elseif name == "instance" then
		local retVal = Polycore.SceneEntityInstanceLayer_get_instance(self.__ptr)
		if retVal == nil then return nil end
		local __c = _G["SceneEntityInstance"]("__skip_ptr__")
		__c.__ptr = retVal
		return __c
	end
end


function SceneEntityInstanceLayer:__setvar(name,value)
	if name == "name" then
		Polycore.SceneEntityInstanceLayer_set_name(self.__ptr, value)
		return true
	elseif name == "layerID" then
		Polycore.SceneEntityInstanceLayer_set_layerID(self.__ptr, value.__ptr)
		return true
	elseif name == "visible" then
		Polycore.SceneEntityInstanceLayer_set_visible(self.__ptr, value)
		return true
	end
	return false
end


function SceneEntityInstanceLayer:SceneEntityInstanceLayer(...)
	local arg = {...}
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycore.SceneEntityInstanceLayer(unpack(arg))
	end
end

function SceneEntityInstanceLayer:setLayerVisibility(val)
	local retVal = Polycore.SceneEntityInstanceLayer_setLayerVisibility(self.__ptr, val)
end

function SceneEntityInstanceLayer:__delete()
	if self then Polycore.delete_SceneEntityInstanceLayer(self.__ptr) end
end
