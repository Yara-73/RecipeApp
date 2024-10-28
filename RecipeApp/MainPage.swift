import SwiftUI

struct MainPage: View {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.systemBackground
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) { // here the spacing between the image and the text
                Spacer()
                
                // Image Icon
                Image(systemName: "fork.knife.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 274, height: 274)
                    .foregroundColor(.orange)
                    .padding()
                // "No Recipe" Text
                Text("There’s no recipe yet")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.primary) // Adjusts automatically for light/dark mode
                
                // "Please add your recipes" Text
                Text("Please add your recipes")
                    .foregroundColor(.secondary) // Adjusts automatically for light/dark mode
                
                Spacer()
            }
            .background(Color(.systemBackground).ignoresSafeArea()) // Background adjusts based on system theme
            .navigationTitle("Food Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        print("Add Recipe tapped")
                    }) {
                        Image(systemName: "plus")
                    }
                    .foregroundColor(.orange)
                }
            }
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
            .preferredColorScheme(.dark) // Preview in dark mode
        MainPage()
            .preferredColorScheme(.light) // Preview in light mode
    }
}
