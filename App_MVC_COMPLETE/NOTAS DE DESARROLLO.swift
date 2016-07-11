//ESTAS SON NOTAS DE DESARROLLO

/****************************************************************/
//FASE 1
/****************************************************************/

/*
 proceso de desarrollo de esta aplicacion, en donde conoceremos los patrones de diseño de COCOA
 mas comunes (ARQUITECTURA DE SOFTWARE ALTO NIVEL)
 
 1. Creacionas -> SINGLETON
 2. Estructural -> MVC, Decorador, Adaptador, fachada
 3. Comportamiento -> Observadores(Notification Center y KVO) y Memento(Persistencia de datos)
 
 PATRONES DE COMUNICACION APPLE
 Target / Action
 Delegate
 Notificaciones Center (repasar las notificaciones push)
 KVO
 
 <-->
 Siempre que creamos un proyecto en XCODE en su codigo esta implicito los patrones de diseño MVC, DELEGATE, SINGLETON entre otros.codigo
 
 1. Para empezar debemos crearnos 2 clases, una para "conservar" y otra para "mostrar" los datos de albumes de musica
    -> ICOAlbumModel tendrá 5 variables y el constructor o incicializador designado
 
 2. Crearemos la clase ICOAlbumView, extenderá de UIView 
    -> Aqui es necesario declarar la variable con sus inicializadores y dentro de este inicializador colocamos un "inicializador comun" (metodo propio)
 
 
 //EL REY DE LA ARQUITECTURA DEL SOFTWARE MVC
 1. EL MODELO -> Objeto que contiene los datos de la aplicacion y define como manipularlo(ICOAlbumModel)
 2. VISTA -> Los objetos que están a cargo de la representacion visual del modelo y son los controladores que
    permitiran interactuar al usuario(ICOAlbumView)
 3. CONTROLADOR -> Es la clave mediadora que coordina todo el trabajo, este accede a los datos del modelo y los muestra
    de manera sincronizada en las vistas. Escucha los eventos y manipula los datos segun sea necesario.(ViewController)
 
 
 //COMO USAR EL MVC
 
 1. PATRON SINGLETON
    1. -> Garantiza que solo exista una instancia de una clase determinada y por lo general utiliza una carga lena(carga perezosa(lazy)) ->
 
 
 /**/*/
