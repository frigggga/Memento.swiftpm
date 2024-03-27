

import Foundation

struct Dialogue {
    let character: Int
    var text: String
    
    func contains(word: String) -> Bool{
        return text.contains(word)
    }
}
