//
//  PanelViewController.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 14.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import UIKit

class PanelViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    var url: String = "www.google.com"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        image.downloadedFrom(url: URL(string: url)!, loadingIndicator: loadingIndicator)
    }
   
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension UIImageView {
    
    func downloadedFrom(url: URL, loadingIndicator: UIActivityIndicatorView?, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                self.image = image
                loadingIndicator?.stopAnimating()
            }
            }.resume()
    }
    
    func downloadedFrom(link: String, contentMode mode: UIViewContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloadedFrom(url: url, loadingIndicator: nil, contentMode: mode)
    }
}
