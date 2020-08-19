import UIKit

func makeGood(_ s: String) -> String {
    
    var goodString = s
    var repeatAgain = false

    repeat {
        repeatAgain = false
        for index in goodString.indices where goodString.indices.count > 0 && (index < goodString.indices.last!) {
            let current = goodString[index]
            let nextIndex = goodString.index(index, offsetBy: 1)
            let next = goodString[nextIndex]
            
            if current != next && ((current.lowercased() == String(next)) || (String(current) == next.lowercased())) {
                goodString.remove(at: index)
                goodString.remove(at: index)
                repeatAgain = true
            }
        }
    } while repeatAgain
    return goodString
}

print(makeGood("abBAcC"))
