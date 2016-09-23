//
//  ViewController.swift
//  App_play_music
//
//  Created by cice on 12/9/16.
//  Copyright © 2016 cice. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var customPlayer = AVAudioPlayer()
    
    @IBOutlet weak var mySliderVolume: UISlider!

    @IBAction func myVolumeSliderACTION(sender: AnyObject) {
        customPlayer.volume = mySliderVolume.value
    }
    
    
    @IBAction func myPlayButtonBUTTON(sender: AnyObject) {
        customPlayer.play()
    }
    
    @IBAction func myPauseButtonACTION(sender: AnyObject) {
        customPlayer.pause()
    }
    
    
    @IBAction func myStopButtonACTION(sender: AnyObject) {
        customPlayer.stop()
        customPlayer.currentTime = 0
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //1. Obtenemos el fichero
        let audioPath = NSBundle.mainBundle().pathForResource("09 I Appear Missing", ofType: "mp3")
        let url = NSURL (fileURLWithPath: audioPath!)
        
        var writeError : NSError?
        
        do{
            customPlayer = try AVAudioPlayer(contentsOfURL: url)
        }catch let error1 as NSError{
            writeError = error1
            print(error1.description)
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

