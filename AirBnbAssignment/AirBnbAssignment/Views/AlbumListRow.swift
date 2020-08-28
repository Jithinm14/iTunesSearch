//
//  AlbumListRow.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

struct AlbumListRow: View {
    
    var body: some View {
         HStack {
                   Image("placeHolder")
                   VStack(alignment: .leading) {
                       Text("Artist Name").font(.title).multilineTextAlignment(.leading)
                       Spacer().frame(height: 10)
                       Text("Track Name").font(.system(size: 13)).multilineTextAlignment(.leading)
                       Spacer().frame(height: 10)
                       VStack(alignment: .leading) {
                           Text("Collection Name").font(.system(size: 13)).multilineTextAlignment(.leading)
                           Spacer().frame(height: 10)
                           Text("Collection Price").font(.system(size: 13)).multilineTextAlignment(.leading)
                           Spacer().frame(height: 10)
                           Text("ReleaseDate").font(.system(size: 11)).multilineTextAlignment(.leading)
                       }
                   }
               }.environment(\.defaultMinListRowHeight, 278)
    }
}

struct AlbumListRow_Previews: PreviewProvider {
    static var previews: some View {
        AlbumListRow()
    }
}
