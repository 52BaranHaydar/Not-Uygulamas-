//
//  ViewController.swift
//  NotDefteri
//
//  Created by Baran on 28.12.2025.
//

import UIKit

protocol NoteDelegate: AnyObject {
    func didSaveNote(note: Not)
}


class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource, NoteDelegate{

    @IBOutlet weak var tableView: UITableView!
    
    var notlar: [Not] = []
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    

    @IBAction func butonaTiklandi(_ sender: Any) {
        
        performSegue(withIdentifier: "toNotVC", sender: nil)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notlar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                
                let not = notlar[indexPath.row]
                
                // Başlık
                cell.textLabel?.text = not.baslik
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                
                // Alt başlık (İçeriğin kısa hali)
                cell.detailTextLabel?.text = not.icerik
                
                return cell
    }
    
    func didSaveNote(note: Not) {
        notlar.append(note)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? NotEkleViewController {
            destinationVC.delegate = self
        }
    }
    
    
}

