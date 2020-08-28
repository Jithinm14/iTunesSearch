//
//  ABNBActivityIndicatorView.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 28/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI
import UIKit

struct ABNBActivityIndicator : UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView
    @Binding var animate : Bool
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: .medium)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: Context) {
        if animate {
            uiView.startAnimating()
        } else {
            uiView.stopAnimating()
        }
    }
    
}

struct ABNBActivityIndicatorView : View {
    
    @Binding var shouldAnimate : Bool
    
    var body: some View {
        ABNBActivityIndicator(animate: $shouldAnimate)
    }
    
}
