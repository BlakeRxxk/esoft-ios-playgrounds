import Foundation
/*
  1. Are the letters unique?

  Напишите функцию, которая принимает String в качестве параметра и возвращает true, если строка содержит только уникальные символы.

  Hint #1: Попробуйте работать со срокой input как с массивом, который содержит элементы типа Characters - [Characters]().
  Hint #2: Можно использовать массив из временных значений, чтобы хранить элементы, которые были проверенны, но это не обязательно.
  Hint #3: Set похожи на массивы, за исключением того, что они не могут содержать дубликатов.
  Hint #4: Можно создавать Set из массиовов и массивы из Set. Обе струткуры содержат свойство count.
 */

func challenge1(input: String) -> Bool {
  var usedLetters = [Character]()
  
  for letter in input {
    if usedLetters.contains(letter) {
      return false
    }
    
    usedLetters.append(letter)
  }
  
  return true
}

func challenge1b(input: String) -> Bool {
  return Set(input).count == input.count
}

assert(challenge1(input: "No duplicates") == true, "Challenge 1 failed")
assert(challenge1(input: "abcdefghijklmnopqrstuvwxyz") == true, "Challenge 1 failed")
assert(challenge1(input: "AaBbCc") == true, "Challenge 1 failed")
assert(challenge1(input: "Hello, world") == false, "Challenge 1 failed")

/*
  2. Count the characters?

  Напишите функцию, которая принимает String и возвращает количество вхождений символа в переданную строку.

  Tip: Если задача кажется слишком легкой, попробуйте решить ее без for-in цикла
  Hint #1: Помните, что String и Character - разные типы.
  Hint #2: Не бойтесь решить задачу в лоб перебором, используя for-in цикл.
  Hint #3: Можно решить эту задачу, используя reduce().
  Hint #4: Можно решить эту задачу, используя NSCountedSet.
 */

func challenge2(input: String, count: Character) -> Int {
  var letterCount = 0
  
  for letter in input {
    if letter == count {
      letterCount += 1
    }
  }
  
  return letterCount
}

func challenge2b(input: String, count: Character) -> Int {
  return input.reduce(0) {
    $1 == count ? $0 + 1 : $0
  }
}

func challenge2c(input: String, count: String) -> Int {
  let array = input.map { String($0) }
  let counted = NSCountedSet(array: array)
  
  return counted.count(for: count)
}

func challenge2d(input: String, count: String) -> Int {
  let modified = input.replacingOccurrences(of: count, with: "")
  return input.count - modified.count
}

assert(challenge2(input: "The rain in Spain", count: "a") == 2, "Challenge 2 failed")
assert(challenge2(input: "Mississippi", count: "i") == 4, "Challenge 2 failed")

/*
 3. Reverse the words in a string

 Напишите функцию, которая возвращает строку, где каждое слово отражено, но с сохранением изначального порядка слов, без использования for-in циклов.

 Hint #1: Начните с конвертации строки в массив, разделив слова в строке по пробелам.
 Hint #2: Можно отразить символы в строке используюя reversed().
 Hint #3: Можно создать строку из массива Character.
 Hint #4: for-in цикл можно заменить методом map().
 Hint #5: Как только у вас будет массив отраженных строк, можно преобразовать его в одну строку, используя joined().
*/

func challenge3(input: String) -> String {
  let parts = input.components(separatedBy: " ")
  let reversed = parts.map { String($0.reversed()) }
  return reversed.joined(separator: " ")
}

assert(challenge3(input: "Swift Coding Challenge") == "tfiwS gnidoC egnellahC", "Challenge 3 failed")
assert(challenge3(input: "The quick brown fox") == "ehT kciuq nworb xof", "Challenge 3 failed")
