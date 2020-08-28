//
//  AlbumViewModel.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

class AlbumListViewModel : ObservableObject {
    
    @Published var albums = [AlbumViewModel]()
    private var cancellable : AnyCancellable?
    
    init() {
        fetchAlbums()
    }
    
    private func fetchAlbums() {
        
        let resource = ABNBUrlUtility.searchUrlForResource(searchString: "shakira")
        
        self.cancellable = NetworkService().fetchFromNetwork(resource: resource).map { (albumArray) -> [AlbumViewModel]  in
            albumArray.map { (album) -> AlbumViewModel in
                return AlbumViewModel(album: album)
            }
        }.sink(receiveCompletion: { (completion) in
            switch completion {
            case .failure(let error):
                self.handleError(error: error as! NetworkError)
            case .finished:
                break
            }
        }) { (albumModelList) in
            self.albums = albumModelList
        }
    }
    
    //TODO:
    private func handleError(error: NetworkError) {
        
    }
}

struct AlbumViewModel : Identifiable {
    
    private var album : Album?
    private let placeHolder = "N/A"
    let id = UUID()
    
    var artistName : String {
        return album?.artistName ?? placeHolder
    }
    
    var trackName : String {
        return album?.trackName ?? placeHolder
    }
    
    var collectionName : String {
        return album?.collectionName ?? placeHolder
    }
    
    var releaseDate : String {
        let release = album?.releaseDate ?? placeHolder
        return String("Release : \(release)")
    }
    
    var collectionPrice : String {
        guard let collectionPrice = album?.collectionPrice else {
            return placeHolder
        }
        return "Collection Price : \(collectionPrice)"
    }
    
    var albumArtResource : AlbumArtWorkModel {
        
        guard let albumArtResource = album?.artworkUrl100 else {
            return AlbumArtWorkModel(posterUrl: nil)
        }
        return AlbumArtWorkModel(posterUrl: URL(string: albumArtResource))
    }
    
    init(album: Album) {
        self.album = album
    }
    
}
