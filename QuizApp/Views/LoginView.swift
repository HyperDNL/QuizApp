import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var isHomeScreenActive = false
    
    var body: some View {
        NavigationView{
            VStack {
                Image("QuizApp-Logo")
                    .resizable()
                    .frame(width: 128, height: 128)
                    .padding()
                Text("Inicio de Sesión")
                    .font(.title)
                    .bold()
                    .foregroundColor(Color("BlackText"))
                TextField("E-Mail", text: $email)
                    .padding()
                    .background(Color("Beige").opacity(0.2))
                    .foregroundColor(Color("BlackRed"))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .autocapitalization(.none)
                SecureField("Contraseña", text: $password)
                    .padding()
                    .background(Color("Beige").opacity(0.2))
                    .foregroundColor(Color("BlackText"))
                    .cornerRadius(10)
                    .padding(.horizontal).padding(.bottom)
                Button(action: {
                    if email == "test@test.com" && password == "passtest" {
                        isHomeScreenActive = true
                    } else {
                        showError = true
                        isHomeScreenActive = false
                    }
                }, label: {
                    Text("Iniciar Sesión")
                        .font(.title2).fontWeight(.semibold)
                        .foregroundColor(Color("BlackText"))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color("YellowGod"))
                        .cornerRadius(10)
                        .padding(.horizontal)
                })
                .alert(isPresented: $showError) {
                    Alert(title: Text("Error"), message: Text("Credenciales incorrectas"), dismissButton: .default(Text("OK")))
                }
                NavigationLink(destination: WelcomeView(), isActive: $isHomeScreenActive, label: {EmptyView()})
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("WhiteBackground"))
        }.navigationBarHidden(true)
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
