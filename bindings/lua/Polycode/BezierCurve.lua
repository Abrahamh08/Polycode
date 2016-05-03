class "BezierCurve"



function BezierCurve:__getvar(name)
	if name == "insertPoint" then
		local retVal = Polycore.BezierCurve_get_insertPoint(self.__ptr)
		if retVal == nil then return nil end
		local __c = _G["BezierPoint"]("__skip_ptr__")
		__c.__ptr = retVal
		return __c
	elseif name == "evaluationAccuracy" then
		return Polycore.BezierCurve_get_evaluationAccuracy(self.__ptr)
	end
end


function BezierCurve:__setvar(name,value)
	if name == "evaluationAccuracy" then
		Polycore.BezierCurve_set_evaluationAccuracy(self.__ptr, value)
		return true
	end
	return false
end


function BezierCurve:BezierCurve(...)
	local arg = {...}
	for k,v in pairs(arg) do
		if type(v) == "table" then
			if v.__ptr ~= nil then
				arg[k] = v.__ptr
			end
		end
	end
	if self.__ptr == nil and arg[1] ~= "__skip_ptr__" then
		self.__ptr = Polycore.BezierCurve(unpack(arg))
	end
end

function BezierCurve:getControlPoint(index)
	local retVal = Polycore.BezierCurve_getControlPoint(self.__ptr, index)
	if retVal == nil then return nil end
	local __c = _G["BezierPoint"]("__skip_ptr__")
	__c.__ptr = retVal
	return __c
end

function BezierCurve:getNumControlPoints()
	local retVal =  Polycore.BezierCurve_getNumControlPoints(self.__ptr)
	return retVal
end

function BezierCurve:addControlPoint(p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z)
	local retVal = Polycore.BezierCurve_addControlPoint(self.__ptr, p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z)
end

function BezierCurve:addControlPoint3dWithHandles(p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z)
	local retVal = Polycore.BezierCurve_addControlPoint3dWithHandles(self.__ptr, p1x, p1y, p1z, p2x, p2y, p2z, p3x, p3y, p3z)
end

function BezierCurve:addControlPoint3d(x, y, z)
	local retVal = Polycore.BezierCurve_addControlPoint3d(self.__ptr, x, y, z)
end

function BezierCurve:addControlPoint2dWithHandles(p1x, p1y, p2x, p2y, p3x, p3y)
	local retVal = Polycore.BezierCurve_addControlPoint2dWithHandles(self.__ptr, p1x, p1y, p2x, p2y, p3x, p3y)
end

function BezierCurve:addControlPoint2d(x, y)
	local retVal = Polycore.BezierCurve_addControlPoint2d(self.__ptr, x, y)
end

function BezierCurve:getPointAt(a)
	local retVal = Polycore.BezierCurve_getPointAt(self.__ptr, a)
	if retVal == nil then return nil end
	local __c = _G["Vector3"]("__skip_ptr__")
	__c.__ptr = retVal
	return __c
end

function BezierCurve:getPointBetween(a, bp1, bp2)
	local retVal = Polycore.BezierCurve_getPointBetween(self.__ptr, a, bp1.__ptr, bp2.__ptr)
	if retVal == nil then return nil end
	local __c = _G["Vector3"]("__skip_ptr__")
	__c.__ptr = retVal
	return __c
end

function BezierCurve:clearControlPoints()
	local retVal =  Polycore.BezierCurve_clearControlPoints(self.__ptr)
end

function BezierCurve:getYValueAtX(x)
	local retVal = Polycore.BezierCurve_getYValueAtX(self.__ptr, x)
	return retVal
end

function BezierCurve:getTValueAtX(x)
	local retVal = Polycore.BezierCurve_getTValueAtX(self.__ptr, x)
	return retVal
end

function BezierCurve:removePoint(point)
	local retVal = Polycore.BezierCurve_removePoint(self.__ptr, point.__ptr)
end

function BezierCurve:setHeightCacheResolution(resolution)
	local retVal = Polycore.BezierCurve_setHeightCacheResolution(self.__ptr, resolution)
end

function BezierCurve:rebuildHeightCache()
	local retVal =  Polycore.BezierCurve_rebuildHeightCache(self.__ptr)
end

function BezierCurve:recalculateDistances()
	local retVal =  Polycore.BezierCurve_recalculateDistances(self.__ptr)
end

function BezierCurve:__delete()
	if self then Polycore.delete_BezierCurve(self.__ptr) end
end
