import UIKit

enum AttakStyle: Int, Comparable, CustomStringConvertible {
    case melee
    case longRange
    
    static func <(lhs: AttakStyle, rhs: AttakStyle) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

extension AttakStyle {
    var description: String {
        switch self {
        case .longRange:
            return "long range attak!"
        case .melee:
            return "melee attak!"
        }
    }
}

enum PrimaryAttribute: Int, Comparable {
    case agility
    case intelligence
    case strength
    
    static func <(lhs: PrimaryAttribute, rhs: PrimaryAttribute) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}

protocol Statistics {
    typealias Attributes = (armor: Float, attackPower: Float, strength: Float, agility: Float, intelligence: Float, hitPoints: Float, mana: Float)

    var armor: Float? { get }
    var attackPower: Float? { get }
    var strength: Float? { get }
    var agility: Float? { get }
    var intelligence: Float? { get }
    var hitPoints: Float? { get }
    var mana: Float? { get }

    init(statistics: Attributes, attack style: AttakStyle, attribute: PrimaryAttribute)
    
    mutating func updateStatistics(_ statistics: Attributes)
}

protocol Moveable {
    var currentPosition: CGPoint { get }
    
    mutating func move(to point: CGPoint)
}

extension Moveable {
    func stop() {
        print("stop at current position \(currentPosition)")
    }
}

protocol Actionable {
    var action: AttakStyle { get }
    
    var primaryAttribute: PrimaryAttribute { get }
}

extension Actionable {
    func attack() {
        switch action {
        case .longRange:
            print(action.description)
        case .melee:
            print(action.description)
        }
    }
    
    func getPrimaryAttributeInfo() {
        switch primaryAttribute {
        case .agility:
            print("Agility increases the armor and the attack speed of the hero.")
        case .intelligence:
            print("Intelligence increases the amount of maximum mana and the mana regeneration of the hero.")
        case .strength:
            print("Strength heroes are the best late game heroes")
        }
    }
}

struct Hero: Statistics, Moveable, Actionable {
 
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?
    
    private(set) var currentPosition: CGPoint
    
    private(set) var action: AttakStyle
    
    private(set) var primaryAttribute: PrimaryAttribute
    
    init(statistics: Attributes, attack style: AttakStyle, attribute: PrimaryAttribute) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
        action = style
        primaryAttribute = attribute
        currentPosition = CGPoint(x: 0, y: 0)
    }
    
    mutating func updateStatistics(_ statistics: Attributes) {
        armor = statistics.armor
        attackPower = statistics.attackPower
        strength = statistics.strength
        agility = statistics.agility
        intelligence = statistics.intelligence
        hitPoints = statistics.hitPoints
        mana = statistics.mana
    }
    
    mutating func move(to point: CGPoint) {
        currentPosition = point
        print("move to point \(point)")
    }
    
}

var lichStats: Statistics.Attributes
lichStats.armor = 2
lichStats.agility = 14
lichStats.attackPower = 22
lichStats.hitPoints = 475
lichStats.intelligence = 20
lichStats.mana = 300
lichStats.strength = 15

var lich = Hero(statistics: lichStats, attack: .longRange, attribute: .intelligence)

//move lich and attack
lich.currentPosition // x: 0, y: 0
lich.move(to: CGPoint(x: 54.6, y: 64.5))
lich.currentPosition
lich.move(to: CGPoint(x: 544.6, y: 644.5))
lich.stop()
lich.attack()

//let's create more heroes

var archmageStats: Statistics.Attributes
archmageStats.armor = 3
archmageStats.agility = 17
archmageStats.attackPower = 21
archmageStats.hitPoints = 450
archmageStats.intelligence = 19
archmageStats.mana = 285
archmageStats.strength = 14

var archmage = Hero(statistics: archmageStats, attack: .longRange, attribute: .intelligence)

var shadowHunterStats: Statistics.Attributes
shadowHunterStats.armor = 4
shadowHunterStats.agility = 20
shadowHunterStats.attackPower = 22
shadowHunterStats.hitPoints = 475
shadowHunterStats.intelligence = 17
shadowHunterStats.mana = 255
shadowHunterStats.strength = 15

var shadowHunter = Hero(statistics: shadowHunterStats, attack: .longRange, attribute: .agility)

var wardenStats: Statistics.Attributes
wardenStats.armor = 4
wardenStats.agility = 20
wardenStats.attackPower = 22
wardenStats.hitPoints = 550
wardenStats.intelligence = 16
wardenStats.mana = 240
wardenStats.strength = 18

var warden = Hero(statistics: wardenStats, attack: .melee, attribute: .agility)

var alchemistStats: Statistics.Attributes
alchemistStats.armor = 1
alchemistStats.agility = 10
alchemistStats.attackPower = 28
alchemistStats.hitPoints = 725
alchemistStats.intelligence = 18
alchemistStats.mana = 270
alchemistStats.strength = 25

var alchemist = Hero(statistics: alchemistStats, attack: .melee, attribute: .strength)

var heroes: [Hero] = []
heroes.append(lich)
heroes.append(archmage)
heroes.append(alchemist)
heroes.append(warden)
heroes.append(shadowHunter)

// print info
print("- print info -")
heroes.forEach { $0.getPrimaryAttributeInfo() }
//
print("- attack each hero in heroes -")
heroes.forEach { $0.attack() }

// sort by attackPower
heroes.sort { $0.attackPower ?? 0.0 >= $1.attackPower ?? 0.0 }

// sort by attak style (long range > melee)
heroes.sort { $0.action > $1.action }
print("- sort by attak style -")
heroes.forEach { $0.attack() }

// sort by primary attribute
heroes.sort { $0.primaryAttribute < $1.primaryAttribute }
print("- sort by primary attribute -")
heroes.forEach { print($0.primaryAttribute) }

// max mana of hero in heroes
func maxMana(of heroes: [Hero]) -> Float {
    heroes.max(by: { $0.mana ?? 0.0 < $1.mana ?? 0.0 })?.mana ?? 0.0
}
maxMana(of: heroes)
print("max mana of hero in heroes \(maxMana(of: heroes))")
