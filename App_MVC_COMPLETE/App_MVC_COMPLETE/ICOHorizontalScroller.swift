//
//  ICOHorizontalScroller.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 15/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

//MARK: - PROTOCOLOS DELEGADOS
protocol ICOHorizontalScrollerDelegate {
    //1. Pedimos al delegado el numero de elementos que se quieren presentar en la vista
    func numeroVistasEnHorizontalScroller(scroller : ICOHorizontalScroller) -> Int
    
    //2. Pedimos al delegado el objeto que debe aparecer segun el indice
    func vistaPorIndiceHorizontalScroller(scroller : ICOHorizontalScroller, indice : Int) -> UIView
    
    //3. Informar al delegado cuando se haga click en una vista
    func clickVistaPorIndiceHorizontalScroller(scroller : ICOHorizontalScroller, indice : Int)
    
    //4. Pedimos al delegado que nos muestre la vista inicial del indice (0)
    func vistaInicial(scroller : ICOHorizontalScroller) -> Int
    
}


class ICOHorizontalScroller: UIView {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var icoDelegate : ICOHorizontalScrollerDelegate?
    
    //1. Definimos unas constantes para que sea facil de modificar el diseño, las dimensiones de la vista seran 100x100 con un margen de 10 puntos
    private let VIEW_PADDING = 10
    private let VIEW_DIMENSIONS = 100
    private let VIEW_OFF_SETT = 100
    
    //2 -> Creamos la vista del desplazador que contendrá las subvistas
    private var desplazadorHorizontal : UIScrollView!
    
    //3 -> Creamos una coleccion que contendra todas las portadas de las vistas
    var myArrayVistas = [UIView]()
    
