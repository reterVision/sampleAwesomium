//
//  main.m
//  testAwesomium
//
//  Created by Gao Chao on 1/12/15.
//  Copyright (c) 2015 gcweb. All rights reserved.
//

#include "application.h"
#include "view.h"
#include <Awesomium/WebCore.h>
#include <Awesomium/STLHelpers.h>

using namespace Awesomium;

class TutorialApp : public Application::Listener {
    Application* app_;
    View* view_;
public:
    TutorialApp()
    : app_(Application::Create()),
    view_(0) {
        app_->set_listener(this);
    }
    
    virtual ~TutorialApp() {
        if (view_)
            app_->DestroyView(view_);
        if (app_)
            delete app_;
    }
    
    void Run() {
        app_->Run();
    }
    
    // Inherited from Application::Listener
    virtual void OnLoaded() {
        view_ = View::Create(1000, 800);

        // < Set up your View here. >
        Awesomium::WebURL url(WSLit("http://www.google.com"));
        view_->web_view()->LoadURL(url);
    }
    
    // Inherited from Application::Listener
    virtual void OnUpdate() {
    }
    
    // Inherited from Application::Listener
    virtual void OnShutdown() {
    }
};

int main(int argc, const char * argv[]) {
    TutorialApp app;
    app.Run();
    return 0;
}