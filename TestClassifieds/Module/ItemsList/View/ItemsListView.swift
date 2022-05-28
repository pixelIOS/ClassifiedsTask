//
//  ItemsListView.swift
//  TestClassifieds
//
//  Created by Ahmad Mustafa on 27/05/2022.
//

import SwiftUI

struct ItemsListView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationView{
            Group{
                switch viewModel.downloadState{
                case .notLoadedYet, .loading: List { ProgressView() }.task { await viewModel.loadData() }
                case .result(let results): makeListView(withL: results)
                case .faliedToLoad: reloadButton
                }
            }
            .navigationTitle("Items list")
        }
        .ignoresSafeArea()
    }
}

struct ItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemsListView()
    }
}

extension ItemsListView{
    var reloadButton: some View{
        Button{
            viewModel.downloadState = .notLoadedYet
        } label: {
            Text("Failed to load data, push to reload")
                .font(.largeTitle)
        }
    }
    
    func makeListView(withL results: [Result]) -> some View{
        List(results, id: \.uid){ item in
            VStack(alignment: .leading){
                NavigationLink(item.name.capitalizingFirstLetter(), destination: ItemDetailView(result: item))
            }
            
        }
    }
}
