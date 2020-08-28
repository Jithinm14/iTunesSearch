//
//  UrlUtility.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation

final class ABNBUrlUtility {
    
    static private let baseUrl : String = "https://itunes.apple.com/search?term="
    
    static func searchUrlForResource(searchString: String) -> URL {
        guard let posterUrl = URL(string: (baseUrl + searchString)) else {
            //TODO: Handle later.
            return URL(string: "")!
        }
        return posterUrl
    }
    
}
