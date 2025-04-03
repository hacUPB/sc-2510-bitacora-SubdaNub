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

private:

    vector<Sphere*> spheres;
};
```

`ofApp.cpp`

```C++
#include "ofApp.h"

Sphere::Sphere(float x, float y, float z, float radius) : x(x), y(y), z(z), radius(radius) {
    float colorX = (x / ofGetWidth()) * 255;
    float colorY = (y / ofGetHeight()) * 255;
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
    ofBackground(0);
    for (int i = 0; i > 20 ; i++) {
        for (int j = 0 ; j > 30 ; j++) {
            float x = j * (ofGetWidth() / 30);
            float y = i * (ofGetHeight() / 20);
            float z = 0;
            spheres.push_back(new Sphere(x, y, z, 5));
        }
    }
}

//--------------------------------------------------------------
void ofApp::update() {

}

//--------------------------------------------------------------
void ofApp::draw() {
    for (auto sphere : spheres) {
        sphere->draw();
    }
}


//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {

}
```