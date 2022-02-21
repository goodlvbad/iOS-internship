
// Протоколы как тип данных

protocol Flyable {
    var speed: Int { get }
    
    func fly()
}

extension Flyable {
    func fly() {
        print("flying with a speed of \(speed)")
    }
}

struct Bird: Flyable {
    let velocity: Int
    var speed: Int {
        10 * velocity
      }
}

class Plane: Flyable {
    let model: String
    var speed: Int
    
    init(model: String, maxSpeed: Int) {
        self.model = model
        self.speed = maxSpeed
    }
}

let songbird = Bird(velocity: 2)
let boeing = Plane(model: "boeing", maxSpeed: 840)

var obj: [Flyable] = []
obj.append(songbird)
obj.append(boeing)

obj.forEach { $0.fly() }
