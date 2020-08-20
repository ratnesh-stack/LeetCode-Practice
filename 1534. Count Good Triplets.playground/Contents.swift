import UIKit

func countGoodTriplets(_ arr: [Int], _ a: Int, _ b: Int, _ c: Int) -> Int {
    print(a)
    var maxVal = 0
    var frequencyMap: [Int: Int] = [:]
    for item in arr {
        //sum of two number cannot exeed this
        maxVal = (maxVal > item) ? maxVal : item
        
        //repeat count of number
        if let oldFrequency = frequencyMap[item]  {
            frequencyMap[item] = oldFrequency + 1
        } else {
            frequencyMap[item] = 1
        }
    }
    var tripletCount = 0
    
    //1. if zero are more than 2
    if let zeroCount = frequencyMap[0], zeroCount > 2 {
        tripletCount += (zeroCount * (zeroCount - 1) * (zeroCount - 3)) / (2*3)  // nC3
    }
    
    //2. if one zero -> 0, i , i
    if let zeroCount = frequencyMap[0], zeroCount != 0 {
        for (key,value) in frequencyMap {
            if key != 0,  value > 1 {
                tripletCount += (zeroCount * value * (value - 1))/2
            }
        }
    }
    
    //3. i,i,2i
    for (key,value) in frequencyMap {
        if key != 0, let doubleValue = frequencyMap[2 * key], value > 1 {
            tripletCount += (doubleValue * value * (value - 1))/2
        }
    }
    
    //4. if i, j, i + j  = k
    for (key,value) in frequencyMap {
        for (key2,value2) in frequencyMap {
            //key < key2 => to avoid duplicate cases
            if key != 0, key < key2, let sumValue = frequencyMap[key + key2] {
                tripletCount += (value * value2 * sumValue)
            }
        }
    }
    return  tripletCount
}
countGoodTriplets([3,0,1,1,9,7], 7, 2, 3)
