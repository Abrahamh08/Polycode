class "ScriptInstance"


function ScriptInstance:__getvar(name)
	if name == "script" then
		local retVal = Polycode.ScriptInstance_get_script(self.__ptr)
		if retVal == nil then return nil end
		local __c = _G["Script"]("__skip_ptr__")
		__c.__ptr = retVal
		return __c
	end
end

function ScriptInstance:__setvar(name,value)
	if name == "script" then
		Polycode.ScriptInstance_set_script(self.__ptr, value.__ptr)
		return true
	end
	return false
end
function ScriptInstance:__delete()
	if self then Polycode.delete_ScriptInstance(self.__ptr) end
end
