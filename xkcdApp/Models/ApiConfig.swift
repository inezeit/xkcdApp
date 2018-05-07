//
//  ApiConfig.swift
//  xkcdApp
//
//  Created by Inez Spiralska golak on 07.05.2018.
//  Copyright © 2018 in. All rights reserved.
//

struct ApiConfig{
    static let baseURLString = "https://xkcd.com"
}

extension ApiConfig{
    static func URLString(_ endpointPath: String) -> String {
        return "\(baseURLString)\(endpointPath)"
    }
}
