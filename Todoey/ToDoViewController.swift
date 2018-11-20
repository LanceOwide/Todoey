//
//  ViewController.swift
//  Todoey
//
//  Created by Lance Owide on 20/11/2018.
//  Copyright © 2018 Lance Owide. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    

    var itemArray = ["Find Mike","Buy Eggs","Destroy Dragons"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
//    MARK - Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
    }

    
//    Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
//        check to see if there already exist a check mark, if there is remove it, if there isnt add it
        
        if  tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
//    add new items
    
    
    @IBAction func addNewItemButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Add Item", style: .default) { (UIAlertAction) in
//            what will happen once the user clicks the add itme on our UI altert
            
            
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
    
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

    
}

