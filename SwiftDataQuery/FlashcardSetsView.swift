//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftUI
import SwiftData

struct FlashcardSetsView: View {
    @Query var flashcardSets: [FlashcardsSet]
    @Environment(\.modelContext) private var context

    var body: some View {
        List {
            Section {
                Button("Generate random set") {
                    context.insert(Random.flashcardsSet())
                }
            }
            Section {
                ForEach(flashcardSets) { flashcardsSet in
                    HStack {
                        Text(flashcardsSet.name)
                        Spacer()
                        Text("Cards: \(flashcardsSet.flashcards.count)")
                    }
                }
            }
        }
        .navigationTitle("Flashcard Sets")
    }
}
