//
//  AlbumArtWorkModel.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 29/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation
import SwiftUI

struct AlbumArtWorkModel {
    let posterUrl : URL?
}

extension AlbumArtWorkModel {
    var placeHolderImage : Image {
        return Image("placeholder")
    }
}
