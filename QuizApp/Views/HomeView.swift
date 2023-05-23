import SwiftUI

struct HomeView: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var categories: [TriviaCategory] = []
    @State private var selectedCategoryId: Int? = nil
    @State private var isActive = false
    @State private var isActiveRandom = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Text("Selecciona una categoría:")
                    .font(.title)
                    .foregroundColor(Color("WhiteBackground"))
                
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHGrid(rows: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]) {
                        ForEach(categories, id: \.id) { category in
                            Button(action: {
                                selectedCategoryId = category.id
                                isActiveRandom = false
                                isActive = true
                            }) {
                                CardComponent(category: category.name)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .padding(.horizontal, 5)
                            }
                        }
                    }
                }
                .frame(height: 200)
                Button(action: {
                    isActiveRandom = true
                    isActive = true
                }) {
                    CardComponent(category: "Aleatorio")
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.vertical, 40)
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            .background(Color("BlackRed"))
            .onAppear {
                Task.init {
                    categories = await triviaManager.fetchTriviaCategories()
                }
            }
            NavigationLink(
                destination: !isActiveRandom ? TriviaView()
                    .environmentObject(TriviaManager(idCategory: selectedCategoryId)) : TriviaView()
                    .environmentObject(TriviaManager()),
                isActive: $isActive,
                label: { EmptyView() }
            )
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
