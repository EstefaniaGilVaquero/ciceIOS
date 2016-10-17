//
//  WWOfertasViewController.swift
//  App_VolksWagenFinal_CICE
//
//  Created by CICE on 17/10/16.
//  Copyright © 2016 icologic. All rights reserved.
//

import UIKit

class WWOfertasViewController: UIViewController {
    
    //MARK: - VARIABLES LOCALES GLOBALES
    var arrayOfertas : WWOfertasModel?
    var CONSTANTES = Constantes()
    var imageGroupTag = 3
    var qrData : String?

    @IBOutlet weak var myImagen: UIImageView!
    @IBOutlet weak var myoferta: UILabel!
    @IBOutlet weak var mymasinfo: UILabel!
    @IBOutlet weak var myfechafin: UILabel!
    
    @IBAction func showQRAction(sender: AnyObject) {
        
        let background = UIView(frame: CGRectMake(0,0, self.view.frame.width, self.view.frame.height))
        background.backgroundColor = UIColor.blackColor()
        background.alpha = 0.7
        background.tag = imageGroupTag
        self.view.addSubview(background)
        
        if qrData != nil{
            
            let anchoImagen = self.view.frame.width / 1.8
            let altoImagen = self.view.frame.height / 3
            
            //1. Creacion de la vista
            let imageViewQRDATA = UIImageView(frame: CGRectMake(self.view.frame.width / 2 - anchoImagen / 2,150, self.view.frame.width / 2 - altoImagen / 2, self.view.frame.height / 3))
            imageViewQRDATA.contentMode = .ScaleAspectFit
            imageViewQRDATA.tag = imageGroupTag
            
            //2. Creacion del QR
            let dataQR = String(arrayOfertas?.id).dataUsingEncoding(NSISOLatin1StringEncoding,allowLossyConversion: false)
            let filterQR = CIFilter(name: "CIQRCodeGenerator")
            filterQR?.setValue(dataQR, forKey: "inputMessage")
            filterQR?.setValue("Q", forKey: "inputCorrectionLevel")
            var qrCodeImage = CIImage()
            qrCodeImage = (filterQR?.outputImage)!
            imageViewQRDATA.image = UIImage(CIImage: qrCodeImage)
            self.view.addSubview(imageViewQRDATA)
            
        }else{
            self.presentViewController(showAlartVC("Estimado usuario", messageData: "tenemos problemas para generar el QR"), animated: true, completion: nil)
            
            
        }
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(WWOfertasViewController.actionGestureRecog(_:)))
        view.addGestureRecognizer(tapGesture)
        
        
        
    }
    
    @IBAction func showVCGaleria(sender: AnyObject) {
        let galeriaImagenes = self.storyboard?.instantiateViewControllerWithIdentifier("galeria") as! WWGaleriaImagenesCochesViewControllerViewController
        
        presentViewController((galeriaImagenes), animated: true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        qrData = String(arrayOfertas?.id)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func actionGestureRecog(gesto : UIGestureRecognizer){
        for subview in self.view.subviews{
            if subview.tag == self.imageGroupTag{
                subview.removeFromSuperview()
            }
        }
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
