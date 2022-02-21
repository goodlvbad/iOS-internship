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

struct Statistics {
    private(set) var armor: Float?
    private(set) var attackPower: Float?
    private(set) var strength: Float?
    private(set) var agility: Float?
    private(set) var intelligence: Float?
    private(set) var hitPoints: Float?
    private(set) var mana: Float?

    mutating func updateStatistics (
        armor: Float,
        attackPower: Float,
        strength: Float,
        agility: Float,
        intelligence: Float,
        hitPoints: Float,
        mana: Float)
    {
        self.armor = armor
        self.attackPower = attackPower
        self.strength = strength
        self.agility = agility
        self.intelligence = intelligence
        self.hitPoints = hitPoints
        self.mana = mana
    }
    
}

struct Hero: Moveable, Actionable {
    
    private(set) var stats: Statistics
    
    private(set) var currentPosition: CGPoint
    
    private(set) var action: AttakStyle
    
    private(set) var primaryAttribute: PrimaryAttribute
    
    init(
        statistics: Statistics,
        attack style: AttakStyle,
        attribute: PrimaryAttribute)
    {
        stats = statistics
        action = style
        primaryAttribute = attribute
        currentPosition = CGPoint(x: 0, y: 0)
    }
    
    mutating func move(to point: CGPoint) {
        currentPosition = point
        print("move to point \(point)")
    }
}

let lichStats = Statistics(armor: 2, attackPower: 22, strength: 15, agility: 14, intelligence: 20, hitPoints: 475, mana: 300)
var lich = Hero(statistics: lichStats, attack: .longRange, attribute: .intelligence)

//move lich and attack
lich.currentPosition // x: 0, y: 0
lich.move(to: CGPoint(x: 54.6, y: 64.5))
lich.currentPosition
lich.move(to: CGPoint(x: 544.6, y: 644.5))
lich.stop()
lich.attack()

//let's create more heroes

let archmageStats = Statistics(armor: 3, attackPower: 21, strength: 14, agility: 17, intelligence: 19, hitPoints: 450, mana: 285)
var archmage = Hero(statistics: archmageStats, attack: .longRange, attribute: .intelligence)

let shadowHunterStats = Statistics(armor: 4, attackPower: 22, strength: 15, agility: 20, intelligence: 17, hitPoints: 475, mana: 255)
var shadowHunter = Hero(statistics: shadowHunterStats, attack: .longRange, attribute: .agility)

let wardenStats = Statistics(armor: 4, attackPower: 22, strength: 18, agility: 20, intelligence: 16, hitPoints: 550, mana: 240)
var warden = Hero(statistics: wardenStats, attack: .melee, attribute: .agility)

let alchemistStats = Statistics(armor: 1, attackPower: 28, strength: 25, agility: 10, intelligence: 18, hitPoints: 725, mana: 270)
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
heroes.sort { $0.stats.attackPower ?? 0.0 >= $1.stats.attackPower ?? 0.0 }

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
    heroes.max(by: { $0.stats.mana ?? 0.0 < $1.stats.mana ?? 0.0 })?.stats.mana ?? 0.0
}
maxMana(of: heroes)
print("max mana of hero in heroes \(maxMana(of: heroes))")
