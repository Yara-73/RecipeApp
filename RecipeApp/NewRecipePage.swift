import SwiftUI
import PhotosUI

struct NewRecipePage: View {
    @StateObject private var viewModel = NewRecipeViewModel()
    @State private var ingredientName: String = "" // State to capture ingredient name input

    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView { // Add ScrollView to make content scrollable
                    VStack(spacing: 20) {
                        
                        Spacer()

                        // Upload Photo Section
                        VStack {
                            Image(systemName: "photo.on.rectangle.angled")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .foregroundColor(Color.orange)
                            
                            Text("Upload Photo")
                                .foregroundColor(.white)
                                .font(.headline)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, minHeight: 200)
                        .background(Color.black.opacity(0.8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(style: StrokeStyle(lineWidth: 2, dash: [10]))
                                .foregroundColor(Color.orange)
                        )
                        .cornerRadius(10)

                        // Title TextField
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Title")
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            TextField("Title", text: $viewModel.title)
                                .padding()
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)

                        // Description TextField
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Description")
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            TextField("Description", text: $viewModel.description)
                                .padding()
                                .frame(height: 100)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal)

                        // Add Ingredient Section
                        HStack {
                            Text("Add Ingredient")
                                .foregroundColor(.white)
                                .font(.headline)
                            
                            Spacer()
                            
                            Button(action: {
                                viewModel.toggleIngredientPopup()
                            }) {
                                Image(systemName: "plus.circle.fill")
                                    .foregroundColor(.orange)
                                    .font(.title2)
                            }
                        }
                        .padding(.horizontal)

                        // Display list of ingredients
                        ForEach(viewModel.ingredients) { ingredient in
                            HStack {
                                Text("\(ingredient.quantity)")
                                    .font(.headline)
                                    .foregroundColor(.orange)
                                    .padding(.horizontal)
                                
                                Text(ingredient.name)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                                
                                Text(ingredient.measurement)
                                    .padding(.horizontal)
                                    .background(Color.orange)
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }
                            .padding()
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(10)
                            .padding(.horizontal)
                        }

                        Spacer()
                    }
                }
                .background(Color.black.ignoresSafeArea())
                .navigationTitle("New Recipe")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            print("Back button tapped")
                        }) {
                            Image(systemName: "chevron.left")
                                .foregroundColor(.orange)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            print("Save button tapped")
                        }) {
                            Text("Save")
                                .foregroundColor(.orange)
                        }
                    }
                }

                // Popup overlay
                if viewModel.showIngredientPopup {
                    Color.black.opacity(0.4)
                        .ignoresSafeArea()
                        .onTapGesture {
                            viewModel.toggleIngredientPopup()
                        }

                    VStack(spacing: 20) {
                        Text("Ingredient Name")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        TextField("Ingredient Name", text: $ingredientName)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        
                        Text("Measurement")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack {
                            Button(action: {
                                viewModel.setMeasurement(to: "Spoon")
                            }) {
                                Text("Spoon")
                                    .padding()
                                    .frame(width: 100, height: 40)
                                    .background(viewModel.measurement == "Spoon" ? Color.orange : Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }
                            
                            Button(action: {
                                viewModel.setMeasurement(to: "Cup")
                            }) {
                                Text("Cup")
                                    .padding()
                                    .frame(width: 100, height: 40)
                                    .background(viewModel.measurement == "Cup" ? Color.orange : Color.gray.opacity(0.2))
                                    .cornerRadius(8)
                                    .foregroundColor(.white)
                            }
                        }
                        
                        Text("Serving")
                            .font(.headline)
                            .foregroundColor(.white)
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                if viewModel.quantity > 1 { viewModel.quantity -= 1 }
                            }) {
                                Image(systemName: "minus")
                                    .font(.title2)
                                    .padding()
                                    .background(Color.black.opacity(0.6))
                                    .foregroundColor(.orange)
                                    .cornerRadius(8)
                            }

                            Text("\(viewModel.quantity)")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(minWidth: 40)
                            
                            Button(action: {
                                viewModel.quantity += 1
                            }) {
                                Image(systemName: "plus")
                                    .font(.title2)
                                    .padding()
                                    .background(Color.black.opacity(0.6))
                                    .foregroundColor(.orange)
                                    .cornerRadius(8)
                            }
                            
                            // Fixed-size label for measurement type next to the stepper
                            Text(viewModel.measurement)
                                .frame(width: 100, height: 40) // Set fixed size for consistency
                                .background(Color.orange)
                                .cornerRadius(8)
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                        }
                        
                        HStack {
                            Button("Cancel") {
                                viewModel.toggleIngredientPopup()
                            }
                            .padding()
                            .background(Color.red)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                            
                            Button("Add") {
                                viewModel.addIngredient(name: ingredientName)
                                ingredientName = "" // Reset ingredient name input
                            }
                            .padding()
                            .background(Color.orange)
                            .cornerRadius(8)
                            .foregroundColor(.white)
                        }
                    }
                    .padding()
                    .background(Color.black)
                    .cornerRadius(15)
                    .shadow(radius: 10)
                    .frame(width: 300, height: 400)
                    .transition(.scale)
                }
            }
        }
    }
}

struct NewRecipePage_Previews: PreviewProvider {
    static var previews: some View {
        NewRecipePage()
            .preferredColorScheme(.dark)
    }
}
