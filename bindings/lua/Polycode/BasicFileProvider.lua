class "BasicFileProvider"


function BasicFileProvider:BasicFileProvider(...)
	local arg = {...}
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycode.BasicFileProvider(unpack(arg))
	end
end

function BasicFileProvider:openFile(fileName, opts)
	local retVal = Polycode.BasicFileProvider_openFile(self.__ptr, fileName, opts)
	if retVal == nil then return nil end
	local __c = _G["CoreFile"]("__skip_ptr__")
	__c.__ptr = retVal
	return __c
end

function BasicFileProvider:closeFile(file)
	local retVal = Polycode.BasicFileProvider_closeFile(self.__ptr, file.__ptr)
end

function BasicFileProvider:addSource(source)
	local retVal = Polycode.BasicFileProvider_addSource(self.__ptr, source)
end

function BasicFileProvider:removeSource(source)
	local retVal = Polycode.BasicFileProvider_removeSource(self.__ptr, source)
end

function BasicFileProvider:__delete()
	if self then Polycode.delete_BasicFileProvider(self.__ptr) end
end
