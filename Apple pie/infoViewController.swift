//
//  infoViewController.swift
//  Apple pie
//
//  Created by Наталья Шарапова on 01.08.2021.
//

import UIKit

class infoViewController: UIViewController {
    
    var infoImage = UIImage()
    var infoText = ""

    @IBOutlet weak var infoImageView: UIImageView!
    @IBOutlet weak var infoTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        infoImageView.image = infoImage
        infoTextView.text = infoText
      }
}
    

