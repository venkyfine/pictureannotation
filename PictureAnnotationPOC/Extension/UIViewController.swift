//
//  UIViewController.swift
//  PictureAnnotationPOC

import UIKit

extension UIViewController {
    func showActionSheet(title : String? = nil,message : String? = nil,buttons : [String],actionHandler : @escaping ((Int,String) -> ())) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index,text) in buttons.enumerated(){ //  adding all actions by passin in buttons
            alertController.addAction(UIAlertAction(title: text, style: .default, handler: { (action) in
                actionHandler(index,text) //  return index  and action of title on press
            }))
        }
        
            alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                actionHandler(buttons.count + 1,"Cancel")
            }))
        present(alertController, animated: true, completion: nil)
    }
    
}
