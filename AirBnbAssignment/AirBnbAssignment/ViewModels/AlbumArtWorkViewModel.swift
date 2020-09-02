//
//  AlbumArtWorkViewModel.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 29/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class AlbumArtWorkViewModel: ObservableObject {
    
    @Published var image : UIImage?
    var cancellable : AnyCancellable?
    let albumArtWorkModel : AlbumArtWorkModel
    
    init(albumArt: AlbumArtWorkModel) {
        self.albumArtWorkModel = albumArt
        guard let posterUrl = albumArt.posterUrl else {
            self.image = UIImage(named: "placeholder")
            return
        }
        load(imageFrom: posterUrl)
    }
    
    private func load(imageFrom url: URL) {
        self.cancellable = URLSession.shared.downloadTaskPublisher(for: url).map{
            return UIImage(contentsOfFile: $0.url.path)
            }
        .replaceError(with: UIImage(named: "placeholder"))
        .receive(on: RunLoop.main)
        .assign(to: \.image, on: self)
    }
    
    func cancel() {
        self.cancellable?.cancel()
    }
    
}
