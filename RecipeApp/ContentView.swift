import SwiftUI

struct ContentView: View {
    var body: some View {
        MainPage()
        
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark) // Optional: Set dark mode preview if needed
    }
}
