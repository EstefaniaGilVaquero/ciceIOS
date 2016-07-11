//
//  ICOAlbumModel.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import Cocoa

class ICOAlbumModel: NSObject {
    
    var tituoAlbum : String?
    var artista : String?
    var generoMusical : String?
    var urlCaraturla : String?
    var anyoDisco : String?
    
    init (aTituloAlbum : String,
          aArtista : String,
          aGeneroMusical : String,
          aUrlCaratula : String,
          aAnyoDisco : String){
        
        self.tituoAlbum = aTituloAlbum
        self.artista = artista
        self.generoMusical = aGeneroMusical
        self.urlCaraturla = aUrlCaratula
        self.anyoDisco = aAnyoDisco
        super.init()
    }
    
    
    override var description : String{
        return "Titulo del Album : \(tituloAlbum)" +
        "Nombre del Artista : \(artista)" +
        "Genero Musica : \(generoMusical)" +
        "Url de la Caratula : \(urlCaraturla)" +
        "Año del Disco : \(anyoDisco)"
    }
    

}
