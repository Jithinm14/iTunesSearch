//
//  ABNBImageView.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

/* ABNBImageView shows an activity indicator while the image url inside the view model
 object is getting downloaded */

struct ABNBImageView: View {
    
    @ObservedObject var albumArt : AlbumArtWorkViewModel
    
    init(imageResource: AlbumArtWorkModel) {
        self.albumArt = AlbumArtWorkViewModel(albumArt: imageResource)
    }
    
    var body: some View {
        Group {
            if albumArt.image != nil {
                Image(uiImage: albumArt.image!)
            } else {
                ABNBActivityIndicator(animate: Binding<Bool>.constant(true)).padding(40)
            }
        }
    }
}

struct ABNBImageView_Previews: PreviewProvider {
    static var previews: some View {
        ABNBImageView(imageResource: AlbumArtWorkModel(posterUrl: URL(string: "https://picsum.photos/200/300")))
    }
}
