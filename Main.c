#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <stdbool.h> 
#include "Perimetro.h"
#include "Area.h"
#include "Superficie.h"
#include "Volumen.h"
#include <time.h>
#define MAX_LARGO 100

int preguntarFiguraGeometrica(char* figuras[]);
int preguntarMetodo(int indice, char* figura);
void calcularPerimetro(int figura);
void calcularArea(int figura);
void calcularSuperficie(int figura);
void calcularVolumen(int figura);
void calcular(int metodo, int figura);
bool preguntarContinuar();
bool iniciarUsuario();
void init();
void guardar_log(char* usuario, char* accion);
char* fecha();

int main(){
    char usuario[MAX_LARGO], clave[MAX_LARGO];
    printf("Ingresa tus credenciales (Puedes ver tus credenciales en el archivo usuarios.txt):\n");
    printf("\nUsuario: ");
    scanf("%s", usuario);
    printf("\nClave: ");
    scanf("%s", clave);
    bool userValido = iniciarUsuario(usuario, clave);
    if (userValido){
        guardar_log(usuario, "Ingreso exitoso al sistema");
        init(usuario);
    }
    else{
        guardar_log(usuario, "Ingreso fallido usuario/clave erróneo");
        printf("Usuario o clave invalida, revise el archivo usuarios.txt\n");
    }
    guardar_log(usuario, "Salida del sistema");
}

void init(char* usuario){
    char *figuras[200] = {"Triangulo", "Paralelogramo", "Cuadrado", "Rectangulo", "Rombo", "Trapecio", "Circulo", "Poligono Regular", "Cubo", "Cuboide", "Cilindro Recto", "Esfera", "Cono Circular Recto"};
    bool continuar = true;
    do {
        int indiceFigura = preguntarFiguraGeometrica(figuras);
        guardar_log(usuario, figuras[indiceFigura-1]);
        int metodo = preguntarMetodo(indiceFigura, figuras[indiceFigura-1]);
        calcular(metodo, indiceFigura);
        continuar = preguntarContinuar();
    } while (continuar);
}

bool iniciarUsuario(char* usuario, char* clave){
    FILE *archivo = fopen("usuarios.txt", "r");
    char linea[MAX_LARGO];
    while (fgets(linea, sizeof(linea), archivo)){
        char usuarioArchivo[MAX_LARGO];
        char claveArchivo[MAX_LARGO];
        if (sscanf(linea, "%[^-]-%s", usuarioArchivo, claveArchivo) == 2){
            if (strcmp(usuario, usuarioArchivo) == 0 && strcmp(clave, claveArchivo) == 0) {
                fclose(archivo);
                return true;
            }
        }
    }
    return false;
}

void guardar_log(char* usuario, char* accion){
    FILE *archivo = fopen("log.txt", "a");
    fprintf(archivo, "%s-%s-%s\n", fecha(),usuario, accion);
    fclose(archivo);
}

char* fecha(){
    time_t tiempo_actual;
    struct tm *tiempo_local;
    tiempo_actual = time(NULL);
    tiempo_local = localtime(&tiempo_actual);
    static char fecha_formateada[50];
    strftime(fecha_formateada, sizeof(fecha_formateada), "%Y-%m-%d %H:%M:%S", tiempo_local);
    return fecha_formateada;
}

int preguntarFiguraGeometrica(char* figuras[]){
    char pregunta[500] = "";

    for (int i = 0; i < 13; i++) {
        char opcion[35];
        sprintf(opcion, "%d. %s\n", i+1, figuras[i]);
        strcat(pregunta, opcion);
    }
    
    char respuesta[2];
    printf("\nElige una figura:\n%s\n", pregunta);
    scanf("%s", respuesta);

    return atoi(respuesta);
}

int preguntarMetodo(int indice, char* figura){
    char respuesta[2];
    if (indice <= 8){
        printf("\n¿Desea calcular perimetro o area de la figura %s?:\n1.Perimetro\n2.Area\n", figura);
        scanf("%s", respuesta);
        return atoi(respuesta);
    }
    else{
        printf("\n¿Desea calcular superficie o volumen de la figura %s?:\n1.Superficie\n2.Volumen\n", figura);
        scanf("%s", respuesta);
        return atoi(respuesta)+2;
    }
    return 0;
}

void calcularPerimetro(int figura){
    switch (figura){
        case 1:
            preguntarPerimetroTriangulo();
            break;
        case 2:
            preguntarPerimetroParalelogramo();
            break;
        case 3:
            preguntarPerimetroCuadrado();
            break;
        case 4:
            preguntarPerimetroRectangulo();
            break;
        case 5:
            preguntarPerimetroRombo();
            break;
        case 6:
            preguntarPerimetroTrapecio();
            break;
        case 7:
            preguntarPerimetroCirculo();
            break;
        case 8:
            preguntarPerimetroPoligonoRegular();
            break;
    }
}

void calcularArea(int figura){
    switch (figura){
        case 1:
            preguntarAreaTriangulo();
            break;
        case 2:
            preguntarAreaParalelogramo();
            break;
        case 3:
            preguntarAreaCuadrado();
            break;
        case 4:
            preguntarAreaRectangulo();
            break;
        case 5:
            preguntarAreaRombo();
            break;
        case 6:
            preguntarAreaTrapecio();
            break;
        case 7:
            preguntarAreaCirculo();
            break;
        case 8:
            preguntarAreaPoligonoRegular();
            break;
    }
}

void calcularSuperficie(int figura){
    switch (figura){
        case 9:
            preguntarSuperficieCubo();
            break;
        case 10:
            preguntarSuperficieCuboide();
            break;
        case 11:
            preguntarSuperficieCilindroRecto();
            break;
        case 12:
            preguntarSuperficieEsfera();
            break;
        case 13:
            preguntarSuperficieConoCircularRecto();
            break;
    }
}

void calcularVolumen(int figura){
    switch (figura){
        case 9:
            preguntarVolumenCubo();
            break;
        case 10:
            preguntarVolumenCuboide();
            break;
        case 11:
            preguntarVolumenCilindroRecto();
            break;
        case 12:
            preguntarVolumenEsfera();
            break;
        case 13:
            preguntarVolumenConoCircularRecto();
            break;
    }
}

void calcular(int metodo, int figura){
    switch (metodo){
        case 1:
            calcularPerimetro(figura);
            break;
        case 2:
            calcularArea(figura);
            break;
        case 3:
            calcularSuperficie(figura);
            break;
        case 4:
            calcularVolumen(figura);
            break;
    }
}

bool preguntarContinuar(){
    char respuesta[2];
    printf("\n¿Desea calcular algo mas? (Presione 1 para si, 0 para no):\n");
    scanf("%s", respuesta);
    return atoi(respuesta) == 1;
}