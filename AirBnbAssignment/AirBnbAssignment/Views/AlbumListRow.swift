//
//  AlbumListRow.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

struct AlbumListRow: View {
    
    @EnvironmentObject var albumCart : AlbumCart
    @ObservedObject var album : AlbumViewModel
    @State private var isAddedToCart = false
    
    init(album: AlbumViewModel) {
        self.album = album
    }
    
    var body: some View {
         HStack {
            ABNBImageView(imageResource: album.albumArtResource)
                   VStack(alignment: .leading) {
                    HStack {
                        Text(album.artistName).font(.title).multilineTextAlignment(.leading)
                        Spacer(minLength: 20)
                        Button(action: {
                            if self.isAddedToCart {
                                self.albumCart.removeItem(item: self.album)
                                self.album.addedToCart = false
                                
                            } else {
                                self.albumCart.addCartItem(item: self.album)
                                self.album.addedToCart = true
                            }
                            self.isAddedToCart.toggle()
                        }) {
                            Image(systemName: (self.album.addedToCart ? "cart.fill.badge.minus" : "cart.fill.badge.plus")).foregroundColor(self.album.addedToCart ? .red : .green)
                        }
                    }
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
