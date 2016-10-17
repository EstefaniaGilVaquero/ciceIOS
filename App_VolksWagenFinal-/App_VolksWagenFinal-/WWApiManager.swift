//
//  WWApiManager.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 5/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWApiManager: NSObject {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    private let CONSTANTES = Constantes()
    private let concesionarios = WWConcesionariosParser()
    private let catalogoPruebas = WWCatalogoPruebasParser()
    private let ofertas = VWOfertasParser()
    
    //MARK: - SINGLETON
    class var sharedInstance : WWApiManager{
        struct SingletonApp{
            static let instance = WWApiManager()
        }
        return SingletonApp.instance
    }
    
    //MARK: - GETCONCESIONARIO
    func getConcesionarioParse() -> [WWConcesionariosModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL_CONCESIONARIOS)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayConcesionarios = concesionarios.getConcesionariosModel(jsonData!)
        return arrayConcesionarios
    }
    
    //MARK: - CATALOGO PRUEBAS
    func getCatalogoPruebasParse() -> [WWCatalogoPruebas]{
        let url = NSURL(string: CONSTANTES.BASE_URL_CATALOGO_PRUEBAS)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayCatalogoPruebas = catalogoPruebas.getCatalogoPruebasModel(jsonData!)
        return arrayCatalogoPruebas
    }
    
    //MARK: - CATALOGO PRUEBAS
    func getOfertasParse() -> [WWOfertasModel]{
        let url = NSURL(string: CONSTANTES.BASE_URL_OFERTAS)
        let jsonData = NSData(contentsOfURL: url!)
        let arrayOfertas = ofertas.getOfertasModel(jsonData!)
        return arrayOfertas
    }

}
