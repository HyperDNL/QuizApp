import Foundation

struct TriviaCategoryResponse: Codable {
    let triviaCategories: [TriviaCategory]
}

struct TriviaCategory: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
}
