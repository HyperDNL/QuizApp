import SwiftUI

struct ProfileView: View {
    @State private var isEditing: Bool = false
    @State private var name: String = "Usuario Test"
    @State private var email: String = "test@test.com"
    @State private var age: String = "22 años"
    @State private var auxName: String = ""
    @State private var auxEmail: String = ""
    @State private var auxiAge: String = ""
    @State private var rank: String = "Principante"
    @State private var categoryFav: String = "Entertainment: Video Games"
    
    var body: some View {
        VStack {
            Text("Mi Perfil")
                .font(.largeTitle)
                .bold()
                .padding()
            
            Image(systemName: "person.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .padding()
                .padding(.bottom, 10)
            
            if isEditing {
                editModeView()
            } else {
                displayModeView()
            }
            
            Spacer()
        }
        .foregroundColor(Color("WhiteBackground"))
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BlackRed"))
    }
    
    private func editModeView() -> some View {
        VStack{
            VStack(alignment: .leading){
                VStack(alignment: .leading){
                    Text("Nombre")
                        .font(.headline)
                    TextField("Nombre", text: $auxName)
                        .font(.subheadline)
                        .foregroundColor(Color("Beige")).opacity(0.8)
                }.padding(.vertical, 10)
                
                VStack(alignment: .leading){
                    Text("Email")
                        .font(.headline)
                    TextField("Email", text: $auxEmail)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .foregroundColor(Color("Beige")).opacity(0.8)
                }.padding(.vertical, 10)
                
                VStack(alignment:.leading){
                    Text("Edad")
                        .font(.headline)
                    TextField("Edad", text: $auxiAge)
                        .font(.subheadline)
                        .foregroundColor(Color("Beige")).opacity(0.8)
                }.padding(.vertical, 10)
            }.padding()
            
            HStack {
                Spacer()
                Button(action: {
                    isEditing = false
                }) {
                    Text("Cancelar")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    isEditing = false
                    if (!auxName.isEmpty){
                        name = auxName
                    }
                    if(!auxEmail.isEmpty){
                        email = auxEmail
                    }
                    if(!auxiAge.isEmpty){
                        age = auxiAge
                    }
                }) {
                    Text("Guardar")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
    
    private func displayModeView() -> some View {
        VStack(alignment: .center) {
            Text(name)
                .font(.title)
            
            Text(email)
                .font(.title3)
                .foregroundColor(Color("Beige")).opacity(0.8)
            Divider()
            VStack{
                InfoRowView(title: "Edad", value: age)
                InfoRowView(title: "Rango", value: rank)
                InfoRowView(title: "Categoría Favorita", value: categoryFav)
            }.padding()
            Button(action: {
                isEditing = true
            }) {
                Text("Editar")
                    .padding()
                    .background(Color("Beige"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.vertical, 10)
    }
}

struct InfoRowView: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(title)
                .font(.headline)
            
            if !value.isEmpty {
                Text(value)
                    .font(.subheadline)
                    .foregroundColor(Color("Beige")).opacity(0.8)
            } else {
                Text("")
                    .font(.subheadline)
                    .foregroundColor(Color("Beige")).opacity(0.8)
            }
        }
        .padding(.vertical, 10)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