    //4 ->
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        inicializadorScrollView()
    }
    
    //MARK: - INICIALIZADOR
    func inicializadorScrollView(){
        //1 -> construimos un scroll view y lo añadimos a la vista padre
        desplazadorHorizontal = UIScrollView()
        addSubview(desplazadorHorizontal)
        
        //2 -> Desactivamos el tamaño automatico de las mascaras, para poder aplicar nuestras propias limitaciones o constrains
        desplazadorHorizontal.translatesAutoresizingMaskIntoConstraints = false
        
        //3 -> Aplicamos restricciones al scrollView
        self.addConstraint(NSLayoutConstraint(item: desplazadorHorizontal,attribute: .Leading,relatedBy: .Equal,toItem: self,
            attribute: .Leading,multiplier: 1.0,constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: desplazadorHorizontal,attribute: .Trailing,relatedBy: .Equal,toItem: self,
            attribute: .Trailing,
            multiplier: 1.0,
            constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: desplazadorHorizontal,
            attribute: .Top,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Top,
            multiplier: 1.0,
            constant: 0.0))
        
        self.addConstraint(NSLayoutConstraint(item: desplazadorHorizontal,
            attribute: .Bottom,
            relatedBy: .Equal,
            toItem: self,
            attribute: .Bottom,
            multiplier: 1.0,
            constant: 0.0))
        
        //4. -> Ahora creamos un gesto de reconocimiento(GRIFO /TAP) este debe reconocer toques en la pantalla
        //y hace reaccionar posteriormente al desplazador, ademas identifica si se ha aprovechado esa reaccion para notificarsela al DELEGADO
        
        let gestoReconocimientoTap = UITapGestureRecognizer(target: self, action: #selector(ICOHorizontalScroller.desplazadorTocado(_:)))
        
        desplazadorHorizontal.addGestureRecognizer(gestoReconocimientoTap)
        desplazadorHorizontal.delegate = self
        
    }
    
    func desplazadorTocado(gestureRecognizer : UITapGestureRecognizer){
        //Devolvemos el punto calculado en la vista
        let ubicacion = gestureRecognizer.locationInView(gestureRecognizer.view)
        
        if let delegate = icoDelegate{
            //1 -> Invocamos el numero de vistas en el scroll horizontal(delegado), entender el mensaje
            for indice in 0..<delegate.numeroVistasEnHorizontalScroller(self){
                //2 -> por cada vista en el carrusel de vistas dentro del desplazador
                let view = desplazadorHorizontal.subviews[indice]
                //3 -> debemos comprobar si es exitoso o no, si se ha encontrado algo en el instante que se ha pulsado la imagen
                if CGRectContainsPoint(view.frame, ubicacion){
                    delegate.clickVistaPorIndiceHorizontalScroller(self, indice: indice)
                    desplazadorHorizontal.setContentOffset(CGPoint(x:view.frame.origin.x - self.frame.size.width / 2 + view.frame.size.width / 2, y: 0), animated: true)
                }
            }
        }
    }
    
    
    func vistaIndiceObjeto(indice : Int) -> UIView{
        //Agregamos esta funcion para acceder a una caratula del album, de nuestro carrusel de imagenes del scrollView
        //simplemente nos devuelve la vista en un indice determinado, posteriormente la utilizaremos para realizar la caratula del album
        
        if myArrayVistas.count > indice{
            return myArrayVistas[indice]
        }else{
            return myArrayVistas[myArrayVistas.count - 1]
        }
    }
    
    //debemos recargar nuestro carrusel de imagenes dentro del scroll horizontal(esto se parece al reloadData / UI TABLE VIEW
    
    func recargarDatosHorizontalScroller(){
        
        //1. Comprobamos si hay delegado antes de realizar alguna carga
        if let delegado = icoDelegate{
            //2. puesto que estamos limpiando y revisando datos de las caratulas, limpiamos el array y reestablecemos el array
            myArrayVistas = []
            let vistas : NSArray = desplazadorHorizontal.subviews
            for vista in vistas{
                vista.removeFromSuperview()
            }
            //3. Valor x es el punto de partida de las vistas en el interior del desplazador
            var valorX = VIEW_OFF_SETT
            
            for indice in 0..<delegado.numeroVistasEnHorizontalScroller(self){
                //4. El scrollHorizontal pide a su delegado la vista de uno en uno, al lado del otro. Añadimos una nueva vista a la posicion de la derecha.
                valorX += VIEW_PADDING
                
                let vista = delegado.vistaPorIndiceHorizontalScroller(self, indice: indice)
                
                vista.frame = CGRectMake(CGFloat(valorX), CGFloat(VIEW_PADDING), CGFloat(VIEW_DIMENSIONS), CGFloat(VIEW_DIMENSIONS))
                desplazadorHorizontal.addSubview(vista)
                myArrayVistas.append(vista)
                
                valorX += VIEW_OFF_SETT + VIEW_PADDING
                
                //Una vez que todos los puntos de vista estan en su lugar, establecemos el contenido del desplazador, para darle al usuario interactividad con las distintas caratulas(ANCHO Y ALTO)
         
                self.desplazadorHorizontal.contentSize = CGSizeMake(CGFloat(valorX + VIEW_OFF_SETT), frame.size.height)
                
               // if let vistaInicial = icoDelegate?.vistaInicial(self){
                //    desplazadorHorizontal.setContentOffset(CGPoint(x: CGFloat(vistaInicial) * CGFloat((VIEW_DIMENSIONS) + (2 * VIEW_PADDING)),y:0), animated: true)
               // }
                
                if let vistaInicial = icoDelegate?.vistaInicial(self){
                    desplazadorHorizontal.setContentOffset(CGPoint(x: CGFloat(vistaInicial) * CGFloat(VIEW_DIMENSIONS + (2 * VIEW_PADDING)),y:0), animated: true)
                }
            }
        }
    }
    
    //Cuando los datos hayan cambiado --> aqui es donde recargamos los datos
    override func didMoveToSuperview() {
        recargarDatosHorizontalScroller()
    }
    
    func centrarVistaActualAlbumMusical(){
        var puntoCentralFinal = Int(desplazadorHorizontal.contentOffset.x) + VIEW_OFF_SETT / 2
        let vistaIndice = puntoCentralFinal / (VIEW_OFF_SETT + (2 * VIEW_PADDING))
        puntoCentralFinal = vistaIndice * (VIEW_OFF_SETT + (2 * VIEW_PADDING))
        desplazadorHorizontal.setContentOffset(CGPoint(x: puntoCentralFinal, y: 0), animated: true)
        if let delegate = icoDelegate{
            delegate.clickVistaPorIndiceHorizontalScroller(self, indice: vistaIndice)
        }
    }
    
    

}

//MARK: - DELEGATE / SCROLLVIEW

extension ICOHorizontalScroller : UIScrollViewDelegate{
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        centrarVistaActualAlbumMusical()
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate{
            centrarVistaActualAlbumMusical()
        }
    }
}


























