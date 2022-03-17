import UIKit

var greeting = "Hello, playground"

class A {
    weak var b: B?
    
    func selfPrint() {
        print("we are in A class")
    }
}

class B {
    weak var a: A?
    
    func selfPrint() {
        print("we are in B class")
    }
}

var a: A?
var b: B?

a = A()
b = B()

a?.b = b
b?.a = a

print(a?.selfPrint())
print(b?.selfPrint())

print(a?.b!.selfPrint())
print(b?.a)

