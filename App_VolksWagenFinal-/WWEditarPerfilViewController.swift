//
//  WWEditarPerfilViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 18/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit
import Parse

class WWEditarPerfilViewController: UIViewController {
    
    //MARK: - IBOUTLETS
    @IBOutlet weak var myNombre: UITextField!
    @IBOutlet weak var myApellido: UITextField!
    @IBOutlet weak var myEmail: UITextField!
    @IBOutlet weak var miMovil: UITextField!
    @IBOutlet weak var myLocalidad: UITextField!
    @IBOutlet weak var myAsociacion: UITextField!
    @IBOutlet weak var myImagenPerfil: UIImageView!
    
    //MARK: - IBACTION
    
    @IBAction func cerrarVC(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    @IBAction func actualizarDatosParse(sender: AnyObject) {
        
        myNombre.text = ""
        myApellido.text = ""
        myEmail.text = ""
        
    }
    
    

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
        //Primera consulta
        let queryData = PFUser.query()
        queryData?.whereKey("username", equalTo: (PFUser.currentUser()?.username)!)
        queryData?.findObjectsInBackgroundWithBlock({ (objectsConsulta, errorConsulta1) in
            if errorConsulta1 == nil{
                if let objectsData = objectsConsulta{
                    for objectDataConsulta in objectsData{
                        //Segunda consulta
                        let queryConsultaFoto = PFQuery(className: "ImageProfile")
                        queryConsultaFoto.whereKey("username", equalTo: (PFUser.currentUser()?.username)!)
                        queryConsultaFoto.findObjectsInBackgroundWithBlock({ (objectsConsultaFoto, errorConsulta2) in
                            if errorConsulta2 == nil{
                                if let objectsConsultaFotoData = objectsConsulta{
                                    for objectsConsultaFotoBucle in objectsConsultaFotoData{
                                        let userImageFile = objectsConsultaFotoBucle["imageFile"] as! PFFile
                                        userImageFile.getDataInBackgroundWithBlock({ (imageData, errorImageData) in
                                            if errorImageData == nil{
                                                if let imageDataDesempaquetado = imageData{
                                                    let imagenFinal = UIImage(data: imageDataDesempaquetado)
                                                    self.myImagenPerfil.image = imagenFinal
                                                }
                                            }else{
                                                print("Esto de mongoDB es un infierno")
                                            }
                                            
                                        })
                                    }
                                }
                            }else{
                                print("Error: \(errorConsulta2!.userInfo) ")
                            }
                        })
                        
                    }
                }
                
                
            }else{
                self.presentViewController(showAlartVC("Estimado usuario", messageData: "Ha ocurrido un problema en la consulta a BBDD"), animated: true, completion: nil)
            }
        })
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}







