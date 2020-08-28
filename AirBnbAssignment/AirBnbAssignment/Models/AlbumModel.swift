//
//  AlbumModel.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation

struct Album : Codable {
    let artistName : String?
    let trackName : String?
    let collectionName : String?
    let collectionPrice : Double?
    let releaseDate : String?
    let artworkUrl100 : String?
}

struct Response : Codable {
    
    var results : [Album]
    
}
