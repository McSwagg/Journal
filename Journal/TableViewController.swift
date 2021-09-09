//
//  TableViewController.swift
//  Journal
//
//  Created by Nathan Wawro on 9/9/21.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryManager.shared.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = EntryManager.shared.entries[indexPath.row]
            EntryManager.shared.delete(entry: entry)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard segue.identifier == "addExistingEntry",
           let indexPath = tableView.indexPathForSelectedRow,
           let destination = segue.destination as? ViewController else { return }
        let entry = EntryManager.shared.entries[indexPath.row]
        destination.entry = entry
    }
}
