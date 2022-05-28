//
//  Extenstions.swift
//  TestClassifieds
//
//  Created by Ahmad Mustafa on 28/05/2022.
//

import SwiftUI

//MARK: - String
extension String{
    func capitalizingFirstLetter() -> String{
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter(){
        self = self.capitalizingFirstLetter()
    }
}

//MARK: - UIScreen
extension UIScreen{
    static let width = UIScreen.main.bounds.width
    static let height = UIScreen.main.bounds.height
    static let size = UIScreen.main.bounds.size
}
