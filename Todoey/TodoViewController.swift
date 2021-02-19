//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class TodoViewController: UITableViewController {

    var toDoItem: [String] = [
        "Big Data Quiz",
        "More swift"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoItemCell")!
        let text = toDoItem[indexPath.row]
        
        cell.textLabel?.text = text
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItem.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let text = toDoItem[indexPath.row]
        let cell = tableView.cellForRow(at: indexPath)
        let attributes: [NSAttributedString.Key: Any] = [ .strikethroughStyle: NSUnderlineStyle.single.rawValue ]
        
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
            cell?.textLabel?.attributedText = NSAttributedString(string: text)
        } else {
            cell?.accessoryType = .checkmark
            cell?.textLabel?.attributedText = NSAttributedString(string: text, attributes: attributes )
        }
        
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    @IBAction func addItem(_ sender: UIBarButtonItem) {
        var textfield = UITextField()
        
        let alert = UIAlertController(title: "New Todo", message: "", preferredStyle: .actionSheet)
        
        let action = UIAlertAction(title: "New Todo", style: .default) { (action) in
            self.toDoItem.append(textfield.text!)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "New Todo"
            textfield = alertTextField
        }
        
    }
    


}

