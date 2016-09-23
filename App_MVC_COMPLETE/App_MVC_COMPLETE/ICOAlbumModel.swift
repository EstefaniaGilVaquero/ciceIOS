//
//  ICOAlbumModel.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 11/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOAlbumModel: NSObject {
    
    var tituloAlbum : String?
    var artista : String?
    var generoMusical : String?
    var urlCaraturla : String?
    var anyoDisco : String?
    var artistaInvitado : String?
    var festival : String?
    var discografica : String?
    var numeroCancionesDisco : String?
    var premios : String?
    var ventas : String?

    
    init (aTituloAlbum : String,
          aArtista : String,
          aGeneroMusical : String,
          aUrlCaratula : String,
          aAnyoDisco : String,
          aArtistaInvitado : String,
          aFestival : String,
          aDiscografica : String,
          aNumeroCancionesDisco : String,
          aPremios : String,
          aVentas : String){
        
        self.tituloAlbum = aTituloAlbum
        self.artista = aArtista
        self.generoMusical = aGeneroMusical
        self.urlCaraturla = aUrlCaratula
        self.anyoDisco = aAnyoDisco
        self.artistaInvitado = aArtistaInvitado
        self.festival = aFestival
        self.discografica = aDiscografica
        self.numeroCancionesDisco = aNumeroCancionesDisco
        self.premios = aPremios
        self.ventas = aVentas
        super.init()
    }
    
    
    override var description : String{
        return "Titulo del Album : \(tituloAlbum)" +
        "Nombre del Artista : \(artista)" +
        "Genero Musica : \(generoMusical)" +
        "Url de la Caratula : \(urlCaraturla)" +
        "Año del Disco : \(anyoDisco)" +
        "Artista Invitado : \(artistaInvitado)" +
        "Festival : \(festival)" +
        "Discografica : \(discografica)" +
        "Numero de canciones del Album : \(numeroCancionesDisco)" +
        "Premios Obtenidos : \(premios)" +
        "Ventas anuales del Disco: \(ventas)"
    }
    

}
