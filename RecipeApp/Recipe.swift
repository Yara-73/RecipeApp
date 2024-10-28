//
//  Recipe.swift
//  RecipeApp
//
//  Created by Yara Alshammari on 25/04/1446 AH.
//

// Recipe.swift
import Foundation

struct Recipe: Identifiable {
    let id: UUID
    var title: String
    var description: String
    
    // Optional additional properties
    var ingredients: [RecipeIngredient] = [] // List of ingredients (useful if you want each recipe to have ingredients)
    var cookingTime: Int? // in minutes
    var difficulty: String? // e.g., "Easy", "Medium", "Hard"
    var servings: Int? // Number of servings the recipe provides
}

// RecipeIngredient model (if you haven't already created it)
struct RecipeIngredient: Identifiable {
    let id = UUID()
    var name: String
    var quantity: Int
    var measurement: String // e.g., "Spoon", "Cup", etc.
}
