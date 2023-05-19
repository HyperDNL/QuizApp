import SwiftUI

struct CardComponent: View {
    let category: String
    
    var body: some View {
        Text(category)
            .font(.headline)
            .padding()
            .background(Color("YellowGod"))
            .foregroundColor(Color("BlackText"))
            .cornerRadius(10)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent(category: "Videogames")
    }
}
