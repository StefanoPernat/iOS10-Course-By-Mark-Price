//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Stefano Pernat on 19/01/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit
import AVFoundation

class RetroCalculatorVC: UIViewController {

    @IBOutlet weak var displayLabel: UILabel!
    
    enum Operation: String {
        case Divide = "/"
        case Multiply = "*"
        case Subtract = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var btnSound: AVAudioPlayer!
    var runningNumber = "" // the number you are typing
    var currentOperation = Operation.Empty
    var leftValStr = "", rightValStr = "", result = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "btn", ofType: "wav")
        let soundURL = URL(fileURLWithPath: audioPath!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        displayLabel.text = "0"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonPressed(sender: UIButton){
        playSound()
        runningNumber += "\(sender.tag)"
        displayLabel.text = runningNumber
    }
    
    @IBAction func onDividePressed(sender: UIButton){
        processOperation(operation: .Divide)
    }
    
    @IBAction func onMultiplyPressed(sender: UIButton){
        processOperation(operation: .Multiply)
    }
    
    @IBAction func onSubtractPressed(sender: UIButton){
        processOperation(operation: .Subtract)
    }
    
    @IBAction func onAddPressed(sender: UIButton){
        processOperation(operation: .Add)
    }
    
    @IBAction func onEqualPressed(sender: UIButton){
        processOperation(operation: currentOperation)
    }
    
    @IBAction func onClearPressed(sender: UIButton){
        playSound()
        performClear()
    }
    
    func playSound(){
        if btnSound.isPlaying {
            btnSound.stop()
        }
        
        btnSound.play()
    }
    
    func processOperation(operation: Operation){
        playSound()
        if currentOperation != .Empty {
            if runningNumber != "" {
                rightValStr = runningNumber
                runningNumber = ""
                
                if currentOperation == .Multiply {
                    result = "\(Double(leftValStr)! * Double(rightValStr)!)"
                } else if currentOperation == .Divide {
                    result = "\(Double(leftValStr)! / Double(rightValStr)!)"
                } else if currentOperation == .Subtract {
                    result = "\(Double(leftValStr)! - Double(rightValStr)!)"
                } else if currentOperation == .Add {
                    result = "\(Double(leftValStr)! + Double(rightValStr)!)"
                }
                
                leftValStr = result
                displayLabel.text = result
            }
            
            currentOperation = operation
        } else {
            //First time an operator has been pressed
            leftValStr = runningNumber
            runningNumber = ""
            currentOperation = operation
        }
    }
    
    func performClear(){
        displayLabel.text = "0"
        runningNumber = ""
        leftValStr = ""
        rightValStr = ""
        result = ""
        currentOperation = .Empty
        
    }
}

