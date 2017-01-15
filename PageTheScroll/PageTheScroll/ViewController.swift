//
//  ViewController.swift
//  PageTheScroll
//
//  Created by Stefano Pernat on 15/01/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for num in 0...2 {
            let image = UIImage(named: "icon\(num).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            // set imageview position inside the scrollview
            let imageX: CGFloat = view.frame.midX + view.frame.size.width * CGFloat(num)
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: imageX - 75, y: (view.frame.height / 2) - 75, width: 150, height: 150)
        }
        
        print("Count: \(images.count)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

