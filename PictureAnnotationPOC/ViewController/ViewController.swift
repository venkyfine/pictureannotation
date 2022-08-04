//
//  ViewController.swift
//  PictureAnnotationPOC

import UIKit

class ViewController: UIViewController {

    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.delegate = self
        return imagePicker
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func selectImagePressed(sender: UIButton) {
        self.showActionSheet(title: "Select Image", message: "Please chosse option", buttons: ["Camera","Galleray"]) { [unowned self] index, title in
            if index == 0 {
                self.imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
            }
            else if index == 1{
                self.imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
            }
        }
    }
    
    private func navigateToEditingController(image: UIImage) {
        let editingVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ImageEditingViewController") as! ImageEditingViewController
        editingVC.capturedImage = image
        self.navigationController?.pushViewController(editingVC, animated: true)
    }
}

extension ViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info[.editedImage] as? UIImage {
            self.navigateToEditingController(image: image)
        }
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }

}
