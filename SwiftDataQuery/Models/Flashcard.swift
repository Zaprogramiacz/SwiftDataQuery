//
//  Created by Maciej Gomółka on 17.06.23.
//

import Foundation
import SwiftData

@Model
class Flashcard {
    @Attribute(.unique) let uuid: String
    let front: String
    let back: String

    init(front: String, back: String) {
        self.uuid = UUID().uuidString
        self.front = front
        self.back = back
    }
}
