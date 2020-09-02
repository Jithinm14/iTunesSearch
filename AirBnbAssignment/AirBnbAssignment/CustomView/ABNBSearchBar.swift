//
//  ABNBSearchBar.swift
//  AirBnbAssignment
//
//  Created by Jithin M on 29/08/20.
//  Copyright © 2020 Jithin M. All rights reserved.
//

import SwiftUI

/* A SwiftUI wrapper for 'UISearchBar' */
 
struct ABNBSearchBar: UIViewRepresentable {

    @Binding var text: String
    var onSearchButtonClicked: (() -> Void)? = nil

    class Coordinator: NSObject, UISearchBarDelegate {

        let control: ABNBSearchBar

        init(_ control: ABNBSearchBar) {
            self.control = control
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            control.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            control.onSearchButtonClicked?()
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    func makeUIView(context: UIViewRepresentableContext<ABNBSearchBar>) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        return searchBar
    }
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<ABNBSearchBar>) {
        uiView.text = text
    }

}

struct ABNBSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
