function TextureResourceLoader() {
}

TextureResourceLoader.prototype.loadResource = function(path,targetPool) {
	var retVal = new Resource()
	retVal.__ptr = Polycode.TextureResourceLoader_loadResource(this.__ptr, path,targetPool)
	return retVal
}
