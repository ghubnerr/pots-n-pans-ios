//
//  UploadViewController.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import UIKit

class UploadViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var hasUploadedImage: Bool = false
    var imageUploaded : String = ""

    @IBOutlet weak var imagePickerButton: UIButton!
    
    @IBOutlet weak var messageLabel: UILabel!
    var overlayView: UIView?

    @IBAction func imgPicker(_ sender: Any) {
        let picker = UIImagePickerController()
        
        picker.allowsEditing = true
        
        picker.delegate = self
        present(picker, animated:true)
        
    }

        
    @IBAction func FindRecipesButton(_ sender: Any) {
        if shouldPerformSegue(withIdentifier: "loading", sender: self) {
               performSegue(withIdentifier: "loading", sender: self)
           }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        overlayView = createOverlayView()
        imagePickerButton.addSubview(overlayView!)
        overlayView?.frame = imagePickerButton.bounds
        overlayView?.isUserInteractionEnabled = false
        overlayView?.isHidden = true
            
        // Do any additional setup after loading the view.
    }
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "loading" {
            if hasUploadedImage {
                // Perform the segue only if an image has been uploaded
                return true
            } else {
                // Show an alert or handle the case where no image has been uploaded
                messageLabel.textColor = UIColor.red
                messageLabel.text = "Upload a picture first!"
                return false
            }
        }
        // Allow other segues
        return true
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
                    if let base64String = selectedImage.jpegData(compressionQuality: 0.5)?.base64EncodedString() {
                        imageUploaded = base64String
                        hasUploadedImage = true
                        messageLabel.textColor = UIColor.systemGreen
                        messageLabel.text = "Picture Uploaded!"
                    }
                }
                picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            hasUploadedImage = false

           picker.dismiss(animated: true, completion: nil)
       }
    
    func createOverlayView() -> UIView {
            let overlayView = UIView()
            overlayView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            overlayView.layer.cornerRadius = 40.0

            return overlayView
        }

    @IBAction func imagePickerButtonPressed(_ sender: Any) {
        overlayView?.isHidden = false
    }
    @IBAction func imagePickerButtonReleased(_ sender: Any) {
        overlayView?.isHidden = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loading" {
            // Make sure the destination view controller is of the correct type
            if let destinationVC = segue.destination as? LoadingViewController {
                // Pass any necessary data to the destination view controller
                destinationVC.uploadedImage = imageUploaded
            }
        }
    }

}
