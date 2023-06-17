//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftUI
import SwiftData

struct FlashcardSetsView: View {
    @Query var flashcardSets: [FlashcardsSet]

    var body: some View {
        List(flashcardSets) { flashcardsSet in
            Text("\(flashcardsSet.name) Cards: \(flashcardsSet.flashcards.count)")
        }.navigationTitle("Flashcard Sets")
    }
}
