//
//  Created by Maciej Gomółka on 17.06.23.
//

import Foundation
import SwiftData

@Model
class Flashcard {
    @Attribute(.unique) let uuid: String = UUID().uuidString
}
