//
//  ICOPersistanceManager.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 13/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit

class ICOPersistanceManager: NSObject {
    //Aqui vamos a declarar una variable privada, no es constante
    //MARK: - Instancia de Array del Modelo
    private var albumesMusicales = [ICOAlbumModel]()
    
    override init(){
        let album1 = ICOAlbumModel(aTituloAlbum: "Best of Bowie",
                                   aArtista: "David Bowie",
                                   aGeneroMusical: "Pop",
                                   aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/bestofbowie.jpg",
                                   aAnyoDisco: "1992",
                                   aArtistaInvitado: "Falete",
                                   aFestival: "Benidorm",
                                   aDiscografica: "Warner Music",
                                   aNumeroCancionesDisco: "18",
                                   aPremios: "Planeta",
                                   aVentas: "500.000 copias")
        
        let album2 = ICOAlbumModel(aTituloAlbum: "Return of Saturn",
                                   aArtista: "No Doubt",
                                   aGeneroMusical: "Pop",
                                   aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/returnofsaturn.jpg",
                                   aAnyoDisco: "2001",
                                   aArtistaInvitado: "Falete",
                                   aFestival: "Benidorm",
                                   aDiscografica: "Warner Music",
                                   aNumeroCancionesDisco: "18",
                                   aPremios: "Planeta",
                                   aVentas: "500.000 copias")
        
        let album3 = ICOAlbumModel(aTituloAlbum: "Nothing Like The Sun",
                                   aArtista: "Sting",
                                   aGeneroMusical: "Pop",
                                   aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/nothinglikethesun.jpg",
                                   aAnyoDisco: "2005",
                                   aArtistaInvitado: "Tamara",
                                   aFestival: "Benidorm",
                                   aDiscografica: "Warner Music",
                                   aNumeroCancionesDisco: "18",
                                   aPremios: "Goya",
                                   aVentas: "500.000 copias")
        
        let album4 = ICOAlbumModel(aTituloAlbum: "Songo Fascent",
                                   aArtista: "U2",
                                   aGeneroMusical: "Pop",
                                   aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/songofascent.jpg",
                                   aAnyoDisco: "2011",
                                   aArtistaInvitado: "Falete",
                                   aFestival: "Benidorm",
                                   aDiscografica: "Warner Music",
                                   aNumeroCancionesDisco: "18",
                                   aPremios: "Oscar",
                                   aVentas: "500.000 copias")
        
        let album5 = ICOAlbumModel(aTituloAlbum: "Madonna Grandes Exitos",
                                   aArtista: "Madonna",
                                   aGeneroMusical: "Pop",
                                   aUrlCaratula: "http://www.andresocampo.com/pruebas/CICE/albumMusic/madonnamusicalbum.jpg",
                                   aAnyoDisco: "2017",
                                   aArtistaInvitado: "Falete",
                                   aFestival: "Benidorm",
                                   aDiscografica: "Warner Music",
                                   aNumeroCancionesDisco: "18",
                                   aPremios: "Principe de Asturias",
                                   aVentas: "500.000 copias")
        
        //Alimentamos el array
        albumesMusicales = [album1,album2,album3,album4,album5]
        super.init()
        
    }
    
    
    //MARK: - Obtener los albumes musicales
    //GETAlbumMusic
    
    func getAlbumesMusicales() -> [ICOAlbumModel]{
        return albumesMusicales
    }
    
    func addAlbumesMusicales(album : ICOAlbumModel, indice : Int){
        if albumesMusicales.count >= indice{
            albumesMusicales.insert(album, atIndex: indice)
        }else{
            albumesMusicales.append(album)
        }
    }
    
    func deleteAlbumesMusicales(indice : Int){
        albumesMusicales.removeAtIndex(indice)
    }
    
    
    
    
    
    
    
    
    

}
