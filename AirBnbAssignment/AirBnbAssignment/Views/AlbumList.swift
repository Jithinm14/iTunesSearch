//
//  AlbumList.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

struct AlbumList: View {
    
    @ObservedObject var albumListViewModel = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
           List(self.albumListViewModel.albums, id: \.id) { album in
                AlbumListRow(album: album)
            }.navigationBarTitle("Now Playing")
        }
    }
}

struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList()
    }
}
