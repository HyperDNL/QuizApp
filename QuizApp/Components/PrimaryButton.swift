import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("YellowGod")
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.headline)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
