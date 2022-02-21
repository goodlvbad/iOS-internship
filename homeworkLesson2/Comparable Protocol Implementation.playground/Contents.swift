import UIKit

enum LessonType {
    case math(rating: Int)
    case ntiveLanguage(rating: Int)
    case computerSince(rating: Int)
    case literature(rating: Int)
}

extension LessonType: Equatable {
    static func ==(lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let a), .math(rating: let b)):
            return a == b
        case (.ntiveLanguage(rating: let a), .ntiveLanguage(rating: let b)):
            return a == b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a == b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a == b
        default:
            return false
        }
    }
}

protocol MyComparableProtocol {
    static func <(lhs: Self, rhs: Self) -> Bool
    static func <=(lhs: Self, rhs: Self) -> Bool
    static func >(lhs: Self, rhs: Self) -> Bool
    static func >=(lhs: Self, rhs: Self) -> Bool
}

extension LessonType: MyComparableProtocol {
    static func >=(lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let a), .math(rating: let b)):
            return a >= b
        case (.ntiveLanguage(rating: let a), .ntiveLanguage(rating: let b)):
            return a >= b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a >= b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a >= b
        default:
            return false
        }
    }
    
    static func > (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let a), .math(rating: let b)):
            return a > b
        case (.ntiveLanguage(rating: let a), .ntiveLanguage(rating: let b)):
            return a > b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a > b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a > b
        default:
            return false
        }
    }
    
    static func <= (lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let a), .math(rating: let b)):
            return a <= b
        case (.ntiveLanguage(rating: let a), .ntiveLanguage(rating: let b)):
            return a <= b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a <= b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a <= b
        default:
            return false
        }
    }
    
    static func <(lhs: LessonType, rhs: LessonType) -> Bool {
        switch (lhs, rhs) {
        case (.math(rating: let a), .math(rating: let b)):
            return a < b
        case (.ntiveLanguage(rating: let a), .ntiveLanguage(rating: let b)):
            return a < b
        case (.computerSince(rating: let a), .computerSince(rating: let b)):
            return a < b
        case (.literature(rating: let a), .literature(rating: let b)):
            return a < b
        default:
            return false
        }
    }
}


let math = LessonType.math(rating: 7)
let math2 = LessonType.math(rating: 7)
let language = LessonType.ntiveLanguage(rating: 2)
let language2 = LessonType.ntiveLanguage(rating: 26)

print(math == math2)

let isLess = LessonType.math(rating: 5) < LessonType.math(rating: 8)
print(isLess)

let isLessOrEqual = LessonType.computerSince(rating: 45) <= LessonType.computerSince(rating: 23)
print(isLessOrEqual)

print(language2 >= language)
