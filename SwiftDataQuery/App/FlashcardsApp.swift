//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftUI
import SwiftData

@main
struct FlashcardsApp: App {
  var body: some Scene {
    WindowGroup {
      NavigationStack {
        FlashcardSetsView()
      }
    }.modelContainer(
      for: [FlashcardsSet.self, Flashcard.self]
    )
  }
}
