//
//  ViewController.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/13/23.
//

import UIKit
import Nuke


class ViewController: UIViewController {

    @IBOutlet weak var banana1: UIImageView!
    
    @IBOutlet weak var cherry3: UIImageView!
    @IBOutlet weak var broccoli2: UIImageView!
    @IBOutlet weak var banana3: UIImageView!
    @IBOutlet weak var banana2: UIImageView!
    @IBOutlet weak var cherry2: UIImageView!
    @IBOutlet weak var broccoli1: UIImageView!
    @IBOutlet weak var cherry1: UIImageView!
    
    
    @IBAction func LetsCookButton(_ sender: Any) {
        performSegue(withIdentifier: "showUpload", sender: self)
    }
    @IBAction func findRecipesButton(_ sender: Any) {
        performSegue(withIdentifier: "loading", sender: self)
    }
    @IBOutlet weak var PanImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = Bundle.main.url(forResource: "pan", withExtension: "png") {
            Nuke.loadImage(with: url, into: PanImage)
        } else {
            print("Image not found.")
        }
        
        if let url = Bundle.main.url(forResource: "cherry", withExtension: "png") {
            Nuke.loadImage(with: url, into: cherry1)
            Nuke.loadImage(with: url, into: cherry2)
            Nuke.loadImage(with: url, into: cherry3)
            
        } else {
            print("Image not found.")
        }
        if let url1 = Bundle.main.url(forResource: "banana", withExtension: "png") {
            Nuke.loadImage(with: url1, into: banana1)
            Nuke.loadImage(with: url1, into: banana2)
            Nuke.loadImage(with: url1, into: banana3)

            
        } else {
            print("Image not found.")
        }
        if let url2 = Bundle.main.url(forResource: "broccoli", withExtension: "png") {
            Nuke.loadImage(with: url2, into: broccoli1)
            Nuke.loadImage(with: url2, into: broccoli2)
        } else {
            print("Image not found.")
        }

    }


}

