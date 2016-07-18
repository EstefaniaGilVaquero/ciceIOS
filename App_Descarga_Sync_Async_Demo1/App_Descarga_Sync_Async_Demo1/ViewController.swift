//
//  ViewController.swift
//  App_Descarga_Sync_Async_Demo1
//
//  Created by cice on 18/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageViewIV: UIImageView!
    @IBOutlet weak var myActivityIndicatorAI: UIActivityIndicatorView!
    
    
    
    
    @IBAction func syncMethodDownload(sender: AnyObject) {
        
        //---------- LLAMADAS SINCRONAS-----------//
        // Gran parte del tiempo de las operaciones que realiza un programa en su ejecución se pierde esperando. Esperando que los datos lleguen del disco. Esperando que el usuario pulse una tecla. Esperando que el paquete se mande por red. Esperando, esperando y esperando.
     
        // La solución clásica a este problema es proporcionarle ese tiempo de espera a otro proceso de manera que se aproveche el uso de CPU. Nuestro proceso se bloquea mientras espera (y si va a esperar mucho incluso se quita de memoria y guarda en disco) y otro toma su lugar. Cuando llega la señal de que la espera ha terminado (y se queda la CPU libre) nuestro proceso se reanuda.
        // Existen diversas políticas de reparto del tiempo de CPU entre los distintos procesos para que este reparto sea lo más útil posible. Por ejemplo, primando al proceso con el que el usuario está trabajando.
        // Ahora bien. Desde el punto de vista del programa, ¿qué significa este sistema? Significa que cuando la llamada a una función que realiza una operación termina, la operación se ha completado y que, implícitamente, nuestro programa ha estado esperado a que terminase.
   
        // Debido a que la terminación de la operación y la reanudación del programa ocurren a la vez, se dice que estamos realizando llamadas síncronas.
       
        // f=leer_fichero()
        // //Hasta que no se lee el fichero no llegamos aquí
        // t=leer_teclado()
        // //Hasta que no se lee el teclado no llegamos aquí
        // buscar(f,t)
        // //Resto del programa
        //-----------------------------------------//
        
        let url = NSURL(string: "Http://alertaonline.com/wp-content/uploads/obama-6.jpg")
        let data = NSData(contentsOfURL: url!)
        let image = UIImage(data: data!)
        myImageViewIV.image = image
        
        myActivityIndicatorAI.hidden = false
        myActivityIndicatorAI.stopAnimating()
        
        
    }
    @IBAction func asyncMethodDownload(sender: AnyObject) {
        
        //---------- LLAMADAS ASINCRONAS-----------//
        //
        //        La alternativa es no esperar, ser asíncronos. Debido a que no esperamos ocurren dos cosas:
        //
        //        No bloqueamos la ejecución de nuestro programa. Por esta razón a las llamadas asíncronas también se les dice no bloqueantes y a las síncronas, bloqueantes.
        //        La llamada retorna antes de que se complete la operación y, por tanto, no puede devolver el resultado.
        //
        //        Bien. El punto 1 era lo requerido, ¿pero cómo solucionamos el punto 2? Existen varias opciones.
        //
        //        Pipes: conectar de alguna manera la operación con otra antes de solicitar su realización.
        //        Polling: preguntar cada cierto tiempo a ver si se ha completado la operación. No suele ser buena idea ya que perdemos tiempo en preguntar.
        //        Interrupción: esperar a una señal y que nuestro programa o el sistema ejecute, en el momento que se recibe la señal, un código en respuesta a la misma. Es importante ver aquí que este           código está desligado del punto en el que se solicitó la operación mediante la llamada asíncrona.
        //        Eventos/mensajes: es una mejora sobre polling. Cuando termina la operación se envía un mensaje que se encola. El programa no pregunta si una operación en concreto se ha completado. Sólo comprueba si ha llegado algún mensaje. Esto le indica que una operación de las muchas en curso se ha completado. Cada mensaje tiene un indicador de la operación completada y deberá ser respondido correspondientemente, de forma similar a como se hacía con las interrupciones.
        //        Hebras o fibras: nos rendimos. Usamos llamadas síncronas, pero en vez de que bloqueen mi programa, doy opciones de por dónde se puede continuar la ejecución. En el caso de las hebras es el sistema operativo el que decide cómo planificar la ejecución, en el caso de la fibra es mi propio programa el que lo hace.
        //        Sincronizar (p.ej. por futuros/promesa): nos rendimos definitivamente. Seguimos ejecutando como si nada mientras no necesitemos el resultado. En el momento que necesitemos el resultado, esperamos hasta tenerlo.
        //        Retrollamadas: como interrupción, pero indico qué código hay que ejecutar en el momento de realizar la llamada asíncrona. Esto tiene el efecto de bifurcar el flujo de control y analizaremos esto en lo que resta de artículo.


        //-----------------------------------------//
        
        let queue = dispatch_queue_create("downloadsSecondPriority", nil)
        let url = NSURL(string: "http://www.wnd.com/files/2012/10/OBAMA-RING-wh-photo-THERE-IS-NO-GOD-EXCEPT-ALLAH1.jpg")
        
        self.myActivityIndicatorAI.hidden = false
        self.myActivityIndicatorAI.stopAnimating()
        
        //creamos la cola en segundo plano
        dispatch_async(queue){
            
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            
            //Cola principal
            dispatch_async(dispatch_get_main_queue(), { 
                self.myImageViewIV.image = image
                
                self.myActivityIndicatorAI.hidden = true
                self.myActivityIndicatorAI.stopAnimating()
                
            })
            
            
        }
        
    }
    
    @IBAction func asyncPlusMethodDownload(sender: AnyObject) {
        
        //---------RETROLLAMADAS/CALLBACK----------------//
        //        Lo que realmente está en auge son las retrollamadas (callbacks), sobre todo desde que C# incluyera soporte en el lenguaje para la programación asíncrona. Pero vayamos por partes. ¿Qué es esto de una retrollamada?
        //
        //        Usaremos el ejemplo de arriba.
        //
        //        f=leer_fichero()
        //        t=leer_teclado()
        //        buscar(f,t)
        //        //Resto del programa
        //
        //        Con retrollamadas, en vez de esperar el resultado de las funciones, indico a estas funciones qué tienen que hacer cuando terminen.
        //
        //        leer_fichero_asincrono(usa_fichero)
        //        leer_teclado_asincrono(usa_teclado)
        //
        //        //Resto del programa
        //
        //
        //        Así, en el caso de leer_fichero_asincrono() lo que hago es decirle que, cuando termine de leer el fichero llame a la función usa_fichero(). Igualmente, con leer_teclado_asincrono(). Estas funciones usa_fichero() y usa_teclado() que se ejecutan cuando se completa la operación son las retrollamadas.
        //
        //        Acabadas las presentaciones, lo importante aquí es que la función  leer_fichero_asincrono() no espera y la ejecución continúa. Se ejecuta leer_teclado_asincrono() y tampoco espera, seguimos ejecutando lo que haya que ejecutar despues y, mientras, se lee del fichero y del teclado a la vez.
        //
        //        ¿Y dónde está la función buscar() que es donde realmente hacemos algo con lo leído? Bueno, no podemos llamarla hasta que estemos seguros de que tanto el fichero como el teclado se han leído. Esa es la responsabilidad de usa_fichero() y usa_teclado() que deben guardar los datos, comprobar que están ambos y, si es así, llamar la función buscar() con ellos.
        //
        //        var f, t string;
        //        func usa_fichero(rf) { f = rf; if t!="" {buscar(f,t)} }
        //        func usa_teclado(rt) { t = rt; if f!="" {buscar(f,t)} }
        //
        //        //Resto del programa
        //
        //
        //        Para eso guardamos los datos recibidos en dos variables visibles por ambas retrollamadas y cuando se comprueba que ambas cadenas se han leído, llama a buscar().

        
        
        
        fotoObama { (image) in
            self.myImageViewIV.image = image
        }
    }
    
    typealias imageClosure = (image: UIImage) -> ()
    
    func fotoObama(callBack : imageClosure){
        
        dispatch_async(dispatch_get_global_queue(0, 0)){
            let url = NSURL(string: "http://www.dogguie.net/wp-content/uploads/2011/01/obama-comun-15.jpg")
            let data = NSData(contentsOfURL: url!)
            let image = UIImage(data: data!)
            dispatch_async(dispatch_get_main_queue(), {
                callBack(image: image!)
            })
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Cuando carga por primera vez ponemos el indicador de carga oculto
        myActivityIndicatorAI.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //------------ NOTAS SOBRE CLOUSURES/FUNCIONES ANONIMAS ------------------//
//    Funciones anónimas
//    El ejemplo anterior es algo engorroso ya que hay que definir una función por cada retrollamada que se quiera usar. Este hecho ha sido determinante para que no se usaran mucho las retrollamadas. Por fortuna, los lenguajes de programación van evolucionando y se han ido adaptando ideas que venían de lenguajes menos conocidos y académicos. Una de esas ideas son las funciones anónimas y sus clausuras léxicas.
//    
//    Con funciones anónimas el código del ejemplo anterior se reduce lo suficiente como para que sea atractivo su uso.
//    
//    var f, t string;
//    
//    leer_fichero_asincrono(rf => { f = rf; if t!="" {buscar(f,t) } )
//    leer_teclado_asincrono(rt => { t = rt; if f!="" {buscar(f,t) } )
//    
//    //Resto del programa
//    
//    
//    Aunque no hemos solucionado el detalle de que la función buscar() aparece escrita dos veces aunque sólo se llamará una. En este ejemplo es una pequeña tontería, pero en ejemplos mayores el grado de verbosidad aumenta y se dificulta el mantenimiento del programa.
//    
//    Quiero resaltar aquí que una función asíncrona bifurca el flujo de control ya que van a ocurrir dos cosas a la vez: la operación que haga la función (se hará la retrollamada cuando se complete) y el resto del programa (ya que la función retorna inmediatamente). De manera que si escribo algo como esto:
//    
//    asincrona( x => parte1(x) )
//    parte2()
//    
//    
//    La parte 1 y la parte 2 se ejecutan, a la vez o en momentos distintos, pero no en secuencia. Es más, una vez que la parte 1 se haya completado, ese flujo de control bifurcado muere sin hacer nada más. La parte 2 que es el resto del programa seguirá su ejecución hasta que muera cuando el proceso acabe.
//    
//    
//    Composición de retrollamadas
//    En el ejemplo anterior se hacían a la vez tres cosas:
//    
//    La lectura del fichero
//    La lectura del teclado
//    La ejecución del resto del programa
//    
//    Hemos realizado una composición en paralelo de las operaciones. ¿Qué pasa si por la razón que sea debo leer el teclado después de leer el fichero? El ejemplo cambiaría tal y como sigue:
//    
//    var f, t string;
//    leer_fichero_asincrono(f => { leer_teclado_asincrono(t => buscar(f,t)) })
//    
//    //Resto del programa
//    
//    
//    En este caso lo que tenemos es una composición en serie (o secuencia) de las operaciones. Se hacen a la vez dos cosas:
//    
//    La lectura del fichero y luego la del teclado
//    La ejecución del resto del programa
//    
//    Si bien la composición en paralelo introducía duplicación de código y la necesidad de usar variables auxiliares, la composición en serie introduce el anidamiento sintáctico de las expresiones. En los programas reales ambos efectos conllevan un aumento de la verbosidad que se ha dado en llamar el infierno de las retrollamdas.


}

