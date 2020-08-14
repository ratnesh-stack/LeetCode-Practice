import UIKit

func makeGood(_ s: String) -> String {
    
    var goodString = s
    
    for index in goodString.indices {
        let current = goodString[index]
        
        let nextIndex = goodString.index(goodString.startIndex, offsetBy: 1)
        
        let next = goodString[nextIndex]
        
        if (current == next) {
            let range = goodString.index(goodString.startIndex, offsetBy: 2)..<goodString.endIndex
            print(range)
            goodString.removeSubrange(range)
        }
    }
    return goodString
}

makeGood("leEeetcode")
