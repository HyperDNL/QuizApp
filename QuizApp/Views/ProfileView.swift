import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
            Text("Vista del Perfil").font(.system(size: 30, weight: .bold, design: .rounded)).foregroundColor(Color("BlackText"))
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
