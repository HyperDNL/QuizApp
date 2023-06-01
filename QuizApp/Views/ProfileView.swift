import SwiftUI

struct ProfileView: View {
    @State private var isEditing: Bool = false
    @State private var name: String = "Test User"
    @State private var email: String = "test@test.com"
    @State private var age: String = "22 years old"
    @State private var auxName: String = ""
    @State private var auxEmail: String = ""
    @State private var auxiAge: String = ""
    @State private var rank: String = "Beginner"
    @State private var categoryFav: String = "Entertainment: Video Games"
    @State private var profileImage: Image = Image(systemName: "person.fill")
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    @State private var selectedImageTemp: UIImage?
    
    var body: some View {
        VStack {
            Text("Profile")
                .font(.largeTitle)
                .bold()
                .padding(.vertical, 5)
            
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
                Button(action: {
                    showImagePicker = true
                }) {
                    Text("Change Profile Picture")
                            .padding()
                            .background(Color("Beige"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                }
                .sheet(isPresented: $showImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $selectedImage)
                }
                VStack(alignment: .leading){
                    Text("Name")
                        .font(.headline)
                    TextField("", text: $auxName)
                        .font(.subheadline)
                        .padding()
                        .background(Color("WhiteBackground").opacity(0.1))
                        .foregroundColor(Color("WhiteBackground"))
                        .cornerRadius(10)
                }.padding(.vertical, 5)
                
                VStack(alignment: .leading){
                    Text("Email")
                        .font(.headline)
                    TextField("", text: $auxEmail)
                        .autocapitalization(.none)
                        .font(.subheadline)
                        .padding()
                        .background(Color("WhiteBackground").opacity(0.1))
                        .foregroundColor(Color("WhiteBackground"))
                        .cornerRadius(10)
                }.padding(.vertical, 5)
                
                VStack(alignment:.leading){
                    Text("Age")
                        .font(.headline)
                    TextField("", text: $auxiAge)
                        .padding()
                        .background(Color("WhiteBackground").opacity(0.1))
                        .foregroundColor(Color("WhiteBackground"))
                        .cornerRadius(10)
                }.padding(.vertical, 5)
            }.padding()
            
            HStack {
                Spacer()
                Button(action: {
                    isEditing = false
                    selectedImage = nil
                }) {
                    Text("Cancel")
                        .padding()
                        .background(Color("Beige").opacity(0.4))
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
                    if let selectedImage = selectedImageTemp {
                            profileImage = Image(uiImage: selectedImage)
                        }
                }) {
                    Text("Save")
                        .padding()
                        .background(Color("Beige"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
    
    func loadImage() {
        guard let selectedImage = selectedImage else { return }
            selectedImageTemp = selectedImage
    }
    
    private func displayModeView() -> some View {
        VStack(alignment: .center) {
            profileImage
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .padding(.vertical, 5)
                .clipShape(Circle())
            Text(name)
                .font(.title)
            
            Text(email)
                .font(.title3)
                .foregroundColor(Color("Beige"))
            Divider()
            VStack{
                InfoRowView(title: "Age", value: age)
                InfoRowView(title: "Range", value: rank)
                InfoRowView(title: "Favorite Category", value: categoryFav)
            }.padding()
            Button(action: {
                isEditing = true
            }) {
                Text("Edit")
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
                    .foregroundColor(Color("Beige"))
            } else {
                Text("")
                    .font(.subheadline)
                    .foregroundColor(Color("Beige"))
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

