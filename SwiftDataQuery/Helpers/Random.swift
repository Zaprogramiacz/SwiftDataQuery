//
//  Created by Maciej Gomółka on 17.06.23.
//

enum Random {
  
  static func flashcardsSet() -> FlashcardsSet {
    let numberOfFlashcards = (0...50).randomElement()!
    return .init(name: word(), flashcards: flashcards(numberOfFlashcards))
  }
  
  static func flashcards(_ number: Int) -> [Flashcard] {
    (0..<number).map { _ in .init(front: word(), back: word()) }
  }
  
  static func word() -> String {
    [
      "Vocabulary",
      "Math Formulas",
      "Historical Events",
      "Scientific Elements",
      "Countries and Capitals",
      "Famous Quotes",
      "Art Movements",
      "Grammar Rules",
      "Anatomy and Physiology",
      "Literary Terms",
      "World Landmarks",
      "Physics Laws",
      "Musical Instruments",
      "World Religions",
      "Famous Paintings",
      "Astronomy Facts",
      "Human Body Systems",
      "Chemical Reactions",
      "Foreign Language Phrases",
      "Geography Trivia",
      "Historical Figures",
      "Environmental Terms",
      "Economics Concepts",
      "Psychological Disorders",
      "Political Systems",
      "Famous Authors and Books",
      "Film Directors and Movies",
      "Plant Identification",
      "Mythological Characters",
      "Computer Programming Concepts",
      "Logic Puzzles",
      "Time Zones",
      "Animal Species",
      "Nutrition Facts",
      "Architectural Styles",
      "Medical Abbreviations",
      "Business Terminology",
      "Sports Rules and Regulations",
      "Famous Inventors",
      "Famous Composers",
      "Culinary Techniques",
      "Supreme Court Cases",
      "Historical Documents",
      "National Flags",
      "Famous Battles",
      "Types of Rocks and Minerals",
      "Music Theory",
      "Famous Scientists",
      "Environmental Issues",
      "Famous Landmark Architecture"
    ].randomElement()!
  }
  
}
