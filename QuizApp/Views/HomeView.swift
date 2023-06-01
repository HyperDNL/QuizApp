import SwiftUI

struct HomeView: View {
    @StateObject var triviaManager = TriviaManager()
    @State private var categories: [TriviaCategory] = []
    @State private var selectedCategoryId: Int? = nil
    @State private var isActive = false
    @State private var isActiveRandom = false
    @State var maxCircleHeight: CGFloat = 0
    
    var body: some View {
        NavigationView{
            VStack() {
                GeometryReader{proxy -> AnyView in
                    let height = proxy.frame(in: .global).height
                    DispatchQueue.main.async {
                        if maxCircleHeight == 0 {
                            maxCircleHeight = height
                        }
                    }
                    return AnyView(
                        ZStack{
                            Circle().fill(Color("BlackGod"))
                                .offset(x: getRect().width/2, y: -height/1.3)
                            Circle().fill(Color("BlackGod"))
                                .offset(x: -getRect().width/2, y: -height/1.5)
                            Circle().fill(Color("BlackText"))
                                .offset(y: -height/1.3)
                                .rotationEffect((.init(degrees: -7)))
                        }
                    )
                }.frame(maxHeight: getRect().height)
                VStack(alignment: .leading){
                    Text("Choose a Category:")
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
                                }
                            }
                        }
                    }
                    .frame(height: 180)
                    Button(action: {
                        isActiveRandom = true
                        isActive = true
                    }) {
                        CardComponent(category: "Random Categories")
                    }
                    .padding(.vertical, 20)
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.top, -maxCircleHeight/1.4)
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
            }.background(Color("BlackRed"))
        }.navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
