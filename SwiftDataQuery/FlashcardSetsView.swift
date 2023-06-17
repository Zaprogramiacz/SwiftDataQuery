//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftUI
import SwiftData

struct FlashcardSetsView: View {
    @Query var flashcardSets: [FlashcardsSet]

    var body: some View {
        List(flashcardSets) { flashcardsSet in
            HStack {
                Text(flashcardsSet.name)
                Spacer()
                Text("Cards: \(flashcardsSet.flashcards.count)")
            }
        }.navigationTitle("Flashcard Sets")
    }
}
