//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftData

@Model
class FlashcardsSet {
  let name: String
  var flashcards: [Flashcard] = []

  init(name: String, flashcards: [Flashcard]) {
    self.name = name
    self.flashcards = flashcards
  }
}
