
/*
A company is planning to interview 2n people. Given the array costs where costs[i] = [aCosti, bCosti], the cost of flying the ith person to city a is aCosti, and the cost of flying the ith person to city b is bCosti.
 
 Input: costs = [[10,20],[30,200],[400,50],[30,20]]
 Output: 110


 */

func twoCitySchedCost(_ costs: [[Int]]) -> Int {
    var diff = costs.sorted{$0[0]-$0[1] < $1[0]-$1[1]}
    
    var n = costs.count / 2
    var minCosts = 0
    for i in 0..<n{
        minCosts += diff[i][0] + diff[i+n][1]
    }
    return minCosts
}
let costs = [[10,20],[30,200],[400,50],[30,20]]

print(twoCitySchedCost( [[10,20],[30,200],[400,50],[30,20]]))
