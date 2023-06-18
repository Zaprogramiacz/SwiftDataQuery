//
//  Created by Maciej Gomółka on 18.06.23.
//

import SwiftUI
import SwiftData

struct FlashcardSetsOver50CardsView: View {
  static let over50Flashcards = #Predicate<FlashcardsSet> { $0.flashcards.count > 50 }
  @Query(filter: over50Flashcards) var flashcardSets: [FlashcardsSet]
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
