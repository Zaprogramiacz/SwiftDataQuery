//
//  Created by Maciej Gomółka on 17.06.23.
//

import SwiftUI

@main
struct FlashcardsApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                FlashcardSetsView()
            }
        }
    }
}
