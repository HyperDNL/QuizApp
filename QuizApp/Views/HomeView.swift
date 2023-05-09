import SwiftUI

struct HomeView: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var selectedCategories = Set<String>()
    @State private var categories: [TriviaCategory] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Selecciona las categorías:")
                .font(.headline)
                .foregroundColor(Color("BlackText"))
            
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(categories, id: \.id) { category in
                        Button(action: {
                            if selectedCategories.contains(category.name) {
                                selectedCategories.remove(category.name)
                            } else {
                                selectedCategories.insert(category.name)
                            }
                        }) {
                            HStack {
                                Text(category.name)
                                Spacer()
                                if selectedCategories.contains(category.name) {
                                    Image(systemName: "checkmark").foregroundColor(Color("BlackText"))
                                }
                            }
                        }
                        .padding(.vertical, 5)
                    }.foregroundColor(Color("BlackText"))
                }
            }
            .frame(height: 400)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
        .background(Color("WhiteBackground"))
        .onAppear {
            Task.init {
                categories = await triviaManager.fetchTriviaCategories()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
