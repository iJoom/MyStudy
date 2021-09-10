//
//  main.swift
//  SwiftAlgorithm
//
//  Created by IJ . on 2021/09/09.
//

import Foundation

var repetitionWords: Array<String> = []

var testString: String? = "asdf"

print(testString!.last!)

func solution(_ n:Int, _ words:[String]) -> [Int] {
    var count: Int = 1
    var answer: [Int] = []
    guard let data = words.first else {
        return []
    }
    repetitionWords.append(data)

    for (index, item) in words.enumerated() {

        if index > 0 {
            if words[index-1].last == words[index].first {
                if repetitionWords.contains(words[index]) {
                    print(index)
                    answer.append(index%n+1)
                    answer.append(index/n+1)
                    return answer
                }
                repetitionWords.append(words[index])
            }else {
                // print(words[index-1]," ",words[index])
                // print(index,count)
                answer.append(index%n+1)
                answer.append(count)
                return answer
            }

        }

        if (index+1) % n == 0 {
            count += 1
        }
    }
    return [0,0]
}


print(solution(3, ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]))
