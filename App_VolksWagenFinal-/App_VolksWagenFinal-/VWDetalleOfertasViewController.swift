//
//  VWDetalleOfertasViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by Formador on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class VWDetalleOfertasViewController: UIViewController {
    
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayOfertasData : VWOfertasModel?
    let CONSTANTES = Constantes()
    var imageGroupTag = 3
    var qrData : String?
    
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImagenOferta: UIImageView!
    @IBOutlet weak var myNombreOferta: UILabel!
    @IBOutlet weak var myMasInformacionOferta: UILabel!
    @IBOutlet weak var myFechaFinOferta: UILabel!
    
    //MARK: - IBACTION
    @IBAction func showQRACTION(sender: AnyObject) {
        //1. creamos nuestra vista semiopaca negra para ser la base de el codigo qr
        let background = UIView(frame: CGRectMake(0,0,self.view.frame.width,self.view.frame.height))
        background.backgroundColor = UIColor.blackColor()
        background.alpha = 0.7
        background.tag = imageGroupTag
        self.view.addSubview(background)
        
        if (qrData != nil){
            //1 . la creacion de la vista
            let anchoImagen = self.view.frame.width / 1.8
            let altoImagen = self.view.frame.height / 3
            
            let imageViewQRDATA = UIImageView(frame: CGRectMake((self.view.frame.width / 2 - anchoImagen / 2), (self.view.frame.height / 2 - altoImagen / 2), anchoImagen, altoImagen))
            
            imageViewQRDATA.contentMode = .ScaleAspectFit
            imageViewQRDATA.tag = imageGroupTag
            //2. la creacion de l Qr
            
            let dataQR = String(arrayOfertasData?.id).dataUsingEncoding(NSISOLatin1StringEncoding, allowLossyConversion: false)
            let filterQR = CIFilter(name: "CIQRCodeGenerator")
            filterQR?.setValue(dataQR, forKey: "inputMessage")
            filterQR?.setValue("Q", forKey: "inputCorrectionLevel")
            var qrCodeImage = CIImage()
            qrCodeImage = (filterQR?.outputImage)!
            imageViewQRDATA.image = UIImage(CIImage: qrCodeImage)
            self.view.addSubview(imageViewQRDATA)
            
        }else{
            self.presentViewController(showAlertVC("Estimado usuario", messageData: "tenemos problemas para generar el Qr"), animated: true, completion: nil)
        }
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(VWDetalleOfertasViewController.actionGestureRecog(_:)))
        view.addGestureRecognizer(tapGesture)
        
        
    }
    
    @IBAction func showGaleriaImagenesACTION(sender: AnyObject) {
        let galeriaImagenes = self.storyboard?.instantiateViewControllerWithIdentifier("galeria") as! VWGaleriaImagenesCochesViewController
        presentViewController(galeriaImagenes, animated: true, completion: nil)
        
    }
    
    func actionGestureRecog(gesto : UIGestureRecognizer){
        for subview in self.view.subviews{
            if subview.tag == self.imageGroupTag{
                subview.removeFromSuperview()
            }
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //Setter de las propiedades
        myNombreOferta.text = arrayOfertasData?.nombre
        myMasInformacionOferta.text = arrayOfertasData?.descripcion
        myFechaFinOferta.text = arrayOfertasData?.fechaFin
        
        qrData = String(arrayOfertasData?.id)
        
        //Setter de la Imagen
        let myImagenOfertaData = arrayOfertasData?.imagen
        let myImagenUrl = NSURL(string: getImagePath(myImagenOfertaData!))
        let myImageData = NSData(contentsOfURL: myImagenUrl!)
        myImagenOferta.image = UIImage(data: myImageData!)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
