//
//  VWEditarPerfilViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 18/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class VWEditarPerfilViewController: UIViewController {
    
    //MARK: - IBOUTET
    @IBOutlet weak var myImagenPerfil: UIImageView!
    @IBOutlet weak var myNombreUsuarioParse: UITextField!
    @IBOutlet weak var myApellidoUsuarioParse: UITextField!
    @IBOutlet weak var myEmailUsuarioParse: UITextField!
    @IBOutlet weak var myMovilUsuarioParse: UITextField!
    @IBOutlet weak var myLocalidadUsuarioParse: UITextField!
    @IBOutlet weak var myAsociacionUsuarioParse: UITextField!
    
    
    //MARK: - IBACTION
    @IBAction func cerraVC(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func actualziarDatosParse(sender: AnyObject) {
        
        actualizarDatos()
    }
    
    
    
    //MARK: - LIF VC
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findDataFromParse()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //MARK: - UTILS
    func findDataFromParse(){
        //1. primera consulta
        let queryData = PFUser.query()
        queryData?.whereKey("username", equalTo: (PFUser.currentUser()?.username)!)
        queryData?.findObjectsInBackgroundWithBlock({ (objectsBusqueda, errorBusqueda) in
            if errorBusqueda == nil{
                if let objectData = objectsBusqueda{
                    for objectDataBusqueda in objectData{
                        
                        //2. segunda consulta
                        let queryBusquedaFoto = PFQuery(className: "ImageProfile")
                        queryBusquedaFoto.whereKey("username", equalTo: (PFUser.currentUser()?.username)!)
                        queryBusquedaFoto.findObjectsInBackgroundWithBlock({ (objectsBusquedaFoto, errorFoto) in
                            if errorFoto == nil{
                                if let objectsBusquedaFotoData = objectsBusquedaFoto{
                                    for objectsBusquedaFotoBucle in objectsBusquedaFotoData{
                                        let userImageFile = objectsBusquedaFotoBucle["imageFile"] as! PFFile
                                        
                                        //3. tercera consulta
                                        userImageFile.getDataInBackgroundWithBlock({ (imageData, errorImageData) in
                                            if errorImageData == nil{
                                                if let imageDataDesempaquetado = imageData{
                                                    let imagenFinal = UIImage(data: imageDataDesempaquetado)
                                                    self.myImagenPerfil.image = imagenFinal
                                                }
                                            }else{
                                                print("Hola chicos no tenemos imagen :(")
                                            }
                                        })
                                    }
                                }
                            }else{
                                print("Error: \(errorFoto!.userInfo) ")
                            }
                        })
                        self.myNombreUsuarioParse.text = objectDataBusqueda["nombre"] as? String
                        self.myApellidoUsuarioParse.text = objectDataBusqueda["apellido"] as? String
                        self.myEmailUsuarioParse.text = objectDataBusqueda["email"] as? String
                        self.myLocalidadUsuarioParse.text = objectDataBusqueda["localidad"] as? String
                        self.myAsociacionUsuarioParse.text = objectDataBusqueda["asociacion"] as? String
                        self.myMovilUsuarioParse.text = objectDataBusqueda["movilUsuario"] as? String
                    }
                }
            }else{
               self.presentViewController(showAlertVC("Estimado Usuario", messageData: "ha ocurrido un problema en la busqueda de la Base de Datos"), animated: true, completion: nil)
            }
        })
    }
    
    //TODO: - FUNC ACTUALIZAR DATOS
    func actualizarDatos(){
        
        let userUpdateData = PFUser.currentUser()!
        userUpdateData["localidad"] = myLocalidadUsuarioParse.text
        userUpdateData["nombre"] = myNombreUsuarioParse.text
        userUpdateData["apellido"] = myApellidoUsuarioParse.text
        userUpdateData["email"] = myEmailUsuarioParse.text
        userUpdateData["movilUsuario"] = myMovilUsuarioParse.text
        userUpdateData["asociacion"] = myAsociacionUsuarioParse.text
        
        UIApplication.sharedApplication().beginIgnoringInteractionEvents()
        
        userUpdateData.saveInBackgroundWithBlock { (exitoActualizacion, errorActualizacion) in
            
            UIApplication.sharedApplication().endIgnoringInteractionEvents()
            
            if exitoActualizacion{
                print("se han actualizado correctamente los datos")
                //Aqui podriamos meter un metodo de salvado de la imagen
            }else{
                self.presentViewController(showAlertVC("Estimado usuario", messageData: "\(errorActualizacion?.userInfo)"), animated: true, completion: nil)
            }
        }
    }
    
    
    
    
    
    
    
}//TODO: FIN DE LA CLASE


















