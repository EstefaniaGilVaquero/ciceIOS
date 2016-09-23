//
//  ICOLibraryAPI.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOLibraryAPI: NSObject {
    
    //MARK: - VARIABLES LOCALES PRIVADAS
    private let persistanceManager = ICOPersistanceManager()
    private let httpClient = HTTPClient()
    private let isOnline = false
    
    //Aqui solo colocaremos el observador de la notificacion
    override init() {
        super.init()
        //NOTIFICACION
        //En este lado de la ecuacion el "OBSERVADOR" recibe -> cada vez que ICoAlbumView notifique un mensaje "ICODescargaImagenesNotificacion"
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(ICOLibraryAPI.descargaDeImagenes(_:)), name: "ICODescargaImagenesNotificacion", object: nil)
    }
    
    
    //Siempre que tengamos notificcaciones estamos obligados a darse de baja como observador
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    
    //Funcion que descarga la imagen
    func descargaDeImagenes(notificacion : NSNotification){
        let userInfo = notificacion.userInfo as! [String: AnyObject]
        let imageViewData = userInfo["imageView"] as! UIImageView?
        let urlCaratulaData = userInfo["urlCaratula"] as! String
        
        if let imageViewDesempaquetada = imageViewData{
            imageViewDesempaquetada.image = persistanceManager.getImagenesSalvadasLocalmente(urlCaratulaData.lastPathComponent)
            
            if imageViewDesempaquetada.image == nil{
                
                //COLA 2 PLANO
                dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),{
                    let imagenesDescargadas = self.httpClient.downloadImage(urlCaratulaData as String)
                    
                    //COLA 1 PLANO
                    dispatch_async(dispatch_get_main_queue(),{
                        imageViewDesempaquetada.image = imagenesDescargadas
                        self.persistanceManager.salvarLocalmenteImagenes(imagenesDescargadas, fileName: urlCaratulaData.lastPathComponent)
                        })
                })
            }
        }
        
    }
    
    
    
    //Creamos el patron Singleton
    //1.Creamos una variable de clase como una variable de tipo computarizada (OBJC)
    
    class var sharedInstance : ICOLibraryAPI{
        //2. Anidamos dentro de la variable una struct llamada Singleton
        //c++ y de Haskell -> Swift
        struct Singleton {
            //3. Envuelve una constante estatica, esta es la variable implicitamente perezosa, es decir,
            //se crea cuando sea absolutamente necesario, y una unica vez.
            static let instance = ICOLibraryAPI()
        }
        //4. Devuelve la propiedad de tipo computerizado
        return Singleton.instance
    }
    
    //MARK: - Peristance Manager
    
    func getAlbumesMusicales() -> [ICOAlbumModel]{
        return persistanceManager.getAlbumesMusicales()
    }
    
    func addAlbumesMusicales (album : ICOAlbumModel, indice : Int){
        persistanceManager.addAlbumesMusicales(album, indice: indice)
        if isOnline{
            httpClient.postRequest("/api/addAlbumesMusicales", body: album.description)
        }
    }
    
    func deleteAlbumesMusicales(indice : Int){
        persistanceManager.deleteAlbumesMusicales(indice)
        if isOnline{
            httpClient.postRequest("/api/deleteAlbumesMusicales", body: "\(indice)")
        }
    }

}

extension String{
    var lastPathComponent : String{
        get{
            return(self as NSString).lastPathComponent
        }
    }
}
