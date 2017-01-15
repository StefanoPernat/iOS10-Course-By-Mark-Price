//
//  ViewController.swift
//  MiraclePill
//
//  Created by Stefano Pernat on 14/01/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var statePicker: UIPickerView!
    @IBOutlet weak var statePickerBtn: UIButton!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var buyNowBtn: UIButton!
    
    
    let states = ["Alaska", "Arkansas", "Alabama", "California", "Maine", "New York"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        statePicker.dataSource = self
        statePicker.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stateBtnPressed(_ sender: UIButton) {
        // show state picker and hide country, zipcode and buy button
        statePicker.isHidden = false
        zipCodeLabel.isHidden = true
        zipCode.isHidden = true
        countryLabel.isHidden = true
        country.isHidden = true
        buyNowBtn.isHidden = true
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return states.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return states[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // set button title to the selected state hide state picker and show zip code, country, buy button
        statePickerBtn.setTitle(states[row], for: UIControlState.normal)
        statePicker.isHidden = true
        zipCodeLabel.isHidden = false
        zipCode.isHidden = false
        countryLabel.isHidden = false
        country.isHidden = false
        buyNowBtn.isHidden = false
    }
}

