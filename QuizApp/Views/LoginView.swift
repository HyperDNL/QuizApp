import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showError: Bool = false
    @State private var isSecure = true
    @State private var isHomeScreenActive = false
    
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BlackText")
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(Color("BlackGod"))
                Circle()
                    .scale(1.35)
                    .foregroundColor(Color("BlackRed"))

                VStack {
                    Image("QuizApp-Logo")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .padding(.vertical, 2).shadow(color: .gray,radius: 5)
                    
                    Text("Login")
                        .font(.title)
                        .bold()
                        .foregroundColor(Color("WhiteBackground"))
                        .padding(.vertical, 2)
                    
                    ZStack(alignment: .leading){
                        if(email.isEmpty){
                            Text(verbatim: "example@example.com").font(.headline).foregroundColor(Color("WhiteBackground"))
                                .padding(.horizontal, 32)
                                .padding(.vertical)
                        }
                        TextField("", text: $email)
                            .padding()
                            .background(Color("WhiteBackground").opacity(0.1))
                            .foregroundColor(Color("WhiteBackground"))
                            .cornerRadius(10)
                            .padding(.horizontal)
                            .autocapitalization(.none)
                    }
                        
                    
                    ZStack(alignment: .leading){
                        if(password.isEmpty){
                            Text(verbatim: "Password").font(.headline).foregroundColor(Color("WhiteBackground"))
                                .padding(.horizontal, 32)
                        }
                        if isSecure{
                            SecureField("", text: $password)
                                .textContentType(.password)
                                .padding()
                                .background(Color("WhiteBackground").opacity(0.1))
                                .foregroundColor(Color("WhiteBackground"))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .overlay(
                                    Button(action: {
                                        isSecure.toggle()
                                    }, label: {
                                        Image(systemName: "eye")
                                            .foregroundColor(Color("WhiteBackground"))
                                    })
                                    .padding(.trailing, 32),
                                    alignment: .trailing
                                )
                        } else{
                            TextField("", text: $password)
                                .autocapitalization(.none)
                                .textContentType(.password)
                                .padding()
                                .background(Color("WhiteBackground").opacity(0.1))
                                .foregroundColor(Color("WhiteBackground"))
                                .cornerRadius(10)
                                .padding(.horizontal)
                                .overlay(
                                    Button(action: {
                                        isSecure.toggle()
                                    }, label: {
                                        Image(systemName: "eye.slash")
                                            .foregroundColor(Color("WhiteBackground"))
                                    })
                                    .padding(.trailing, 32),
                                    alignment: .trailing
                                    
                                )
                        }
                    }.padding(.bottom, 5)
                    
                    Button(action: {
                        if email == "test@test.com" && password == "passtest" {
                            isHomeScreenActive = true
                        } else {
                            showError = true
                            isHomeScreenActive = false
                        }
                    }, label: {
                        Text("Log In")
                            .font(.title2).fontWeight(.semibold)
                            .foregroundColor(.white)
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
            }.navigationBarHidden(true)
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
