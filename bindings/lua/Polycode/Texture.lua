require "Polycode/Resource"

class "Texture" (Resource)



Texture.FILTERING_NEAREST = 0
Texture.FILTERING_LINEAR = 1
function Texture:__getvar(name)
	if name == "clamp" then
		return Polycore.Texture_get_clamp(self.__ptr)
	elseif name == "textureData" then
		local retVal = Polycore.Texture_get_textureData(self.__ptr)
		if retVal == nil then return nil end
		local __c = _G["char"]("__skip_ptr__")
		__c.__ptr = retVal
		return __c
	elseif name == "type" then
		return Polycore.Texture_get_type(self.__ptr)
	elseif name == "filteringMode" then
		return Polycore.Texture_get_filteringMode(self.__ptr)
	elseif name == "createMipmaps" then
		return Polycore.Texture_get_createMipmaps(self.__ptr)
	elseif name == "anisotropy" then
		return Polycore.Texture_get_anisotropy(self.__ptr)
	elseif name == "framebufferTexture" then
		return Polycore.Texture_get_framebufferTexture(self.__ptr)
	elseif name == "depthTexture" then
		return Polycore.Texture_get_depthTexture(self.__ptr)
	end
	if Resource["__getvar"] ~= nil then
		return Resource.__getvar(self, name)
	end
end


function Texture:__setvar(name,value)
	if name == "clamp" then
		Polycore.Texture_set_clamp(self.__ptr, value)
		return true
	elseif name == "type" then
		Polycore.Texture_set_type(self.__ptr, value)
		return true
	elseif name == "filteringMode" then
		Polycore.Texture_set_filteringMode(self.__ptr, value)
		return true
	elseif name == "createMipmaps" then
		Polycore.Texture_set_createMipmaps(self.__ptr, value)
		return true
	elseif name == "anisotropy" then
		Polycore.Texture_set_anisotropy(self.__ptr, value)
		return true
	elseif name == "framebufferTexture" then
		Polycore.Texture_set_framebufferTexture(self.__ptr, value)
		return true
	elseif name == "depthTexture" then
		Polycore.Texture_set_depthTexture(self.__ptr, value)
		return true
	end
	if Resource["__setvar"] ~= nil then
		return Resource.__setvar(self, name, value)
	else
		return false
	end
end


function Texture:reloadResource()
	local retVal =  Polycore.Texture_reloadResource(self.__ptr)
end

function Texture:setImageData(data)
	local retVal = Polycore.Texture_setImageData(self.__ptr, data.__ptr)
end

function Texture:getTextureData()
	local retVal =  Polycore.Texture_getTextureData(self.__ptr)
	if retVal == nil then return nil end
	local __c = _G["char"]("__skip_ptr__")
	__c.__ptr = retVal
	return __c
end

function Texture:getWidth()
	local retVal =  Polycore.Texture_getWidth(self.__ptr)
	return retVal
end

function Texture:getHeight()
	local retVal =  Polycore.Texture_getHeight(self.__ptr)
	return retVal
end

function Texture:setCreateMipmaps(createMipmapsIn)
	local retVal = Polycore.Texture_setCreateMipmaps(self.__ptr, createMipmapsIn)
end

function Texture:getCreateMipmaps()
	local retVal =  Polycore.Texture_getCreateMipmaps(self.__ptr)
	return retVal
end

function Texture:__delete()
	if self then Polycore.delete_Texture(self.__ptr) end
end
