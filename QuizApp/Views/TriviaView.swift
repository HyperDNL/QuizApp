import SwiftUI

struct TriviaView: View {
    @EnvironmentObject var triviaManager: TriviaManager
    
    var body: some View {
        if triviaManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Trivia Game")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game!")
                
                Text("You scored \(triviaManager.score) out of \(triviaManager.length)")
            }
            .foregroundColor(Color("WhiteBackground"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("BlackRed"))
        } else {
            QuestionView()
                .environmentObject(triviaManager)
        }
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaView()
            .environmentObject(TriviaManager())
    }
}
