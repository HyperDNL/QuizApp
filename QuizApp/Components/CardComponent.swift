import SwiftUI

struct CardComponent: View {
    let category: String
    
    var body: some View {
        VStack {
            Text(category)
                .font(.headline)
                .foregroundColor(.white)
                .padding()
        }
        .frame(maxWidth: .infinity)
        .background(Color("YellowGod"))
        .cornerRadius(10)
    }
}

struct CardComponent_Previews: PreviewProvider {
    static var previews: some View {
        CardComponent(category: "Videogames")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}

