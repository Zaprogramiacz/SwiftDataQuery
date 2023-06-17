//
//  Created by Maciej Gomółka on 17.06.23.
//

@testable import SwiftDataQuery
import SnapshotTesting
import XCTest
import SwiftData
import SwiftUI

class FlashcardSetsTests: XCTestCase {

    @MainActor func testDisplayingAllSets() {
        let configuration = ModelConfiguration(inMemory: true)
        let inMemoryContainer = try! ModelContainer(for: [Flashcard.self, FlashcardsSet.self], configuration)

        let sut = NavigationStack {
            FlashcardSetsView()
                .modelContainer(inMemoryContainer)
        }

        DatabaseSeeder.seed([
            .quantumMechanic100,
            .mechanics0,
            .nanoscience30,
            .biophysics10,
            .nanotechnology5,
            .nuclearPhysics70,
            .astrophysics20
        ], context: inMemoryContainer.mainContext)

        let viewController = UIHostingController(rootView: sut)
        assertSnapshot(matching: viewController, as: .image(on: .iPhone13Pro), record: true)
    }

    // MARK: - Private

}

enum DatabaseSeeder {
    static func seed(_ flashcardSets: [FlashcardsSet], context: ModelContext) {
        flashcardSets.forEach { flashcardsSet in
            context.insert(flashcardsSet)
        }
    }
}

private extension FlashcardsSet {

    convenience init(name: String, numberOfFlashcards: Int) {
        self.init(name: name, flashcards: Random.flashcards(numberOfFlashcards))
    }

    static let mechanics0 = FlashcardsSet(name: "Mechanics", numberOfFlashcards: 0)
    static let thermodynamics3 = FlashcardsSet(name: "Thermodynamics", numberOfFlashcards: 3)
    static let nanotechnology5 = FlashcardsSet(name: "Nanotechnology", numberOfFlashcards: 5)
    static let biophysics10 = FlashcardsSet(name: "Biophysics", numberOfFlashcards: 10)
    static let astrophysics20 = FlashcardsSet(name: "Astrophysics", numberOfFlashcards: 20)
    static let nanoscience30 = FlashcardsSet(name: "Nanoscience", numberOfFlashcards: 30)
    static let nuclearPhysics70 = FlashcardsSet(name: "Nuclear Physics", numberOfFlashcards: 70)
    static let quantumMechanic100 = FlashcardsSet(name: "Quantum Mechanic", numberOfFlashcards: 100)

}
