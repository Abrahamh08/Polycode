function Vector4() {
	Object.defineProperties(this, {
		'x': { enumerable: true, configurable: true, get: Vector4.prototype.__get_x, set: Vector4.prototype.__set_x},
		'y': { enumerable: true, configurable: true, get: Vector4.prototype.__get_y, set: Vector4.prototype.__set_y},
		'z': { enumerable: true, configurable: true, get: Vector4.prototype.__get_z, set: Vector4.prototype.__set_z},
		'w': { enumerable: true, configurable: true, get: Vector4.prototype.__get_w, set: Vector4.prototype.__set_w}
	})
}
Vector4.prototype.__get_x = function() {
	return Polycode.Vector4__get_x(this.__ptr)
}

Vector4.prototype.__set_x = function(val) {
	Polycode.Vector4__set_x(this.__ptr, val)
}

Vector4.prototype.__get_y = function() {
	return Polycode.Vector4__get_y(this.__ptr)
}

Vector4.prototype.__set_y = function(val) {
	Polycode.Vector4__set_y(this.__ptr, val)
}

Vector4.prototype.__get_z = function() {
	return Polycode.Vector4__get_z(this.__ptr)
}

Vector4.prototype.__set_z = function(val) {
	Polycode.Vector4__set_z(this.__ptr, val)
}

Vector4.prototype.__get_w = function() {
	return Polycode.Vector4__get_w(this.__ptr)
}

Vector4.prototype.__set_w = function(val) {
	Polycode.Vector4__set_w(this.__ptr, val)
}


Vector4.prototype.set = function(x,y,z,w) {
	Polycode.Vector4_set(this.__ptr, x,y,z,w)
}

Vector4.prototype.dot = function(u) {
	return Polycode.Vector4_dot(this.__ptr, u)
}
