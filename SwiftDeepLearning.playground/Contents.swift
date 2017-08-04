//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Hello, playground"


// 函数返回值元组，可以返回多个值
func calculateResult(firstNum: Int, secondNum: Int)-> (min: Int,max: Int,sum: Int) {
    let min = (firstNum < secondNum) ? firstNum : secondNum
    let max = firstNum >= secondNum ? firstNum:secondNum
    return (min: min,max: max,sum: firstNum+secondNum)
}

calculateResult(firstNum: 3, secondNum: 4)

// 闭包作为返回值
// 求一个数组里，最大值和最小值的差

func returnFunction(firstNum: Int, secondNum: Int) -> (Int, Int) -> Int {
    func sum(a: Int, b: Int)-> Int {
        return a + b
    }
    sum(a: firstNum, b: secondNum)
    return sum(a:b:)
}

// 闭包作为参数
//func hasAnyMatches(isMap: (Int,Int)-> Int)->(Bool) {
//
////    for item in list {
////        if number(item) {
////            return true
////        }
////    }
//
//   let closure =  isMap(a, b) {
//        return a + b
//    }
//   let result = isMap(3,4)
//
//}
//returnFunction(firstNum: 5, secondNum: 6)
//
//
//hasAnyMatches { (a, b) -> Int in
//    return a + b
//}

//func hasAnyMatches((_ condition: Int, list: [Int]) -> Bool) -> Bool {
//    for item in list {
//        if condition == item {
//
//            return true
//        }
//    }
//    return false
//}

func clousureFuntion(list: [Int], closure: ((Int) -> Bool))-> Bool {
    
    print(list.filter(closure))
    return true
    
//    return false
}


clousureFuntion(list: [1,3,5,8,2,6]) { (num) -> Bool in
  return num > 5
}



//// MARK: - 类的初始化
//
//class Father {
//    var name: String = ""
//    let age: Int = 0
//
//}
//class Child: Father {
//    override var name: String {
//        get {
//            return "22"
//        }
//        set {
//            name = "33"
//        }
//    }
//    override var age: Int = 2
//    var schoolName: String?
//}
//
//let aChild = Child()
//aChild.name = "3232"
//






// MARK: - 构造函数
//class Ball {
//    var name: String?
//    var size: CGSize?
//
//    // 便利构造函数
//    convenience init(name: String, size: CGSize) {
//        self.init(name: name)
//    }
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//let aBall = Ball.init()
//let ball = Ball(name: "table tennis")
//aBall.name = "Basketball"





// MARK: - 属性


/*
 存储型属性
 计算型属性
 willSet和didSet
 */

class Rectangle {
    var width: Float = 0.0
    var height: Float = 0.0
    var area: Float {
        return width * height
    }
    
    init(width: Float, height: Float) {
        self.width = width
        self.height = height
    }
}
//class Square: Rectangle {
//
//    init(width: Float) {
//        super.init(width: width, height: height)
//        self.width = width
//    }
//}


let rect = Rectangle(width: 3, height: 5)
print(rect.area)
//let square = Square(width: 3)


// MARK: - Enum

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Ace
let aceRawValue = ace.rawValue
let two = Rank.Jack.rawValue



// 枚举类型默认有init?(rawValue:)构造方法，通过rawValue来获取成员值
let rank = Rank(rawValue: 6)

// 枚举的成员实例，也可以添加实例值，这对枚举的扩展是异常大的

//enum ServerResponse {
//    case Result(String, String)
//    case Failure(String)
//}
//
//let success = ServerResponse.Result("6:00 am", "8:09 pm")
//let failure = ServerResponse.Failure("Out of cheese.")
//
//switch success {
//case let .Result(sunrise, sunset):
//    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
//case let .Failure(message):
//    print("Failure...  \(message)")
//}





// 实现一个协议
/*
 * 结构体和枚举是传值，类是传引用
 * 协议里可以声明属性，但是也要注意，对于结构体和枚举的方法，需要在协议声明的时候添加mutating,在实现时也要加muutating
 */


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "332"
    mutating func adjust() {
        simpleDescription = "111111"
        print(simpleDescription)
    }
}
var simpleStruct = SimpleStruct(simpleDescription: "00000")
simpleStruct.adjust()




// MARK: - 抛出错误
enum PrintError: Error {
    case HeightError    //: "身高不在测试范围内"
    case WeightError    //: "体重不在测试范围内"
}


func isFat(height: Float, weight: Float)throws ->  Bool {
    if height > 250 || height < 50 {
        print("输入身高超限制")
        throw PrintError.HeightError
    }   else if (weight >= 500 || weight < 0) {
        print("体重不在测试范围内")
        throw PrintError.WeightError
    }   else if height - weight > 110 {
        print("合格体重")
        return true
    } else {
        print("超重")
        return false
    }
}

//isFat(height: 178.9, weight: 74)
//第一种处理方式
/*
 * try? 将结果变为可选的，如果有错，结果为nil,无错，是一个包含函数类型的可选值
 * 注意即使无错误结果也是可选值
 */
