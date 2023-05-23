import SwiftUI

struct CardComponent: View {
    let category: String
    
    var body: some View {
        Text(category)
            .font(.headline)
            .padding(24)
            .background(Color("YellowGod"))
            .foregroundColor(Color("BlackText"))
            .cornerRadius(10)
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent(category: "Videogames")
    }
}
