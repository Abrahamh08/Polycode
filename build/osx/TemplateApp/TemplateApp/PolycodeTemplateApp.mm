//
// Polycode template. Write your code here.
// 

#include "PolycodeTemplateApp.h"


PolycodeTemplateApp::PolycodeTemplateApp(PolycodeView *view) {
    core = new CocoaCore(view, 1280/2,720/2,false,false, 0,0,60, 0, true);
    
    core->addFileSource("archive", "default.pak");
    ResourcePool *globalPool = Services()->getResourceManager()->getGlobalPool();
    globalPool->loadResourcesFromFolder("default", true);

    core->addFileSource("archive", "hdr.pak");
    globalPool->loadResourcesFromFolder("hdr", true);
    
    Polycode:Script *rotateScript = (Script*) globalPool->loadResource("rotate.lua");
    
	// Write your code here!
    
    Scene *scene = new Scene(Scene::SCENE_2D);
    scene->useClearColor = true;
    scene->clearColor.setColor(0.2, 0.2, 0.2, 1.0);
    
   // scene->setOverrideMaterial((Material*)globalPool->getResource(Resource::RESOURCE_MATERIAL, "Unlit"));
    
    for(int i=0; i  < 5; i++) {
        test = new ScenePrimitive(ScenePrimitive::TYPE_VPLANE, 0.5, 0.5);
        test->setMaterialByName("Unlit");
        test->attachScript(rotateScript);
        test->getShaderPass(0).shaderBinding->loadTextureForParam("diffuse", "main_icon.png");
        test->setPosition(RANDOM_NUMBER * 0.5, RANDOM_NUMBER * 0.4);
        test->setBlendingMode(Renderer::BLEND_MODE_NONE);
        test->setScale(0.3, 0.3);
        scene->addChild(test);
        tests.push_back(test);
    }
    Camera *camera = scene->getDefaultCamera();

    fpsLabel = new SceneLabel("FPS:", 32, "mono", Label::ANTIALIAS_FULL, 0.1);
    scene->addChild(fpsLabel);
    fpsLabel->setPositionX(-0.6);
    
    Services()->getInput()->addEventListener(this, InputEvent::EVENT_KEYDOWN);
}

void PolycodeTemplateApp::handleEvent(Event *event) {
    InputEvent *inputEvent = (InputEvent*) event;
}

PolycodeTemplateApp::~PolycodeTemplateApp() {
    
}

bool PolycodeTemplateApp::Update() {
    Number elapsed = core->getElapsed();
    
    if(Services()->getRenderer()->getRenderThread()->getFrameInfo().timeTaken > 0) {
        fpsLabel->setText("FPS:"+String::IntToString(1000/Services()->getRenderer()->getRenderThread()->getFrameInfo().timeTaken));
    }
    
    return core->updateAndRender();
}