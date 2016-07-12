//
//  ICOAlbumView.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOAlbumView: UIView {

  //Vamos a añadir variables que solo deben ser vistas en esta clase
    //Esta variable caratula Album representa la portada del Album de musica
    private var caratulaAlbumFinal : UIImageView?
    
    //este inicializador solo se usa cuando no tenemos control del Storyboard, es decir
    //siempre que tengamos el AppDelegate determina el arranque de los controladores y 
    //de las vistas, esto es abstracto para el appDelegate
    init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        
        //Metodo propio
        inicializadorComun()
    }
    
    init(frame: CGRect, caratulaAlbum : String){
        super.init(frame: frame)
        inicializadorComun()
    }
    
    //Esta funcion establece valores predeterminados para la vista del album, vamos a colocar
    //un fondo negro a la vista, con un margen de 5 puntos
    func inicializadorComun(){
        
        backgroundColor = UIColor.blackColor()
        caratulaAlbumFinal = UIImageView(frame: CGRectMake(5, 5, frame.size.width-10, frame.size.height-10))
        caratulaAlbumFinal?.layer.cornerRadius = caratulaAlbumFinal?.frame.size.width / 2
        caratulaAlbumFinal?.contentMode = .ScaleAspectFill
        caratulaAlbumFinal?.clipsToBounds = true
        
        addSubview(caratulaAlbumFinal)
    }
    
    func hightLightAlbum(didHighLightView view : Bool){
        if view{
            backgroundColor = UIColor.whiteColor()
        }else{
            backgroundColor = UIColor.blackColor()
        }

}
