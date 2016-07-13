//
//  ICOAlbumModelExtension.swift
//  App_MVC_COMPLETE
//
//  Created by cice on 13/7/16.
//  Copyright © 2016 cice. All rights reserved.
//

import Foundation

extension ICOAlbumModel{
    func icoe_tableRepresentation() -> (titulos : [String], valores: [String]) {
        return (["Artista", "Album Musical", "Genero", "Año"], [artista!,tituoAlbum!,generoMusical!,anyoDisco!])
    }
}