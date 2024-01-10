
public func challenge1(input: String)->Bool{
    var usedLetters = [Character]()
    for letter in input{
        if usedLetters.contains(letter){
            return false
        }
        usedLetters.append(letter)
    }
    return true
}
       



       
