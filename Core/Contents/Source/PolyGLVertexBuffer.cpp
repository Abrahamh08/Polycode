/*
 Copyright (C) 2011 by Ivan Safrin
 
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

#include "PolyGLHeaders.h"
#include "PolyGLVertexBuffer.h"

#if defined(__APPLE__) && defined(__MACH__)

#else
	#include "malloc.h"
#endif

using namespace Polycode;

#ifdef _WINDOWS
// ARB_vertex_buffer_object
extern PFNGLBINDBUFFERARBPROC glBindBufferARB;
extern PFNGLDELETEBUFFERSARBPROC glDeleteBuffersARB;
extern PFNGLGENBUFFERSARBPROC glGenBuffersARB;
extern PFNGLISBUFFERARBPROC glIsBufferARB;
extern PFNGLBUFFERDATAARBPROC glBufferDataARB;
extern PFNGLBUFFERSUBDATAARBPROC glBufferSubDataARB;
extern PFNGLGETBUFFERSUBDATAARBPROC glGetBufferSubDataARB;
extern PFNGLMAPBUFFERARBPROC glMapBufferARB;
extern PFNGLUNMAPBUFFERARBPROC glUnmapBufferARB;
extern PFNGLGETBUFFERPARAMETERIVARBPROC glGetBufferParameterivARB;
extern PFNGLGETBUFFERPOINTERVARBPROC glGetBufferPointervARB;
#endif

OpenGLVertexBuffer::OpenGLVertexBuffer(Mesh *mesh) : VertexBuffer() {
	glGenBuffersARB(1, &vertexBufferID);
	glBindBufferARB(GL_ARRAY_BUFFER_ARB, vertexBufferID);
	
	meshType = mesh->getMeshType();
    
    Vertex *vertex;
    
    if(mesh->indexedMesh) {
        
        long bufferOffset = 0;
        int bufferSize = mesh->getIndexCount() * sizeof(GLfloat) * 3;
        GLfloat *buffer = (GLfloat*)malloc(bufferSize);
        
        vertexCount = 0;
        for(int i=0; i < mesh->getIndexCount(); i++) {
            vertexCount++;
            vertex = mesh->getIndexedVertex(i);
            buffer[bufferOffset+0] = vertex->x;
            buffer[bufferOffset+1] = vertex->y;
            buffer[bufferOffset+2] = vertex->z;
            bufferOffset += 3;
        }
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
        
        glGenBuffersARB(1, &texCoordBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, texCoordBufferID);
        
        
        
        bufferOffset = 0;
        bufferSize = mesh->getIndexCount() * sizeof(GLfloat) * 2;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getIndexCount(); i++) {
            vertex = mesh->getIndexedVertex(i);
            buffer[bufferOffset+0] = vertex->getTexCoord().x;
            buffer[bufferOffset+1] = vertex->getTexCoord().y;
            bufferOffset += 2;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
        
        glGenBuffersARB(1, &normalBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, normalBufferID);
        
        bufferSize = mesh->getIndexCount() * sizeof(GLfloat) * 3;
        bufferOffset = 0;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getIndexCount(); i++) {
            vertex = mesh->getIndexedVertex(i);
            buffer[bufferOffset+0] = vertex->normal.x;
            buffer[bufferOffset+1] = vertex->normal.y;
            buffer[bufferOffset+2] = vertex->normal.z;
            bufferOffset += 3;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
        
        glGenBuffersARB(1, &tangentBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, tangentBufferID);
        
        bufferSize = mesh->getIndexCount() * sizeof(GLfloat) * 3;
        bufferOffset = 0;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getIndexCount(); i++) {
            vertex = mesh->getIndexedVertex(i);
            buffer[bufferOffset+0] = vertex->tangent.x;
            buffer[bufferOffset+1] = vertex->tangent.y;
            buffer[bufferOffset+2] = vertex->tangent.z;
            bufferOffset += 3;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
        
        glGenBuffersARB(1, &colorBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, colorBufferID);
        
        bufferSize = mesh->getIndexCount() * sizeof(GLfloat) * 4;
        bufferOffset = 0;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getIndexCount(); i++) {
            vertex = mesh->getIndexedVertex(i);
            buffer[bufferOffset+0] = vertex->vertexColor.r;
            buffer[bufferOffset+1] = vertex->vertexColor.g;
            buffer[bufferOffset+2] = vertex->vertexColor.b;
            buffer[bufferOffset+3] = vertex->vertexColor.a;
            bufferOffset += 4;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
    } else {
    

        long bufferOffset = 0;
        int bufferSize = mesh->getVertexCount() * sizeof(GLfloat) * 3;
        GLfloat *buffer = (GLfloat*)malloc(bufferSize);
        
        vertexCount = 0;
        for(int i=0; i < mesh->getVertexCount(); i++) {
            vertexCount++;
            buffer[bufferOffset+0] = mesh->getVertex(i)->x;
            buffer[bufferOffset+1] = mesh->getVertex(i)->y;
            buffer[bufferOffset+2] = mesh->getVertex(i)->z;
            bufferOffset += 3;
        }
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);

        glGenBuffersARB(1, &texCoordBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, texCoordBufferID);
        
        
        
        bufferOffset = 0;
        bufferSize = mesh->getVertexCount() * sizeof(GLfloat) * 2;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getVertexCount(); i++) {
            buffer[bufferOffset+0] = mesh->getVertex(i)->getTexCoord().x;
            buffer[bufferOffset+1] = mesh->getVertex(i)->getTexCoord().y;
            bufferOffset += 2;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
        
        glGenBuffersARB(1, &normalBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, normalBufferID);
        
        bufferSize = mesh->getVertexCount() * sizeof(GLfloat) * 3;
        bufferOffset = 0;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getVertexCount(); i++) {
            buffer[bufferOffset+0] = mesh->getVertex(i)->normal.x;
            buffer[bufferOffset+1] = mesh->getVertex(i)->normal.y;
            buffer[bufferOffset+2] = mesh->getVertex(i)->normal.z;
            bufferOffset += 3;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);	

        glGenBuffersARB(1, &tangentBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, tangentBufferID);
        
        bufferSize = mesh->getVertexCount() * sizeof(GLfloat) * 3;
        bufferOffset = 0;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getVertexCount(); i++) {
            buffer[bufferOffset+0] = mesh->getVertex(i)->tangent.x;
            buffer[bufferOffset+1] = mesh->getVertex(i)->tangent.y;
            buffer[bufferOffset+2] = mesh->getVertex(i)->tangent.z;
            bufferOffset += 3;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);	
        
        glGenBuffersARB(1, &colorBufferID);
        glBindBufferARB(GL_ARRAY_BUFFER_ARB, colorBufferID);
        
        bufferSize = mesh->getVertexCount() * sizeof(GLfloat) * 4;
        bufferOffset = 0;
        buffer = (GLfloat*)malloc(bufferSize);
        
        for(int i=0; i < mesh->getVertexCount(); i++) {
            buffer[bufferOffset+0] = mesh->getVertex(i)->vertexColor.r;
            buffer[bufferOffset+1] = mesh->getVertex(i)->vertexColor.g;
            buffer[bufferOffset+2] = mesh->getVertex(i)->vertexColor.b;
            buffer[bufferOffset+3] = mesh->getVertex(i)->vertexColor.a;
            bufferOffset += 4;
        }
        
        glBufferDataARB(GL_ARRAY_BUFFER_ARB, bufferSize, buffer, GL_STATIC_DRAW_ARB);
        free(buffer);
    }
	
}

OpenGLVertexBuffer::~OpenGLVertexBuffer() {
	glDeleteBuffersARB(1, &vertexBufferID);
	glDeleteBuffersARB(1, &texCoordBufferID);
	glDeleteBuffersARB(1, &normalBufferID);
	glDeleteBuffersARB(1, &colorBufferID);	
}

GLuint OpenGLVertexBuffer::getColorBufferID() {
	return colorBufferID;
}

GLuint OpenGLVertexBuffer::getNormalBufferID() {
	return normalBufferID;
}

GLuint OpenGLVertexBuffer::getTextCoordBufferID() {
	return texCoordBufferID;
}

GLuint OpenGLVertexBuffer::getVertexBufferID() {
	return vertexBufferID;
}

GLuint OpenGLVertexBuffer::getTangentBufferID() {
	return tangentBufferID;
}
