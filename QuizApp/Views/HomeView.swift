import SwiftUI

struct HomeView: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var categories: [TriviaCategory] = []
    @State private var selectedCategoryId: Int? = nil
    @State private var isActive = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                Text("Selecciona la categoría:")
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
                                isActive = true
                            }) {
                                CardComponent(category: category.name)
                                    .padding(.horizontal, 5)
                            }
                        }
                    }
                }
                .frame(height: 160)
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
                destination: TriviaView()
                    .environmentObject(TriviaManager(idCategory: selectedCategoryId)),
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
