//
//  ViewController.swift
//  HelloooooWorld
//
//  Created by Stefano Pernat on 11/01/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var titleImg: UIImageView!
    @IBOutlet weak var welcomeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func welcomePressed(_ sender: Any) {
        backgroundImg.isHidden = false
        titleImg.isHidden = false
        welcomeBtn.isHidden = true
    }

}

