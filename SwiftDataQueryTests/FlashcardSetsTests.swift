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

        let englishSet = FlashcardsSet(name: "English", flashcards: [Random.flashcard(), Random.flashcard(), Random.flashcard()])
        let spanishSet = FlashcardsSet(name: "Spanish", flashcards: [Random.flashcard()])

        inMemoryContainer.mainContext.insert(englishSet)
        inMemoryContainer.mainContext.insert(spanishSet)

        let viewController = UIHostingController(rootView: sut)
        assertSnapshot(matching: viewController, as: .image(on: .iPhone13Pro))
    }

}

enum Random {

    static func flashcard() -> Flashcard {
        .init(front: Self.word(), back: Self.word())
    }

    static func word() -> String {
        [
            "fireman",
            "support",
            "heal",
            "fix",
            "behavior",
            "fuzzy",
            "miss",
            "name",
            "versed",
            "spade",
            "longing",
            "elastic",
            "destruction",
            "combative",
            "hungry",
            "tramp",
            "illustrious",
            "airport",
            "cow",
            "judge",
            "cup",
            "hurt",
            "manage",
            "observe",
            "tickle",
            "cautious",
            "icky",
            "overjoyed",
            "voracious",
            "deeply",
            "prickly",
            "incompetent",
            "big",
            "volleyball",
            "fog",
            "vigorous",
            "system",
            "title",
            "friends",
            "untidy",
            "horse",
            "cat",
            "dime",
            "depressed",
            "oven",
            "embarrassed",
            "actor",
            "guttural",
            "marble",
            "disgusting",
            "account",
            "uneven",
            "hill",
            "materialistic",
            "groan",
            "fish",
            "crowded",
            "trashy",
            "reproduce",
            "sound",
            "program",
            "nostalgic",
            "magic",
            "deceive",
            "load",
            "unsightly",
            "wren",
            "loss",
            "eye",
            "pigs",
            "badge",
            "tearful",
            "curly",
            "capable",
            "crayon",
            "ultra",
            "jellyfish",
            "squash",
            "argue",
            "rotten",
            "afterthought",
            "mark",
            "want",
            "order",
            "team",
            "pear",
            "perfect",
            "skip",
            "force",
            "divergent",
            "mess up",
            "curvy",
            "interfere",
            "rainy",
            "numerous",
            "last",
            "resonant",
            "snobbish",
            "heartbreaking",
            "silent"
        ].randomElement()!
    }

}
