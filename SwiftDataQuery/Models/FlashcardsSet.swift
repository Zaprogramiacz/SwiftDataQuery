//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftData

@Model
class FlashcardsSet {
    @Attribute(.unique) let name: String
    let flashcards: [Flashcard] = []

    init(name: String, flashcards: [Flashcard]) {
        self.name = name
        self.flashcards = flashcards
    }
}
