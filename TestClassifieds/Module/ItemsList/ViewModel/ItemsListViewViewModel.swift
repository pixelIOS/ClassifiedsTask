//
//  ItemsListViewViewModel.swift
//  TestClassifieds
//
//  Created by Ahmad Mustafa on 27/05/2022.
//

import Foundation

extension ItemsListView{
    @MainActor class ViewModel: ObservableObject{
        enum DownloadState{
            case notLoadedYet
            case loading
            case faliedToLoad
            case result([Result])
        }
        
        @Published var downloadState: DownloadState = .notLoadedYet
        
        let urlString = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
        
        func loadData() async{
            downloadState = .loading
            guard let url = URL(string: urlString) else{
                print("Error load Data")
                downloadState = .faliedToLoad
                return
            }
            
            do {
                let (data, repsonse) = try await URLSession.shared.data(from: url)
                guard (repsonse as? HTTPURLResponse)?.statusCode == 200 else{
                    print("Error server response")
                    downloadState = .faliedToLoad
                    return
                }
                
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                    downloadState = .result(decodedResponse.results)
                }
                
            }catch{
                print("Invalid Data")
                downloadState = .faliedToLoad
            }
        }
    }
}
