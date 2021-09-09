//
//  ViewController.swift
//  Journal
//
//  Created by Nathan Wawro on 9/9/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    var entry: Entry?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = entry?.title
        contentsTextView.text = entry?.contents
    }
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text,
              let contents = contentsTextView.text,
              !title.isEmpty,
              !contents.isEmpty else { return }
        if let entry = entry {
            
            EntryManager.shared.update(entry: entry, newTitle: title, newContents: contents)
        }else{
            EntryManager.shared.createEntry(title: title, contents: contents)
        }
        navigationController?.popViewController(animated: true)
    }
}

