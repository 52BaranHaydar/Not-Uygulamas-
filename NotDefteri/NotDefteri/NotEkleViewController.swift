//
//  NotEkleViewController.swift
//  NotDefteri
//
//  Created by Baran on 28.12.2025.
//

import UIKit

class NotEkleViewController: UIViewController {

    @IBOutlet weak var baslikTextField: UITextField!
    @IBOutlet weak var icerikTextView: UITextView!
    
    weak var delegate: NoteDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        icerikTextView.layer.cornerRadius = 10
        
        icerikTextView.layer.borderWidth = 1
        
        icerikTextView.layer.borderColor = UIColor.systemGray4.cgColor
        
        icerikTextView.clipsToBounds = true
        
        
    }
    
    
    @IBAction func kaydetTiklandi(_ sender: Any) {
        
        if let title = baslikTextField.text, !title.isEmpty{
            
            let description = icerikTextView.text ?? ""
            
            let newNote = Not(baslik: title, icerik: description)
            
            delegate?.didSaveNote(note: newNote)
            
            dismiss(animated: true)
        }
        
    }


}
