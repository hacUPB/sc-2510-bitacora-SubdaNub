`ofApp.h`

```C++
#pragma once

#include "ofMain.h"


class Sphere {
public:
    Sphere(float x, float y, float z, float radius);
    void draw();
    void update(float x, float y, float z);
    float getX();
    float getY();
    float getZ();
    float getRadius();

private:
    float x, y, z;
    float radius;
    ofColor color;
};

class ofApp : public ofBaseApp {

public:
    void setup();
    void update();
    void draw();
    

    void mouseMoved(int x, int y);
    void mousePressed(int x, int y, int button);
    void keyPressed(int key);

    ofEasyCam camera;

private:

    vector<Sphere*> spheres;
};
```

`ofApp.cpp`

```C++
#include "ofApp.h"

Sphere::Sphere(float x, float y, float z, float radius) : x(x), y(y), z(z), radius(radius) {
    float colorX = (x / 10) * 255;
    float colorY = (y / 10) * 255;
    float colorZ = z;

    color = ofColor(colorX, colorY, colorZ);
}

void Sphere::draw() {
    ofSetColor(color);
    ofDrawSphere(getX(), getY(), getZ(), 5);
}

void Sphere::update(float x, float y, float z) {
    this->x = x;
    this->y = y;
    this->z = z;

}

float Sphere::getRadius() {
    return radius;
}

float Sphere::getX() {
    return x;
}

float Sphere::getY() {
    return y;
}

float Sphere::getZ() {
    return z;
}

//--------------------------------------------------------------
void ofApp::setup() {
    for (int x = -ofGetWidth() / 2; x < ofGetWidth() / 2; x += 10) {
        for (int y = -ofGetHeight() / 2; y < ofGetHeight() / 2; y += 10) {
            spheres.push_back(new Sphere(x, y, 0, 50));
        }
    }
}

//--------------------------------------------------------------
void ofApp::update() {
    // Move the camera with arrow keys
    if (ofGetKeyPressed(OF_KEY_LEFT)) {
        camera.pan(-1);
    }
    if (ofGetKeyPressed(OF_KEY_RIGHT)) {
        camera.pan(1);
    }
    if (ofGetKeyPressed(OF_KEY_UP)) {
        camera.tilt(-1);
    }
    if (ofGetKeyPressed(OF_KEY_DOWN)) {
        camera.tilt(1);
    }
}

//--------------------------------------------------------------
void ofApp::draw() {
    camera.begin();

    for (auto sphere : spheres) {
        sphere->draw();
    }

    camera.end();
}


//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {

}

//--------------------------------------------------------------

void ofApp::mousePressed(int x, int y, int button) {

}

void ofApp::keyPressed(int key) {
    if (key == 'a') { 

    }
}
```