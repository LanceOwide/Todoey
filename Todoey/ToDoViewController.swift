//
//  ViewController.swift
//  Todoey
//
//  Created by Lance Owide on 20/11/2018.
//  Copyright © 2018 Lance Owide. All rights reserved.
//

import UIKit

class ToDoViewController: UITableViewController {
    
    var itemArray = [Item]()

     let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        let newItem = Item()
        newItem.title = "New Item 1"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "New Item 2"
        itemArray.append(newItem2)
        
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String]{
        //            itemArray = items}
    
    }

    
//    MARK - Tableview DataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
    
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        if item.done == true {
            cell.accessoryType = .checkmark
            
        } else{
            cell.accessoryType = .none
        }
        
        
        return cell
    }

    
//    Table View Delegate Methods
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        
//        check to see if there already exist a check mark, if there is remove it, if there isnt add it
        
//        sets the done property on the item in the array to the opposite of what it is now
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
    
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
//    add new items
    
    
    @IBAction func addNewItemButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todey item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title:"Add Item", style: .default) { (UIAlertAction) in
//            what will happen once the user clicks the add itme on our UI altert
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            self.tableView.reloadData()
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
    
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
        }
        
        
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }

    
}

