//
//  ViewController.swift
//  Recording Modifier
//
//  Created by Rachel Thomas on 12/29/14.
//  Copyright (c) 2014 Rachel Thomas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingInProgress: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: UIButton) {
        recordingInProgress.hidden = false
        //TODO: Record the user's voice
        println("in recordAudio")
    }

    @IBAction func stopRecord(sender: AnyObject) {
        recordingInProgress.hidden = true
    }
}

