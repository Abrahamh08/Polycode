/*
 Copyright (C) 2016 by Joachim Meyer
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#include "polycode/core/PolyAAssetFileProvider.h"
#include "polycode/core/PolyLogger.h"

using namespace Polycode;

AAssetFileProvider::AAssetFileProvider(AAssetManager* manager) {
    type = "android";
	this->manager = manager;
	canListFiles = true;
}

void AAssetFileProvider::addSource(const String &source) {
	AAssetDirClass dir;
	dir.name = source;
	dir.system = AAssetManager_openDir(manager, source.c_str());
	sourceFolders.push_back(dir);
// 	Logger::log("addSource");
}

void AAssetFileProvider::removeSource(const String &source) {
    for(int i=0; i < sourceFolders.size(); i++) {
        if(sourceFolders[i].name == source) {
			AAssetDir_close(sourceFolders[i].system);
            sourceFolders.erase(sourceFolders.begin()+i);
            return;
        }
    }
}

Polycode::CoreFile *AAssetFileProvider::openFile(const String &fileName, const String &opts) {
    Logger::log("openFile %s", fileName.c_str());
    AAsset *file = NULL;
    for(int i=0; i < sourceFolders.size(); i++) {
        file = AAssetManager_open(manager, (sourceFolders[i].name+"/"+fileName).c_str(), AASSET_MODE_BUFFER);
        if(file) {
            break;
        }
    }
    
    if(!file) {
        file = AAssetManager_open(manager, fileName.c_str(), AASSET_MODE_BUFFER);
    }
    
    if(file) {
        AAssetFile *retFile = NULL;
        retFile = new AAssetFile();
        retFile->file = file;
        return retFile;
    }
    
    return NULL;
}

bool AAssetFileProvider::parseFolder(const String& pathString, bool showHidden, std::vector< OSFileEntry >& targetVector){
// 	Logger::log("Parse AAsset [%s]", pathString.c_str());
	String path = pathString;
	if(pathString.substr(pathString.length(),1)!="/")
		path = pathString + "/";
	
	AAssetDir* dir = AAssetManager_openDir(manager, pathString.c_str());
	if(!dir)
		return false;
	
	while(true){
		String name = AAssetDir_getNextFileName(dir);
		if(name == "")
			break;
// 		Logger::log("Parse AAsset Found File: %s", (path+name).c_str());
		OSFileEntry entry = OSFileEntry(path + name, OSFileEntry::TYPE_FILE);
		targetVector.push_back(entry);
	}
	return true;
}


void AAssetFileProvider::closeFile(Polycode::CoreFile *file) {
    AAssetFile *aassetFile = (AAssetFile*) file;
    AAsset_close(aassetFile->file);
    delete aassetFile;
}

long AAssetFile::read( void * ptr, size_t size, size_t count) {
    return AAsset_read(file, ptr, count*size) / size;
}

long AAssetFile::write( const void * ptr, size_t size, size_t count) {
    return 0;
}

int AAssetFile::seek(long int offset, int origin) {
    return AAsset_seek(file, offset, origin);
}

long AAssetFile::tell() {
    return AAsset_getLength(file);
}
