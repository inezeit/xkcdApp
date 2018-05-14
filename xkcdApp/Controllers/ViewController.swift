//
//  ViewController.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 06.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var store = MessageStore.sharedInstance
    var panelUrl: String?
    var pageNumber = 208
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        downloadData(pageNumber: pageNumber)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            let messageText = store.messages[indexPath.item].text
            let size = CGSize(width: 250, height: 1000)
            let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
            let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
            
            return estimatedFrame.height + 30
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
        cell.item = item
        
        let messageText = store.messages[indexPath.item].text
        let size = CGSize(width: 250, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        let estimatedFrame = NSString(string: messageText).boundingRect(with: size, options: options, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 18)], context: nil)
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        var startPosition : CGFloat = 0.0
        
        if(cell.item?.isDescription)!{
            startPosition = screenWidth/2 - estimatedFrame.width/2
        }else if(cell.item?.position == .left){
            startPosition = screenWidth - estimatedFrame.width - 20
        }
        
        cell.bubble.frame = CGRect(x: startPosition + 5, y: 0, width: estimatedFrame.width + 16, height: estimatedFrame.height + 20)
        cell.messageText.frame = CGRect(x: startPosition, y: 0, width: estimatedFrame.width + 16 + 8, height: estimatedFrame.height + 20)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.messages.count
    }
    
    @IBAction func previousPanel(_ sender: Any) {
        pageNumber -= 1
        downloadData(pageNumber: pageNumber)
    }
    
    @IBAction func nextPanel(_ sender: Any) {
        pageNumber += 1
        downloadData(pageNumber: pageNumber)
    }
    
    func downloadData(pageNumber: Int){
        ApiController.sharedInstance.downloadAndSetItems(pageNumber: pageNumber, viewController: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if let panelViewController = segue.destination as? PanelViewController, let panelUrl = panelUrl {
            panelViewController.url = panelUrl
        }
    }
}

