//
//  AlbumListRow.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

struct AlbumListRow: View {
    
    var album : AlbumViewModel
    
    init(album: AlbumViewModel) {
        self.album = album
    }
    
    var body: some View {
         HStack {
            ABNBImageView(imageResource: album.albumArtResource)
                   VStack(alignment: .leading) {
                    Text(album.artistName).font(.title).multilineTextAlignment(.leading)
                       Spacer().frame(height: 10)
                    Text(album.trackName).font(.system(size: 13)).multilineTextAlignment(.leading)
                       Spacer().frame(height: 10)
                       VStack(alignment: .leading) {
                        Text(album.collectionName).font(.system(size: 13)).multilineTextAlignment(.leading)
                           Spacer().frame(height: 10)
                        Text(album.collectionPrice).font(.system(size: 13)).multilineTextAlignment(.leading)
                           Spacer().frame(height: 10)
                        Text(album.releaseDate).font(.system(size: 11)).multilineTextAlignment(.leading)
                       }
                   }
               }.environment(\.defaultMinListRowHeight, 278)
    }
}

struct AlbumListRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListRow(album: AlbumViewModel(album: Album(artistName: "Artist Name", trackName: "Track Name", collectionName: "Collection Name", collectionPrice: 12, releaseDate: "ReleaseDate", artworkUrl100: "")))
    }
}
