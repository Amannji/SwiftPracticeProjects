import UIKit
///Given a array of nums give out the array of the numbers which give the desired target
///INPUT[2,3,5,7,8,9,11]   TARGET: 9  OUTPUT[0,3]
///

func twoSum(_ nums:[Int], _ target: Int)->[Int]{
    var numberedIndexMap = [Int:Int]()
    for (index,num) in nums.enumerated(){
        let complement = target - num
        if let complementIndex = numberedIndexMap[complement]{
            return [complementIndex, num]
        }
        numberedIndexMap[num] = index
    }
    
    return []
}



print(twoSum([2,7,11,15],4))
