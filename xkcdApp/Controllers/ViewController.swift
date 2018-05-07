//
//  ViewController.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 06.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var addButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    var store = MessageStore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            store.remove(message: store.messages[indexPath.row])
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MessageTableViewCell.self)) as? MessageTableViewCell else {
            fatalError()
        }
        let item = store.messages[indexPath.row]
        cell.messageText.text = item.text
        //cell.messageText.textColor = item.isDone ? .darkGray : .lightGray
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.messages.count
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
       // if let taskViewController = segue.destination as? ViewController {
       //     ViewController.store = store
       // }
       // if let detailsViewController = segue.destination as? TaskDetailsViewController {
       //     guard let indexPath = tableView.indexPath(for: sender as! TaskTableViewCell) else {
       //         fatalError()
       //     }
       //     detailsViewController.store = store
       //     detailsViewController.task = store.tasks[indexPath.row]
       // }
        
    }
}
