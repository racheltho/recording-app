//
//  PlaySoundsViewController.swift
//  Recording Modifier
//
//  Created by Rachel Thomas on 1/1/15.
//  Copyright (c) 2015 Rachel Thomas. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {

    var audioPlayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    
    var audioEngine:AVAudioEngine!
    var audioFile:AVAudioFile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        if var filePath = NSBundle.mainBundle().pathForResource("jph1", ofType: "mp3") {
//            var filePathUrl = NSURL.fileURLWithPath(filePath)
//            audioPlayer = AVAudioPlayer(contentsOfURL: filePathUrl, error: nil)
//            audioPlayer.enableRate = true
//        }else {
//            println("the filePath is empty")
//        }
        audioPlayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        audioPlayer.enableRate = true
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: receivedAudio.filePathUrl, error: nil)
        
        NSNotificationCenter.defaultCenter().addObserverForName(
            AVAudioSessionRouteChangeNotification, object: nil, queue: NSOperationQueue.mainQueue(), usingBlock: {
                (note:NSNotification!) in
                //println("change route \(note.userInfo)")
                
                println("current output :\(AVAudioSession.sharedInstance().currentRoute.outputs[0].UID)")
                if (AVAudioSession.sharedInstance().currentRoute.outputs[0].UID) == "Built-In Receiver" {
                    
                    AVAudioSession.sharedInstance().overrideOutputAudioPort(AVAudioSessionPortOverride.Speaker, error: nil)
                    
                }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playFastAudio(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.rate = 1.8
        audioPlayer.play()
    }

    @IBAction func playSlowly(sender: AnyObject) {
        audioPlayer.stop()
        audioPlayer.rate = 0.5
        audioPlayer.play()
    }
    
    @IBAction func playChipmunk(sender: AnyObject) {
        playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playDarthVader(sender: AnyObject) {
        playAudioWithVariablePitch(-1000)
    }
    
    func playAudioWithVariablePitch(pitch: Float){
        audioPlayer.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        var audioPlayerNode = AVAudioPlayerNode()
        audioEngine.attachNode(audioPlayerNode)
        
        var changePitchEffect = AVAudioUnitTimePitch()
        changePitchEffect.pitch = pitch
        audioEngine.attachNode(changePitchEffect)
        
        audioEngine.connect(audioPlayerNode, to: changePitchEffect, format: nil)
        audioEngine.connect(changePitchEffect, to: audioEngine.outputNode, format: nil)

        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    
    @IBAction func stopAudio(sender: AnyObject) {
        audioPlayer.stop()
        audioEngine.stop()
    }
    
    @IBAction func newRecording(sender: AnyObject) {
        audioPlayer.stop()
        audioEngine.stop()
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
