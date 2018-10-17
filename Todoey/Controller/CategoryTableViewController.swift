//
//  CategoryTableViewController.swift
//  Todoey
//
//  Created by Ernesto-iMac-27 on 17.10.18.
//  Copyright © 2018 EH iMac 27. All rights reserved.
//

import UIKit
import CoreData


class CategoryTableViewController: UITableViewController {
    
    var itemArray = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: - TableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("cellForRowsAtIndexPath Called!")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let  item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        
        //Ternary operator ==>
        // value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
    
        
        return cell
    }
   
    

    
    override func numberOfSections(in tableView: UITableView) -> Int {
        <#code#>
    }
    
 
    
    //MARK: - Data Manipulation Methods
    
    func saveItems() {
        
        
        
        do {
          
            try context.save()
            
        } catch {
            print("Error saving context, \(error)")
        }
            self.tableView.reloadData()
        }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        // let request : NSFetchRequest<Item> = Item.fetchRequest()
        do {
            itemArray = try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
    }
    
    
    
    //MARK: - Add New Categories

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //what will happen once the user clicks the Add Item button on our UIAlert
            // print(textField.text)
            
            
            
            let newItem = Item(context: self.context)
            
            newItem.title = textField.text!
            newItem.done = false
            
            self.itemArray.append(newItem)
            
            self.saveItems()
            
            //self.defaults.set(self.itemArray, forKey: "TodoListArray")
            
            
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
            
            // print(alertTextField.text)
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
       
        
    }
    
    
    //MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
       
        
        saveItems()
        
       
        
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
