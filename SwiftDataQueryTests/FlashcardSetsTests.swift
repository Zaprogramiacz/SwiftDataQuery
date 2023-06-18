//
//  Created by Maciej Gomółka on 17.06.23.
//

@testable import SwiftDataQuery
import SnapshotTesting
import XCTest
import SwiftData
import SwiftUI

class FlashcardSetsTests: XCTestCase {

  @MainActor func testDisplayingFourInsertedSetsAndRemovingOne() {
    let configuration = ModelConfiguration(inMemory: true)
    let inMemoryContainer = try! ModelContainer(for: [Flashcard.self, FlashcardsSet.self], configuration)
    let context = inMemoryContainer.mainContext

    let sut = NavigationStack {
      FlashcardSetsView()
        .modelContainer(inMemoryContainer)
    }

    let quantumMechanic100 = FlashcardsSet(name: "Quantum Mechanic", numberOfFlashcards: 100)
    let nanoscience30 = FlashcardsSet(name: "Nanoscience", numberOfFlashcards: 30)
    let nuclearPhysics70 = FlashcardsSet(name: "Nuclear Physics", numberOfFlashcards: 70)
    let nanotechnology5 = FlashcardsSet(name: "Nanotechnology", numberOfFlashcards: 5)

    [quantumMechanic100, nanoscience30, nuclearPhysics70, nanotechnology5].forEach { flashcardsSet in
      context.insert(flashcardsSet)
    }

    let viewController = UIHostingController(rootView: sut)
    assertSnapshot(
      matching: viewController,
      as: .image(on: .iPhone13Pro),
      named: "four_flashcard_sets_inserted"
    )

    context.delete(nuclearPhysics70)
    try! context.save()

    assertSnapshot(
      matching: viewController,
      as: .image(on: .iPhone13Pro),
      named: "four_flashcard_sets_inserted_one_removed"
    )
  }

  @MainActor func testDisplayingSetsWithOver50Flaschards() {
    let configuration = ModelConfiguration(inMemory: true)
    let inMemoryContainer = try! ModelContainer(for: [Flashcard.self, FlashcardsSet.self], configuration)
    let context = inMemoryContainer.mainContext

    let sut = NavigationStack {
      FlashcardSetsOver50CardsView()
        .modelContainer(inMemoryContainer)
    }

    let quantumMechanic100 = FlashcardsSet(name: "Quantum Mechanic", numberOfFlashcards: 100)
    let nanoscience30 = FlashcardsSet(name: "Nanoscience", numberOfFlashcards: 30)
    let nuclearPhysics70 = FlashcardsSet(name: "Nuclear Physics", numberOfFlashcards: 70)
    let nanotechnology5 = FlashcardsSet(name: "Nanotechnology", numberOfFlashcards: 5)

    [quantumMechanic100, nanoscience30, nuclearPhysics70, nanotechnology5].forEach { flashcardsSet in
      context.insert(flashcardsSet)
    }

    let viewController = UIHostingController(rootView: sut)
    assertSnapshot(
      matching: viewController,
      as: .image(on: .iPhone13Pro),
      named: "two_sects_with_over_50_flashcards_inserted"
    )
  }

}

private extension FlashcardsSet {

  convenience init(name: String, numberOfFlashcards: Int) {
    self.init(name: name, flashcards: Random.flashcards(numberOfFlashcards))
  }

}
