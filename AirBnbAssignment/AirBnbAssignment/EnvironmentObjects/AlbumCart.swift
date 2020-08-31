//
//  AlbumCart.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 31/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import Foundation
import Combine

class AlbumCart: ObservableObject {
    @Published var cartItems = [AlbumViewModel]()
    
    func addCartItem(item: AlbumViewModel) {
        item.addedToCart = true
        self.cartItems.append(item)
    }
    
    func removeItem(item: AlbumViewModel) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            self.cartItems.remove(at: index)
        }
    }
    
}

