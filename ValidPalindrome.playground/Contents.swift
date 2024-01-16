//Given a string s, return true if the s can be palindrome after deleting at most one character from it.


//input = "aba"
//output = true

func checkValidity(_ s: String)->Bool{
    var arr: [String] = []
    for i in 0..<s.count{
        var modifiedString = s
        modifiedString.remove(at: modifiedString.index(modifiedString.startIndex, offsetBy: i))
        arr.append(modifiedString)
    }
    
    for i in 0..<arr.count{
        if isPalindrome(arr[i]){
            return true
        }
    }
    return false
}

func isPalindrome(_ s: String)-> Bool{
    
    let reversedString = String(s.lowercased().reversed())
    if s == reversedString{
        return true
    }
    return false
}


checkValidity("acucucubucucucua")
