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
ubicado en ofApp.h , el objeto declarado "Sphere* selectedSphere"

#### ¿Cómo se inicializa el puntero?
en el metodo "ofApp:setup" 