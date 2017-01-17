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
    
    let minPage = 0, maxPage = 2
    var currentPage = 0
    var images = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //set content length of the scrollview
        var contentWidth: CGFloat = 0
        let scrollWidth: CGFloat = scrollView.frame.size.width
        let scrollHeight: CGFloat = scrollView.frame.size.height
        
        for num in 0...2 {
            let image = UIImage(named: "icon\(num).png")
            let imageView = UIImageView(image: image)
            images.append(imageView)
            
            // set imageview position inside the scrollview
            let imageX: CGFloat = (scrollWidth / 2) + scrollWidth * CGFloat(num)
            contentWidth += imageX
            
            scrollView.addSubview(imageView)
            imageView.frame = CGRect(x: imageX - 75, y: (scrollHeight / 2) - 75, width: 150, height: 150)
        }
        
        print("Count: \(images.count)")
        scrollView.contentSize = CGSize(width: contentWidth, height: scrollHeight)
        scrollView.clipsToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func detectSwipe(_ sender: UISwipeGestureRecognizer) {
        if currentPage < maxPage && sender.direction == UISwipeGestureRecognizerDirection.left {
            moveScrollView(direction: 1)
        }
        
        if currentPage > minPage && sender.direction == UISwipeGestureRecognizerDirection.right {
            moveScrollView(direction: -1)
        }
    }

    func moveScrollView(direction: Int){
        currentPage += direction
        
        let point: CGPoint = CGPoint(x: scrollView.frame.size.width * CGFloat(currentPage), y: 0.0)
        scrollView.setContentOffset(point, animated: true)
        
        //Create animation for increasing the icon on the screen
        UIView.animate(withDuration: 0.2) {
            self.images[self.currentPage].transform = CGAffineTransform.init(scaleX: 1.4, y: 1.4)
            
            for x in 0..<self.images.count {
                if x != self.currentPage {
                    self.images[x].transform = CGAffineTransform.identity
                }
            }
        }
    }
}