let isFatable = try? isFat(height: 178, weight: 74)         //此时isFatable是Bool型的可选值
print(isFatable!)
// do-catch处理方式
/*
 * 模式很简单，在do中执行代码，没有错误，则直接执行
 * 若有错误，在根据定义的闭包函数抛出的错误类型来捕获
 *       1.若原函数只有一个throw，则catch后自动将结果变为error
 *       2. 原函数有多个throw的错误类型，可以在多个catch后分别添加不同的error来分情况处理错误
 */
do {
    try isFat(height: 888, weight: 74)
} catch  {
    print(error)
}

var isHealthy = true
do {
    isHealthy = try isFat(height: 375, weight: 500)
} catch PrintError.HeightError {
    print("身高错误\(PrintError.HeightError)")
} catch PrintError.WeightError {
    print("体重错误\(PrintError.WeightError)")
}

// MARK: - 泛型
func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
repeatItem(repeating: "knock", numberOfTimes:4)


// 枚举重新实现 Swift 标准库中的可选类型
enum OptionalValue<Wrapped> {
    case None
    case Some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .None
possibleInteger = .Some(100)



//实现一个泛型，
/*
 有where限定泛型条件
 前面元素的任何一个值，都在后一个数组里面
 */
//func isMappable<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U）-> Bool {
//    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
//
//    for lhsItem in lhs {
//
//        for rhsItem in rhs {
//            if lhsItem == rhsItem {
//            return true
//            }
//        }
//    }
//    return false
//}
//}
func isMappable<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
isMappable([1, 2, 3], [3])

// MARK: - assert断言
/*
 *当代码使用优化编译的时候，断言将会被禁用，例如在 Xcode 中，使用默认的 target Release 配置选项来 build 时，断言会被禁用。”
 *
 */

//let a = 2
//assert((a > 3), "程序终止")
//let a = "23243kdmldkf;df"
//a.hashValue





// MARK: - 枚举类型的hashValue
/*
 结论是： 没有关联值的枚举成员是可哈希化的，
         只要任意成员关联值，所有成员都不是可哈希化的
 ---》可是原因是什么，不理解
 
 */
enum Gender {
    case female
    case male
}
let women = Gender.female
let men = Gender.male
women.hashValue
men.hashValue
1.hashValue


enum Size {
    case width(String)
    case height([Int])
    case area
}

let aSize = Size.height([3,5,6])
let bSize = Size.width("3333")
//let cSize = Size.area

//aSize.hashValue
//bSize.hashValue
//cSize.hashValue




//集合之间的关系
/*
 * 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
 * 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
 * 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
 * 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
 * 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
 */

let firstSet: Set = [1, 2]
let secondSet: Set = [1, 2, 3, 4, 5]
let thirdSet: Set = [2, 3]
let forthSet: Set = [4, 5]
//

//
firstSet.isSubset(of: secondSet)
//// true
secondSet.isSuperset(of: thirdSet)
//// true
firstSet.isStrictSubset(of: secondSet)
//// true
firstSet.isDisjoint(with: forthSet)
// true

//输入输出参数，参数的值可以变化
func swapNums(_ a: inout Int, _ b: inout Int) -> Int {
    let temp = a
    a = b
    b = temp
    return a
}
var a = 1
var b = 2
let c = 3
let d = 4
swapNums(&a, &b)


//swapNums(&c, &d)


// MARK: - closures
/*
 * 闭包表达式参数 可以是 in-out 参数，但不能设定默认值。也可以使用具名的可变参数（译者注：但是如果可变参数不放在参数列表的最后一位的话，调用闭包的时时编译器将报错。）。元组也可以作为参数和返回值。
 
 对比函数： 函数必须添加inout参数才可以设置可变参数，
 同时可以指定默认值
 */

// 添加默认值的话，就会多出一个writerInfo(name: <#T##String#>)方法
var name: String?
var city: String?

func writerInfo(name: String, city: String = "Beijing") {
}

writerInfo(name: "Chirst")
func swapName(_ a: inout String, _ b: inout String) -> String {
    let temp = a
    a = b
    b = temp
    return a
}

var zhang = "zhang"
var li = "li"
print(swapName(&zhang, &li))

func defineFuntionWithClosure(closure: (Int, Int)->(Bool)) {
    
    
}


// MARK: -枚举


/*
 
 
 
 枚举类型是first-class一等类型，有很多新特性
 1. 支持计算属性computed properties
 2. 可以添加枚举值的附加值，实例方法，用于提供和枚举值相关的功能
 3. 可以定义构造函数initializers来提供一个初始值
 4. 支持扩展extension，也能遵守协议protocol
 
 
 
 * swift中枚举的成员不会被赋予一个整型值，但若制定枚举类型为Int型，则会隐式赋值为0，1，2.....
 *
 *
 *
 *
 *
 */


enum Planet: Int {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
    func test() {
        print("333")
    }
}

extension Planet {
}

print(Planet.earth.rawValue)

Planet.test(Planet.earth)


//原始值和关联值


enum Color: Int {
    case red = 1
    case orange
    case yellow = 10
    case green
    case blue
    case pink
}

print(Color.pink.rawValue)
print(Color(rawValue: 2) ?? "找不到对应的枚举成员")

enum CompassPoint: String{
    case north
    case south
    case east
    case west
}
CompassPoint.north
