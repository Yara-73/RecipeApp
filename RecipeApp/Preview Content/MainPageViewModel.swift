//
//  MainPageViewModel.swift
//  RecipeApp
//
//  Created by Yara Alshammari on 25/04/1446 AH.
//

// MainPageViewModel.swift
import Foundation

class MainPageViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    func addRecipe() {
        print("Add Recipe tapped")
        // Logic to add a recipe goes here
    }
}
