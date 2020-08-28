//
//  AlbumList.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

struct AlbumList: View {
    
    var body: some View {
        NavigationView {
            List() {
                AlbumListRow()
            }.navigationBarTitle("Now Playing")
        }
    }
}

struct AlbumList_Previews: PreviewProvider {
    static var previews: some View {
        AlbumList()
    }
}
