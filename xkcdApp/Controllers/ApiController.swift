//
//  ApiController.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

import Foundation
import RxSwift
import RxAlamofire

class ApiController {
    
    var transcriptConverter = TranscriptMessageDetailsConverter()
    var disposable : Disposable?
    
    static let sharedInstance: ApiController = {
        let instance = ApiController()
        return instance
    }()
    
    func downloadAndSetItems(pageNumber: Int, viewController: ViewController) {
        let sourceStringURL = ApiConfig.URLString("/\(pageNumber)/info.0.json")
        disposable = RxAlamofire.requestJSON(.get, sourceStringURL)
            .subscribe(
                onNext: { [weak self] (r, json) in
                    if 200 ..< 300 ~= r.statusCode
                    {
                        if let dictionary = json as? [String: AnyObject]
                        {
                            let transcript = dictionary["transcript"] as? String
                            MessageStore.sharedInstance.messages  = (self?.transcriptConverter.convert(transcript: transcript!))!
                            viewController.panelUrl = dictionary["img"] as? String
                            viewController.tableView.reloadData()
                        }
                    }
                }, onError:
                {
                    (error) in
                    //TODO: error pop up
                    print("error occured!")
            }, onCompleted: nil, onDisposed: nil)
    }
}
