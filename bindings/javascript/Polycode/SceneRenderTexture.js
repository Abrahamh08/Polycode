function SceneRenderTexture() {
	Object.defineProperties(this, {
		'enabled': { enumerable: true, configurable: true, get: SceneRenderTexture.prototype.__get_enabled, set: SceneRenderTexture.prototype.__set_enabled}
	})
}
SceneRenderTexture.prototype.__get_enabled = function() {
	return Polycode.SceneRenderTexture__get_enabled(this.__ptr)
}

SceneRenderTexture.prototype.__set_enabled = function(val) {
	Polycode.SceneRenderTexture__set_enabled(this.__ptr, val)
}


SceneRenderTexture.prototype.getTargetTexture = function() {
	var retVal = new Texture()
	retVal.__ptr = Polycode.SceneRenderTexture_getTargetTexture(this.__ptr)
	return retVal
}

SceneRenderTexture.prototype.getFilterColorBufferTexture = function() {
	var retVal = new Texture()
	retVal.__ptr = Polycode.SceneRenderTexture_getFilterColorBufferTexture(this.__ptr)
	return retVal
}

SceneRenderTexture.prototype.getFilterZBufferTexture = function() {
	var retVal = new Texture()
	retVal.__ptr = Polycode.SceneRenderTexture_getFilterZBufferTexture(this.__ptr)
	return retVal
}

SceneRenderTexture.prototype.Render = function() {
	Polycode.SceneRenderTexture_Render(this.__ptr)
}

SceneRenderTexture.prototype.saveToImage = function() {
	var retVal = new Image()
	retVal.__ptr = Polycode.SceneRenderTexture_saveToImage(this.__ptr)
	return retVal
}

SceneRenderTexture.prototype.resizeRenderTexture = function(newWidth,newHeight) {
	Polycode.SceneRenderTexture_resizeRenderTexture(this.__ptr, newWidth,newHeight)
}

SceneRenderTexture.prototype.getTargetScene = function() {
	var retVal = new Scene()
	retVal.__ptr = Polycode.SceneRenderTexture_getTargetScene(this.__ptr)
	return retVal
}

SceneRenderTexture.prototype.getTargetCamera = function() {
	var retVal = new Camera()
	retVal.__ptr = Polycode.SceneRenderTexture_getTargetCamera(this.__ptr)
	return retVal
}
