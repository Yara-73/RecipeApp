import SwiftUI

class NewRecipeViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var showIngredientPopup: Bool = false
    @Published var quantity: Int = 1
    @Published var measurement: String = "Spoon"
    
    // Array to store the added ingredients
    @Published var ingredients: [RecipeIngredient] = []
    
    func toggleIngredientPopup() {
        withAnimation {
            showIngredientPopup.toggle()
        }
    }
    
    func setMeasurement(to newMeasurement: String) {
        measurement = newMeasurement
        quantity = 1 // Reset quantity when changing measurement
    }
    
    // Add ingredient to the list
    func addIngredient(name: String) {
        guard !name.isEmpty else { return }
        let newIngredient = RecipeIngredient(name: name, quantity: quantity, measurement: measurement)
        ingredients.append(newIngredient)
        toggleIngredientPopup() // Close the popup after adding
    }
}
