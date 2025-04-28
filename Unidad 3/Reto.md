`ofApp.h`

```C++
#pragma once

#include "ofMain.h"
#include "ofCamera.h"

class Sphere {
public:
    Sphere(float x, float y, float z, float radius);
    void draw();
    void update(float x, float y, float z, ofColor color);
    float getX();
    float getY();
    float getZ();
    float getRadius();
    

    glm::vec3 position;  // Position of the sphere's center
    float radius;        // Radius of the sphere

    Sphere(glm::vec3 pos, float r) : position(pos), radius(r) {}

private:
    float x, y, z;
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

    bool rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint);
    void convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd);

    ofEasyCam camera;

private:

    vector<Sphere*> spheres;
    float distDiv = 0;
    float amplitud = 0;
    bool sphereSelected = false;
    string intersectionInfo;
};
```

`ofApp.cpp`

```C++
#include "ofApp.h"
#include "ofMain.h"

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

void Sphere::update(float x, float y, float z, ofColor color) {
    this->x = x;
    this->y = y;
    this->z = z;
    this->color = color;
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
            spheres.push_back(new Sphere(x, y, 0, 5));
        }
    }
}

//--------------------------------------------------------------
void ofApp::update() {

    for (auto sphere : spheres) {
        
        float x = sphere->getX();
        float y = sphere->getY();
        float z = cos(ofDist(x, y, 0, 0) / distDiv) * amplitud;
        sphere->update(x, y, z, ofColor(x,y,z));

        
    }
}

//--------------------------------------------------------------
void ofApp::draw() {
    camera.begin();

    for (auto sphere : spheres) {
        sphere->draw();
    }

    camera.end();

    if (!intersectionInfo.empty()) {
        ofSetColor(255); // Set text color to white
        ofDrawBitmapString(intersectionInfo, 10, 20);
    }
}



//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {

}

//--------------------------------------------------------------

void ofApp::mousePressed(int x, int y, int button) {
    // Convertir las coordenadas del mouse en un rayo 3D
    glm::vec3 rayStart, rayEnd;
    convertMouseToRay(x, y, rayStart, rayEnd);

    // Comprobar si el rayo intersecta alguna esfera
    for (auto& sphere : spheres) {
        glm::vec3 intersectionPoint;

        sphereSelected = false;
        if (rayIntersectsSphere(rayStart, rayEnd - rayStart, sphere->position, 5.0, intersectionPoint)) {
            sphereSelected = true;
            stringstream ss;
            
            ss << "Intersected Sphere Position: ("
                << sphere->position.x << ", "
                << sphere->position.y << ", "
                << sphere->position.z << ")";
            intersectionInfo = ss.str();
        }
    }
}

void ofApp::keyPressed(int key) {
    if (key == 'a') {
        distDiv = distDiv - 5;
    }
    if (key == 'd') {
        distDiv = distDiv + 5;
    }
    if (key == 'w') {
        amplitud = amplitud + 5;
    }
    if (key == 's') {
        amplitud = amplitud - 5;
    }
}

void ofApp::convertMouseToRay(int mouseX, int mouseY, glm::vec3& rayStart, glm::vec3& rayEnd) {
    // Obtener matrices de proyección y modelo/vista de la cámara
    glm::mat4 modelview = camera.getModelViewMatrix();
    glm::mat4 projection = camera.getProjectionMatrix();
    ofRectangle viewport = ofGetCurrentViewport();

    // Convertir coordenadas del mouse a Normalized Device Coordinates (NDC)
    float x = 2.0f * (mouseX - viewport.x) / viewport.width - 1.0f;
    float y = 1.0f - 2.0f * (mouseY - viewport.y) / viewport.height;

    // Crear el rayo en NDC
    glm::vec4 rayStartNDC(x, y, -1.0f, 1.0f); // Near plane
    glm::vec4 rayEndNDC(x, y, 1.0f, 1.0f);   // Far plane

    // Convertir a coordenadas mundiales
    glm::vec4 rayStartWorld = glm::inverse(projection * modelview) * rayStartNDC;
    glm::vec4 rayEndWorld = glm::inverse(projection * modelview) * rayEndNDC;

    rayStartWorld /= rayStartWorld.w;
    rayEndWorld /= rayEndWorld.w;

    rayStart = glm::vec3(rayStartWorld);
    rayEnd = glm::vec3(rayEndWorld);
}

// Detectar si el rayo intersecta una esfera
bool ofApp::rayIntersectsSphere(const glm::vec3& rayStart, const glm::vec3& rayDir, const glm::vec3& sphereCenter, float sphereRadius, glm::vec3& intersectionPoint) {
    glm::vec3 oc = rayStart - sphereCenter;

    float a = glm::dot(rayDir, rayDir);
    float b = 2.0f * glm::dot(oc, rayDir);
    float c = glm::dot(oc, oc) - sphereRadius * sphereRadius;

    float discriminant = b * b - 4 * a * c;

    if (discriminant < 0) {
        return false;
    }
    else {
        float t = (-b - sqrt(discriminant)) / (2.0f * a);
        intersectionPoint = rayStart + t * rayDir;
        return true;
    }
}
```