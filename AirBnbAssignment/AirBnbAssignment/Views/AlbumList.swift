//
//  AlbumList.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

enum AlbumFilter {
    case none
    case trackName
    case artistName
    case collectionName
    case collectionPriceDescending
    
    var title : String {
        switch self {
        case .none:
            return "iTunes Albums"
        case .trackName:
            return "Albums - Tracks"
        case .artistName:
            return "Albums - Artists"
        case .collectionName:
            return "Albums - Collection names"
        case .collectionPriceDescending:
            return "Albums - Collection prices"
        }
    }
    
    var sortFilterTitle : String {
        switch self {
        case .none:
            return "Release date"
        case .trackName:
            return "Track name"
        case .artistName:
            return "Artist name"
        case .collectionName:
            return "Collection names"
        case .collectionPriceDescending:
            return "Collection price"
        }
    }
}

struct AlbumList: View {
    
    @EnvironmentObject var albumCart : AlbumCart
    @ObservedObject var albumListViewModel = AlbumListViewModel()
    @State private var showingFilterOptions = false
    @State private var showingCart = false
    @State private var navigationTitle = "iTunes Albums"
        
    var body: some View {
        NavigationView {
            Group {
                VStack {
                    ABNBSearchBar(text: $albumListViewModel.searchText,
                    onSearchButtonClicked: albumListViewModel.onSearchTapped)
                    List(self.albumListViewModel.albums, id: \.id) { album in
                        AlbumListRow(album: album)
                    }
                }
                }.navigationBarTitle(Text(navigationTitle))
                .navigationBarItems(leading: Button(action: {
                    self.showingFilterOptions = true
                }) {
                    Image(systemName: "line.horizontal.3.decrease.circle")
                }.disabled(albumListViewModel.albums.count == 0), trailing: Button(action: {
                    self.showingCart = true
                }) {
                    Image(systemName: "cart")
                }.disabled(self.albumCart.cartItems.count == 0)
                .sheet(isPresented: $showingCart) {
                    AlbumCartView().environmentObject(self.albumCart)
                })
                .actionSheet(isPresented: $showingFilterOptions) { () -> ActionSheet in
                    ActionSheet(title: Text("Choose a sort option").font(.headline), message: nil, buttons: [
                        .default(Text(AlbumFilter.none.sortFilterTitle), action: {
                            self.albumListViewModel.filterOn(.none)
                            self.navigationTitle = AlbumFilter.none.title
                        }),
                        .default(Text(AlbumFilter.trackName.sortFilterTitle), action: {
                            self.albumListViewModel.filterOn(.trackName)
                            self.navigationTitle = AlbumFilter.trackName.title
                        }),
                        .default(Text(AlbumFilter.artistName.sortFilterTitle), action: {
                            self.albumListViewModel.filterOn(.artistName)
                            self.navigationTitle = AlbumFilter.artistName.title
                        }),
                        .default(Text(AlbumFilter.collectionName.sortFilterTitle), action: {
                            self.albumListViewModel.filterOn(.collectionName)
                            self.navigationTitle = AlbumFilter.collectionName.title
                        }),
                        .default(Text(AlbumFilter.collectionPriceDescending.sortFilterTitle), action: {
                            self.albumListViewModel.filterOn(.collectionPriceDescending)
                            self.navigationTitle = AlbumFilter.collectionPriceDescending.title
                        })
                    ])
            }
        }
    }
}

struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList()
    }
}
