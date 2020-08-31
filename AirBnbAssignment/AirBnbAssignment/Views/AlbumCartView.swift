//
//  AlbumCart.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 31/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

struct AlbumCartView: View {
    
    @EnvironmentObject var albumCart : AlbumCart
    
    var body: some View {
        NavigationView {
            List(self.albumCart.cartItems, id: \.id) { album in
                AlbumCartViewListRow(album: album)
            }.navigationBarTitle("Cart Items")
        }
    }
}

struct AlbumCartView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCartView()
    }
}
