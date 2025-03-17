# Actividad 1
```C++
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup(){
    ofBackground(0);
}

//--------------------------------------------------------------
void ofApp::update(){

}

//--------------------------------------------------------------
void ofApp::draw(){
    ofSetColor(255);
    ofDrawCircle(ofGetMouseX(), ofGetMouseY(), 20);
}
```
#### ¿Cuál es el resultado que se obtiene al ejecutar este programa?

Este progarama comienza con el metodo Setup dibujando un "Background" como 0, esto crea un objeto que ocupa toda la pantalla de color negro, ya que no tiene valores de luz.

Luego, en el metodo Draw crea el color 255 (blanco), y toma la dirección X y Y actual del mouse para dibujar un circulo de radio de 20 unidades

# Actividad 2
#### ¿Qué fue lo que incluimos en el archivo .h?
Agregamos funciones que se encargan de interactuar con el mouse, y removimos los que no se van a utilizar.

#### ¿Cómo funciona la aplicación?
Se dibujan circulos sobre el mouse cada vez que este se mueve, que cambian a un color aleatorio cuando se hace click.
hay cierto limite de circulos permitidos en pantalla, al intentar sobrepasar este limite, el circulo mas antíguo se elimina.

#### ¿Qué hace la función mouseMoved?
Se encarga de controlar la cantidad de circulos en pantalla, eliminando el mas antiguo si se intenta sobrepasar el limite.

#### ¿Qué hace la función mousePressed?
Cambia el color de los circulos de manera aleatoria, alterando los valores de RGB de manera independiente.

#### ¿Qué hace la función setup?
Se encarga de reproducir las funciones iniciales de los programas y esta función solo se reproduce una vez. 
En este caso, asigna un el fondo como 0 (negro), y luego asigna un primer color a los circulos que se dibujan como 255 (blanco).

#### ¿Qué hace la función update?
Se encarga de actualizar las funciones de las variables, pero en este caso, no hay comandos en esta función.

#### ¿Qué hace la función Draw?
Se encarga de generar objetos, en este caso, es la funcion encargada de generar circulos de cierto color

# Actividad 3
#### Modifica alguna parte del codigo anterior código.
```C++
#include "ofApp.h"

//--------------------------------------------------------------
void ofApp::setup() {
    ofBackground(255); // Fondo cambiado de negro a blanco
    particleColor = ofColor::white;
}

//--------------------------------------------------------------
void ofApp::update() {

}

//--------------------------------------------------------------
void ofApp::draw() {
    for (auto& pos : particles) {
        ofSetColor(particleColor);
        ofDrawCircle(pos.x, pos.y, ofRandom(20,50)); //Ahora el tamaño de los circulos ocila de manera aleatoria con cada frame
    }
}

//--------------------------------------------------------------
void ofApp::mouseMoved(int x, int y) {
    particles.push_back(ofVec2f(x, y));
    particleColor = ofColor(ofRandom(255), ofRandom(255), ofRandom(255)); // los movimientos del mouse ahora cambia el color de los circulos de manera aleatoria
    if (particles.size() > 100) {
        particles.erase(particles.begin());
    }
}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {
    particleColor = ofColor(0); // ahora precionar el mouse fija el color de los circulos a negro
}
```
# Actividad 5
#### ¿Cuál es la definición de un puntero?
Es una variable que tiene la dirección de memoria de otra variable, se usa como un acceso indirecto a la variable de referencia.

#### ¿Dónde está el puntero?
ubicado en ofApp.h, dentro de la clase ofAPP, se declara un puntero de tipo `Sphere` como `Sphere*`.

#### ¿Cómo se inicializa el puntero?
en el metodo `ofApp:setup` cuando la aplicación inicia, el comando `selectedSphere = nullptr` se encarga de limpiar el valor, indicando que no se utilizará inmediatamente

#### ¿Para qué se está usando el puntero?
Se utiliza para almacenar la esfera a la que el mouse de click, y esta esfera seguirá el mouse.

#### ¿Qué es exactamente lo que está almacenado en el puntero?
El puntero está almacenando la dirección de un objeto de tipo `Sphere`, la dirección de la esfera seleccionada es almacenada en el puntero `selectedSphere`

# Actividad 6
#### El código anterior tiene un problema. ¿Puedes identificar cuál es?
El codigo falla en permitir soltar la esfera seleccionada y también impide seleccionar otra esfera que que sea mas pequeña que la esfera seleccionada actual.

#### ¿Cómo lo solucionarías?

Dentro de ofApp.cpp, en la clase mousePressed.
```C++
void ofApp::mousePressed(int x, int y, int button) {

    if (button == OF_MOUSE_BUTTON_LEFT) {
        for (auto sphere : spheres) {
            float distance = ofDist(x, y, sphere->getX(), sphere->getY());

            if (distance < sphere->getRadius()) {

                if (sphere == selectedSphere)   //Verificamos si la esfera seleccionada ya está dentro del puntero
                {
                    selectedSphere = nullptr;   //limpiamos el puntero, por lo cual, soltamos la esfera
                    break;
                }
                else 
                {
                    selectedSphere = sphere;    // si no estaba dentro del puntero, la almacenamos ahi, por ende, agarramos la esfera
                    break;
                }
                
                
            }
        }
    }
}
```
# Actividad 7
#### ¿Qué sucede cuando presionas la tecla “c”?
Un mensaje aparece diciendo "Intentando crear objeto" seguido de la posicion donde está ubicado, pero la posición dada no hacen parte de las cordenadas de un plano cartesiano.

#### ¿Qué sucede cuando presionas la tecla “c” con el codigo modificado?
Un mensaje aparece diciendo "Intentando crear objeto" seguido de la posicion donde está ubicado con coordenadas X y Y, y por ultimo tambien aparece una esfera coloreada en pantalla.

#### ¿Por qué ocurre esto?
El instanciamiento en el primer codigo es almacenado como una variable creada dentro del metodo y queda dentro del stack, haciendo que sea borrada una vez se salga de ese metodo, por ende, cuando el programa intenta dibujar la esfera, sale del metodo y la esfera es borrada. mientras que el segundo codigo almacena la esfera dentro del heap utilizando `new`, y es capaz de dibujar la esfera exitosamente

# Actividad 8
#### Construye un experimento (un programa) en el que puedas crear y dibujar objetos que se almacenan:
#### En el heap:
`ofApp.h`
``` C++
#pragma once

#include "ofMain.h"


class Sphere {
public:
    Sphere(float x, float y, float radius);
    void draw();
    void update(float x, float y);
    float getX();
    float getY();
    float getRadius();

private:
    float x, y;
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
``` C++
#include "ofApp.h"

Sphere::Sphere(float x, float y, float radius) : x(x), y(y), radius(radius) {
    color = ofColor(ofRandom(255), ofRandom(255), ofRandom(255));
}

void Sphere::draw() {
    ofSetColor(color);
    ofDrawCircle(x, y, radius);
}

void Sphere::update(float x, float y) {
    this->x = x;
    this->y = y;
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

//--------------------------------------------------------------
void ofApp::setup() {
    ofBackground(0);

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
    
     float thisx = x;
     float thisy = y;
     float radius = 40;
     spheres.push_back(new Sphere(thisx, thisy, radius));

}

//--------------------------------------------------------------
void ofApp::mousePressed(int x, int y, int button) {

}
```

#### En el Stack:

