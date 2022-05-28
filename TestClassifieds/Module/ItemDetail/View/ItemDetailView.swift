//
//  ItemDetailView.swift
//  TestClassifieds
//
//  Created by Ahmad Mustafa on 28/05/2022.
//

import SwiftUI

struct ItemDetailView: View {
    let result: Result
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct ItemDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ItemDetailView(result: Result(creationTime: "", price: "150", name: "Item", uid: "", imageIds: [], imageUrls: [], imageUrlsThumbnails: []))
    }
}
