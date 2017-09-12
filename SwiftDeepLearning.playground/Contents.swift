//: Playground - noun: a place where people can play

import UIKit
import Foundation
var str = "Hello, playground"


//// 函数返回值元组，可以返回多个值
//func calculateResult(firstNum: Int, secondNum: Int)-> (min: Int,max: Int,sum: Int) {
//    let min = (firstNum < secondNum) ? firstNum : secondNum
//    let max = firstNum >= secondNum ? firstNum:secondNum
//    return (min: min,max: max,sum: firstNum+secondNum)
//}
//
//calculateResult(firstNum: 3, secondNum: 4)
//
//// 闭包作为返回值
//// 求一个数组里，最大值和最小值的差
//
//func returnFunction(firstNum: Int, secondNum: Int) -> (Int, Int) -> Int {
//    func sum(a: Int, b: Int)-> Int {
//        return a + b
//    }
//    sum(a: firstNum, b: secondNum)
//    return sum(a:b:)
//}
//
//// 闭包作为参数
////func hasAnyMatches(isMap: (Int,Int)-> Int)->(Bool) {
////
//////    for item in list {
//////        if number(item) {
//////            return true
//////        }
//////    }
////
////   let closure =  isMap(a, b) {
////        return a + b
////    }
////   let result = isMap(3,4)
////
////}
////returnFunction(firstNum: 5, secondNum: 6)
////
////
////hasAnyMatches { (a, b) -> Int in
////    return a + b
////}
//
////func hasAnyMatches((_ condition: Int, list: [Int]) -> Bool) -> Bool {
////    for item in list {
////        if condition == item {
////
////            return true
////        }
////    }
////    return false
////}
//
//func clousureFuntion(list: [Int], closure: ((Int) -> Bool))-> Bool {
//    
//    print(list.filter(closure))
//    return true
//    
////    return false
//}
//
//
//clousureFuntion(list: [1,3,5,8,2,6]) { (num) -> Bool in
//  return num > 5
//}
//
//
//
////// MARK: - 类的初始化
////
////class Father {
////    var name: String = ""
////    let age: Int = 0
////
////}
////class Child: Father {
////    override var name: String {
////        get {
////            return "22"
////        }
////        set {
////            name = "33"
////        }
////    }
////    override var age: Int = 2
////    var schoolName: String?
////}
////
////let aChild = Child()
////aChild.name = "3232"
////
//
//
//
//
//
//
//// MARK: - 构造函数
////class Ball {
////    var name: String?
////    var size: CGSize?
////
////    // 便利构造函数
////    convenience init(name: String, size: CGSize) {
////        self.init(name: name)
////    }
////
////    init(name: String) {
////        self.name = name
////    }
////}
////
////let aBall = Ball.init()
////let ball = Ball(name: "table tennis")
////aBall.name = "Basketball"
//
//
//
//
//
//// MARK: - 属性
//
//
///*
// 存储型属性
// 计算型属性
// willSet和didSet
// */
//
//class Rectangle {
//    var width: Float = 0.0
//    var height: Float = 0.0
//    var area: Float {
//        return width * height
//    }
//    
//    init(width: Float, height: Float) {
//        self.width = width
//        self.height = height
//    }
//}
////class Square: Rectangle {
////
////    init(width: Float) {
////        super.init(width: width, height: height)
////        self.width = width
////    }
////}
//
//
//let rect = Rectangle(width: 3, height: 5)
//print(rect.area)
////let square = Square(width: 3)
//
//
//// MARK: - Enum
//
//enum Rank: Int {
//    case Ace = 1
//    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
//    case Jack, Queen, King
//    func simpleDescription() -> String {
//        switch self {
//        case .Ace:
//            return "ace"
//        case .Jack:
//            return "jack"
//        case .Queen:
//            return "queen"
//        case .King:
//            return "king"
//        default:
//            return String(self.rawValue)
//        }
//    }
//}
//let ace = Rank.Ace
//let aceRawValue = ace.rawValue
//let two = Rank.Jack.rawValue
//
//
//
//// 枚举类型默认有init?(rawValue:)构造方法，通过rawValue来获取成员值
//let rank = Rank(rawValue: 6)
//
//// 枚举的成员实例，也可以添加实例值，这对枚举的扩展是异常大的
//
////enum ServerResponse {
////    case Result(String, String)
////    case Failure(String)
////}
////
////let success = ServerResponse.Result("6:00 am", "8:09 pm")
////let failure = ServerResponse.Failure("Out of cheese.")
////
////switch success {
////case let .Result(sunrise, sunset):
////    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
////case let .Failure(message):
////    print("Failure...  \(message)")
////}
//
//
//
//
//
//// 实现一个协议
///*
// * 结构体和枚举是传值，类是传引用
// * 协议里可以声明属性，但是也要注意，对于结构体和枚举的方法，需要在协议声明的时候添加mutating,在实现时也要加muutating
// */
//
//
//protocol ExampleProtocol {
//    var simpleDescription: String { get }
//    mutating func adjust()
//}
//
//struct SimpleStruct: ExampleProtocol {
//    var simpleDescription: String = "332"
//    mutating func adjust() {
//        simpleDescription = "111111"
//        print(simpleDescription)
//    }
//}
//var simpleStruct = SimpleStruct(simpleDescription: "00000")
//simpleStruct.adjust()
//
//
//
//
//// MARK: - 抛出错误
//enum PrintError: Error {
//    case HeightError    //: "身高不在测试范围内"
//    case WeightError    //: "体重不在测试范围内"
//}
//
//
//func isFat(height: Float, weight: Float)throws ->  Bool {
//    if height > 250 || height < 50 {
//        print("输入身高超限制")
//        throw PrintError.HeightError
//    }   else if (weight >= 500 || weight < 0) {
//        print("体重不在测试范围内")
//        throw PrintError.WeightError
//    }   else if height - weight > 110 {
//        print("合格体重")
//        return true
//    } else {
//        print("超重")
//        return false
//    }
//}
//
////isFat(height: 178.9, weight: 74)
////第一种处理方式
///*
// * try? 将结果变为可选的，如果有错，结果为nil,无错，是一个包含函数类型的可选值
// * 注意即使无错误结果也是可选值
// */
//let isFatable = try? isFat(height: 178, weight: 74)         //此时isFatable是Bool型的可选值
//print(isFatable!)
//// do-catch处理方式
///*
// * 模式很简单，在do中执行代码，没有错误，则直接执行
// * 若有错误，在根据定义的闭包函数抛出的错误类型来捕获
// *       1.若原函数只有一个throw，则catch后自动将结果变为error
// *       2. 原函数有多个throw的错误类型，可以在多个catch后分别添加不同的error来分情况处理错误
// */
//do {
//    try isFat(height: 888, weight: 74)
//} catch  {
//    print(error)
//}
//
//var isHealthy = true
//do {
//    isHealthy = try isFat(height: 375, weight: 500)
//} catch PrintError.HeightError {
//    print("身高错误\(PrintError.HeightError)")
//} catch PrintError.WeightError {
//    print("体重错误\(PrintError.WeightError)")
//}
//
//// MARK: - 泛型
//func repeatItem<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
//    var result = [Item]()
//    for _ in 0..<numberOfTimes {
//        result.append(item)
//    }
//    return result
//}
//repeatItem(repeating: "knock", numberOfTimes:4)
//
//
//// 枚举重新实现 Swift 标准库中的可选类型
//enum OptionalValue<Wrapped> {
//    case None
//    case Some(Wrapped)
//}
//var possibleInteger: OptionalValue<Int> = .None
//possibleInteger = .Some(100)
//
//
//
////实现一个泛型，
///*
// 有where限定泛型条件
// 前面元素的任何一个值，都在后一个数组里面
// */
////func isMappable<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U）-> Bool {
////    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
////
////    for lhsItem in lhs {
////
////        for rhsItem in rhs {
////            if lhsItem == rhsItem {
////            return true
////            }
////        }
////    }
////    return false
////}
////}
//func isMappable<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
//    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
//        for lhsItem in lhs {
//            for rhsItem in rhs {
//                if lhsItem == rhsItem {
//                    return true
//                }
//            }
//        }
//        return false
//}
//isMappable([1, 2, 3], [3])
//
//// MARK: - assert断言
///*
// *当代码使用优化编译的时候，断言将会被禁用，例如在 Xcode 中，使用默认的 target Release 配置选项来 build 时，断言会被禁用。”
// *
// */
//
////let a = 2
////assert((a > 3), "程序终止")
////let a = "23243kdmldkf;df"
////a.hashValue
//
//
//
//
//
//// MARK: - 枚举类型的hashValue
///*
// 结论是： 没有关联值的枚举成员是可哈希化的，
//         只要任意成员关联值，所有成员都不是可哈希化的
// ---》可是原因是什么，不理解
// 
// */
//enum Gender {
//    case female
//    case male
//}
//let women = Gender.female
//let men = Gender.male
//women.hashValue
//men.hashValue
//1.hashValue
//
//
//enum Size {
//    case width(String)
//    case height([Int])
//    case area
//}
//
//let aSize = Size.height([3,5,6])
//let bSize = Size.width("3333")
////let cSize = Size.area
//
////aSize.hashValue
////bSize.hashValue
////cSize.hashValue
//
//
//
//
////集合之间的关系
///*
// * 使用“是否相等”运算符(==)来判断两个集合是否包含全部相同的值。
// * 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中。
// * 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值。
// * 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另外一个集合的子集合或者父集合并且两个集合并不相等。
// * 使用isDisjoint(with:)方法来判断两个集合是否不含有相同的值(是否没有交集)。
// */
//
//let firstSet: Set = [1, 2]
//let secondSet: Set = [1, 2, 3, 4, 5]
//let thirdSet: Set = [2, 3]
//let forthSet: Set = [4, 5]
////
//
////
//firstSet.isSubset(of: secondSet)
////// true
//secondSet.isSuperset(of: thirdSet)
////// true
//firstSet.isStrictSubset(of: secondSet)
////// true
//firstSet.isDisjoint(with: forthSet)
//// true
//
////输入输出参数，参数的值可以变化
//func swapNums(_ a: inout Int, _ b: inout Int) -> Int {
//    let temp = a
//    a = b
//    b = temp
//    return a
//}
//var a = 1
//var b = 2
//let c = 3
//let d = 4
//swapNums(&a, &b)
//
//
////swapNums(&c, &d)
//
//
//// MARK: - closures
///*
// * 闭包表达式参数 可以是 in-out 参数，但不能设定默认值。也可以使用具名的可变参数（译者注：但是如果可变参数不放在参数列表的最后一位的话，调用闭包的时时编译器将报错。）。元组也可以作为参数和返回值。
// 
// 对比函数： 函数必须添加inout参数才可以设置可变参数，
// 同时可以指定默认值
// */
//
//// 添加默认值的话，就会多出一个writerInfo(name: <#T##String#>)方法
//var name: String?
//var city: String?
//
//func writerInfo(name: String, city: String = "Beijing") {
//}
//
//writerInfo(name: "Chirst")
//func swapName(_ a: inout String, _ b: inout String) -> String {
//    let temp = a
//    a = b
//    b = temp
//    return a
//}
//
//var zhang = "zhang"
//var li = "li"
//print(swapName(&zhang, &li))
//
//func defineFuntionWithClosure(closure: (Int, Int)->(Bool)) {
//    
//    
//}
//
//
//// MARK: -枚举
//
//
///*
// 
// 
// 
// 枚举类型是first-class一等类型，有很多新特性
// 1. 支持计算属性computed properties(不支持存储属性）
// 2. 可以添加枚举值的附加值，实例方法，用于提供和枚举值相关的功能
// 3. 可以定义构造函数initializers来提供一个初始值
// 4. 支持扩展extension，也能遵守协议protocol
// 
// 
// 
// * swift中枚举的成员不会被赋予一个整型值，但若制定枚举类型为Int型，则会隐式赋值为0，1，2.....
// *
// *
// *
// *
// *
// */
//
//
//enum Planet: Int {
//    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
//    func test() {
//        print("333")
//    }
//}
//
//extension Planet {
//}
//
//print(Planet.earth.rawValue)
//
//Planet.test(Planet.earth)
//
//
////原始值和关联值
//
//
//enum Color: Int {
//    case red = 1
//    case orange
//    case yellow = 10
//    case green
//    case blue
//    case pink
//}
//
//print(Color.pink.rawValue)
//print(Color(rawValue: 2) ?? "找不到对应的枚举成员")
//
//enum CompassPoint: String{
//    case north
//    case south
//    case east
//    case west
//}
//CompassPoint.north
//
//
//
//
//
//// MARK: - class && struct
///*
// *
// *
// *
// *
// *
// *
// *
// *
// */
//
//class SomeClass {
//    var name: String = "initialName"
//    var num = 0
//    var resolution: Resolution = Resolution(height: 0, width: 0)
//    let localName = "localName"
//}
//
//struct SomeStruct {
//    var name: String?
//    var num = 0
//}
//
//struct Resolution {
//    var height = 0
//    var width = 0
//}
//
////Class是引用类型
////为常量的引用类型, 其内部的成员变量，可变的不可以改变，不可变的仍然不可变
//let aClass = SomeClass()
//aClass.name = "zhang"
//
//
//
//let newClass = aClass
////aClass.name = "newName"
//print(newClass.name)
////????为什么这里仍然可以
////总觉的值类型的var没意义
//var resolution = Resolution(height: 3, width: 3)
//print(resolution.height)
//
//resolution.height = 33
//print(resolution.height)
//
//
//
//
//// 引用类型，即使变为常量，内部的可变成员变量仍然可以改变
//// 值类型， 变成了变量，其内部的成员变量仍然会发生改变
//
//// 引用类型的原始值对新的成员变量是否会发生改变
////
//
////“如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行：”
////“由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。”
//
//
////“必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。”
//
////懒加载（延时存储属性）的初始化是在构造结束之后。
////
//aClass.name = "2223"




//class TestSetGetClass {
//    var number = 0 {
//        willSet {
//            print("父类的新值\(newValue)")
//        }
//        didSet {
//            print("父类的旧值\(oldValue)")
//        }
//    }
//}
//
////TestSetGetClass().number = 3
//
//class ChildSetGetClass: TestSetGetClass {
//    override var number: Int {
//        willSet {
//            print("子类的新值\(newValue)")
//        }
//        didSet {
//            print("子类的旧值\(oldValue)")
//        }
//    }
//}
//
////TestSetGetClass().number = 0
//
//ChildSetGetClass().number = 1
////  1. 改变子类的值，其调用顺序是   子类的willSet方法-——> 父类的willSet方法-->父类的didSet方法--->子类的didSet方法
////  2. 只要写了属性观察期，即使值没有改变，也会调用didSet和willSet方法
//
//
//
//struct TestSetGetStruct {
//    var name: String {
//        willSet {
//            print("结构体的新值\(newValue)")
//        }
//        didSet {
//            print("子类的旧值\(oldValue)")
//        }
//    }
//    mutating func changeName(newName: String) {
//        name = newName
//    }
//}
//
//var aStruct = TestSetGetStruct(name: "Tom")
//var newName = "Jimmy"
//aStruct.changeName(newName: newName)
//
//
//var dictionary = ["one": 1, "two": 2,"three": 3]
//print(dictionary["one"] ?? "对应的key没有value")
//dictionary["three"] = nil
//print(dictionary)
//
//// 字典的定义和取值都是[],OC是定义是{}，取值是（）
//// 通过key取值value，返回值为option类型
//// 可以通过将某个key的value值设为nil来完成删除操作
//
//class Vehicle {
//    var speed = 0
//    var setGetProperty: String = "setGetProperty"
//    var hasWheel: Bool {
//        return true
//    }
//
//    func drive() {
//        print("Vehicle drive")
//    }
//}
//
//class Train: Vehicle {
//
//// 如果父类为读写属性，而子类重写为只读属性，会报错，错误如下：
//// Cannot override mutable property with read-only property 'setGetProperty'
////    var setGetProperty: String {
////        get {
////            return "只读属性"
////        }
////    }
//
//    override func drive() {
//        super.drive()
//        print("train drive")
//    }
//}
//class Ship: Vehicle {
//    override var hasWheel: Bool {
//        set {
//            print("调用set方法,newValue的值为\(newValue)")
////            self.hasWheel = newValue
//        }
//        get {
//            print("调用get方法")
//            return false
//        }
//    }
//}
//let aTrain = Train()
//aTrain.drive()
//
//let aShip = Ship()
//aShip.hasWheel = false
//let a = aShip.hasWheel
//
//// 重写属性的Set方法和GET方法
//// 父类是只读属性，子类可以将其重写为读写属性
//// 父类是读写属性，子类必须也是读写属性，不能是只读属性
//
//
//
//// MARK: - 构造函数
///*
// * 存储性属性，要么初始化就给定值，要么在构造函数写，若是可选类型，可以不用给值，不给值默认会为nil
// * 存储性属性，给默认值或者在构造函数中初始化时，不会调用属性观察器
// * 对于常量let属性，其值在初始化之后确定为常量不可以修改，在初始化的时候，可以赋值
// * 对于存储性属性，如果后续不修改，尽量在定义时，直接做赋值操作，不要写在初始化的构造函数中
// *
// * 对于值类型的struct和enume没有继承，所以初始化构造器相对简单
// * 如果所有的属性都有默认值，可以不自定义构造器,swift会帮你创建一个默认构造器。
// Class类型，默认构造器就是init() {}
// 结构体类型为逐一成员构造器，比如struct Size {
// var width = 0.0, height = 0.0
// }
// let twoByTwo = Size(width: 2.0, height: 2.0)
//
//
//
//
//
// ***
// 对于值类型，如果你自定义了一个构造器，那么默认构造器就没了，比如struct的逐一成员构造器就无法访问
// 但对于Class的引用类型，即使你自定义了，但默认的init(){}仍然存在
// */
//
//class TestInitlizationClass {
//    let name: String
//    init() {
//        self.name = "li"
//    }
//
//    init(name: String) {
//        self.name = name
//    }
//}
//
//struct TestColorStruct0 {
//    var red, green, blue: Float
//    var alpha: Float = 1.0
//        init(red: Float,green: Float,blue:Float) {
//            self.red = red
//            self.green = green
//            self.blue = blue
//        }
//
//    init(red: Float,green: Float,blue:Float,alpha: Float) {
//        self.red = red
//        self.green = green
//        self.blue = blue
//        self.alpha = alpha
//    }
//}
//
//struct TestColorStruct1 {
//    var red, green, blue: Float
//    var alpha: Float = 1.0
//
//    init(red: Float,green: Float,blue:Float,alpha: Float = 1.0) {
//        self.red = red
//        self.green = green
//        self.blue = blue
//        self.alpha = alpha
//    }
//}
//
//struct TestColorStruct2 {
//    var red, green, blue: Float
//    var alpha: Float = 1.0
//
//    // init?的可失败构造器的返回值是一个可选类型
//    // init!的可失败构造器的已经对隐形可选类型进行了解包，不是可选类型
//
//    init?(red: Float,green: Float,blue:Float,alpha: Float) {
//        if alpha > 1.0 || alpha < 0.0 || red < 0.0 || red > 255.0 || green < 0.0 || green > 255.0 || blue < 0.0 || blue > 255.0{
//            print("初始化失败")
//            return nil
//        }
//        self.red = red
//        self.green = green
//        self.blue = blue
//        self.alpha = alpha
//    }
//}
//
////对比TestColorStruct0和TestColorStruct1发现：指定alpha的默认值为1.0，会自动生成包含和不包含alpha的两种初始化方法，TestColorStruct1的写法更简洁一些
////对比TestColorStruct1和TestColorStruct2发现：可以根据类型指定范围来构建初始化构造器
//
//TestColorStruct0(red: 10.0, green: 10.0, blue: 10.0)
//TestColorStruct1(red: 10.0, green: 10.0, blue: 10.0)
//TestColorStruct2(red: 333, green: 2, blue: 2, alpha: 0.1)
//
//
//class aVehicle {
//    var numberOfWheels = 0
//    var description: String {
//      return "\(numberOfWheels) wheel(s)"
//    }
//}
//
//class Bicycle: aVehicle {
//    var color: String = "red"
//    override init() {
//        super.init()
//        numberOfWheels = 2
//    }
//
//    convenience init(color: String) {
//        self.init()
//        self.color = color
//    }
//}
//
//let aBike = Bicycle(color: "blue")
//// MARK: - 析构函数(只有Class类型有析构器，而且析构函数不能主动调用）
//class TestDeinitClass {
//    var name = "zhang"
//    init!() {
//    }
//    deinit {
//         print("执行析构函数，类销毁，此时的name是\(name)")
//    }
//}
//
//var aTestDeinitClass = TestDeinitClass()
//aTestDeinitClass = nil



// MARK: - 可选类型的意思

//let name1: String? = "name1"
//let name2: String! = "name2"
//var name3: String?
//var name4: String!
//let name5: String? = "name5"
//let name6: String! = "name6"
//
//print(name1)
//print(name2)
//print(name3)
//print(name4)
//print(name5)
//print(name6)
//
////可选类型的意思是：     有值则取值，但若不解包，值为optional;  无值则为nil
////隐式可选类型的意思是：  有值则取值，已经解包，值不是optional;  无值则为nil

// MARK: - 解除闭包的循环引用
////如果闭包没有指明参数列表或者返回类型，即它们会通过上下文推断，那么可以把捕获列表和关键字in放在闭包最开始的地方：
////
////lazy var someClosure: Void -> String = {
////    [unowned self, weak delegate = self.delegate!] in
////    // 这里是闭包的函数体
////}
//
//
//
//
//
//// 可选式链式调用，A.B.C
//// 如果B是可选类型，C不是，那么A.B.C的结果也是可选类型
//class TestOptionalValueClass {
//    var name: String = "zhang"
//
//    func printName() {
//        print(name)
//    }
//}
//
//var aTestOptionalValueClass: TestOptionalValueClass? = TestOptionalValueClass()
//print(aTestOptionalValueClass?.name)
//
//TestOptionalValueClass().printName()
//
//
//// MARK: - 敢于错误类型的处理Error 在swift中是一个协议，可以根据协议自定义错误类型
//
///*
// 执行错误处理的方式主要有四种
// 用throw函数传递错误，抛出错误
// 处理错误的方式：
// 1. 直接在对应的错误类型后执行特定的函数来傻瓜处理
//         func someThrowingFunction() throws -> Int {
//             try executeSomeFuntion()
//         }
// 2. do-catch处理抛出的错误
//         do {
//         try expression
//         statements
//         } catch pattern 1 {
//         statements
//         } catch pattern 2 where condition {
//         statements
//         }
//  3. 也可以通过try将错误转化为可选值来处理错误
//  形式类似如下
//         func someThrowingFunction() throws -> Int {
//             // ...
//         }
//
//         let x = try? someThrowingFunction()
//
//         let y: Int?
//         do {
//             y = try someThrowingFunction()
//         } catch {
//             y = nil
//         }
// *
// *  定义一个场景：
// *
// *  一女生找男朋友，要求条件是：
//                         身高超过180，
//                         体重低于80kg,
//                         年收入不低于30万；
// *  如果不满足以上条件，则返回错误，并告知具体的错误类型
// *
// *
// */
//
//
//enum CantMeetStandard: Error {
//    case heightError
//    case weightError
//    case incomeError
//}
//
//class BoyFriendClass {
//    var weight: Float = 0.0
//    var height: Float = 0.0
//    var income: Float = 0.0
//
//    init(height: Float, weight: Float, income: Float) {
//        self.height = height
//        self.weight = weight
//        self.income = income
//    }
//}
//
//func isMeetStandard(boy: BoyFriendClass)throws -> Bool {
//    guard boy.height >= 180 else {
//        throw CantMeetStandard.heightError
//    }
//    guard boy.weight <= 80 else {
//        throw CantMeetStandard.weightError
//    }
//    guard boy.income >= 30 else {
//        throw CantMeetStandard.incomeError
//    }
//    print("满足要求")
//    return true
//}
//
//// do-catch执行错误就会直接抛出，不会继续执行，不能一次检出多种错误
//// 比如次数，体重和收入都不满足要求，但检测到体重不符合要去后就直接跑出了，不会再执行第三步了
//var boy1 = BoyFriendClass(height: 180, weight: 100, income: 20)
//do {
//    try isMeetStandard(boy: boy1)
//} catch CantMeetStandard.heightError {
//    print("身高不符合要求")
//} catch CantMeetStandard.weightError {
//    print("体重不符合要求")
//} catch CantMeetStandard.incomeError {
//    print("收入不符合要求")
//}
//
//
//// 将错误变为可选值
//// 函数前面加try返回值类型为可选值.   正确则正常执行；
////                               错误则返回nil
////所以可以根据是否为nil来决定下一步是否执行
//var boy = BoyFriendClass(height: 181, weight: 70, income: 37)
//let isMeet1 = try? isMeetStandard(boy: boy)
//let isMeet2 = try! isMeetStandard(boy: boy)
//print(isMeet1)  //可选类型，错误则为nil
//print(isMeet2)  //已经解包，不满足则会报错
//
//
//// MARK: - defer
////defer语句将代码的执行延迟到当前的作用域退出之前。该语句由defer关键字和要被延迟执行的语句组成。延迟执行的语句不能包含任何控制转移语句，例如break或是return语句，或是抛出一个错误。延迟执行的操作会按照它们被指定时的顺序的相反顺序执行——也就是说，第一条defer语句中的代码会在第二条defer语句中的代码被执行之后才执行，以此类推
//
//func openTheDoor() {
//    defer {
//        print("关门")
//    }
//    print("开门")
//    print("取出东西")
//}
////打印结果是：
////开门
////取出东西
////关门
//openTheDoor()






//// MARK: - is和as的类型检查
////is :  用类型检查操作符（is）来检查一个实例是否属于特定子类型,可以用来检查继承和遵守协议         返回值类型：   正确为true错误为false
////用类型转换操作符（as? 或 as!）某类型的一个常量或变量可能在幕后实际上属于一个子类或者遵守协议，    返回值类型：  正确则返回该类型，错误则返回nil
//
//protocol BProtocol {
//
//}
//
//class BClass: BProtocol {
//
//}
//class BBClass: BClass {
//
//}
//class BBBClass: BBClass {
//
//}
//let bClass = BClass()
//let bbClass = BBClass()
//let bbbClass = BBBClass()
//bbbClass is BClass        //检查继承关系
//bbbClass is BProtocol     //检查遵守协议
//
//bbClass as? BBBClass      //如果
//
//bbClass as? BProtocol     //也可以用于判断遵守协议与否
//
//
//
//// MARK: - Any 和 AnyObject
////Any 可以表示任何类型，包括函数类型。
////AnyObject 可以表示任何类类型的实例。
//
//// var array: [Any]? 表明数组的元素可以是各种类型
//var array = [Any]()
//array.append(1)
//array.append(1.4)
//array.append("字符串")
//array.append(BClass())
//print(array)
//
//var array2 = [AnyObject]()
//array2.append(bClass)   //只能添加class类型
//

//
//
//
// MARK: - extension
//
///*
// *
// *  问： 可以给类扩展属性么?
// *  答： extension可以扩展属性，但只能扩展计算型属性computed properties，不能在扩展里定义存储性属性stored properties
// *  问： 给类扩展的属性，方法，协议可以被继承么？
// *  答:  扩展只能扩展计算型属性，可以被继承，扩展的方法和协议也都可以被继承
// *
// *  进阶：
// *  可以在扩展里添加属性的set/get方法，也可以添加计算型属性
// *  但是不可以添加属性观察期，也不可以添加存储性属性
// *
// *
// *
// *
// *
// */
//

//protocol TestExtensionProtocol {
//    func protocolFunction()
//}
//
//class TestExtensionClass {
//    var name: String?
//    func testFunction() {
//    }
//}
//
//extension TestExtensionClass: TestExtensionProtocol {
//    var extensionName: String? {
//        return "这是扩展的计算型属性"
//    }
//
//    // 不可以添加属性观察器，但是可以添加属性的set和get方法
//    var observeName: String {
//        set {
//            name = newValue
//        }
//        get {
//            return "getName"
//        }
//    }
//    func testExtensionFunction() {
//    }
//
//    func protocolFunction() {
//        print("这是一个protocolFunction")
//    }
//}
//
//class TestExtensionChildClass: TestExtensionClass {
//}
//
//var aTestExtensionChildClass = TestExtensionChildClass()
//
//aTestExtensionChildClass.extensionName
//aTestExtensionChildClass.testExtensionFunction()
//aTestExtensionChildClass.protocolFunction()
//aTestExtensionChildClass.observeName = "1"
//print(aTestExtensionChildClass.name)
//
//
//
//
//struct TestExtensionStruct {
//    var structName: String?
//    func testStructFunction() {
//        print("这是结构体的方法")
//    }
//
//}
//extension TestExtensionStruct {
//    var extensionStructName: String {
//        return "这是一个结构体的扩展属性名字"
//    }
//    func testStructExtensionFunction() {
//        print("这是结构体扩展的方法")
//    }
//}
//
//var aTestExtensionStruct = TestExtensionStruct(structName: "结构体")
//aTestExtensionStruct.testStructFunction()
//aTestExtensionStruct.testStructExtensionFunction()
//aTestExtensionStruct.structName
//
//
//
////通过extension的方法也可以改变struct和enum值类型的属性(用处很大，毕竟swift底层是struct)
//extension Int {
//    mutating func square() -> Int{
//         return self * self
//    }
////    更简单的方法
////    mutating func square() {
////        self = self * self
////    }
//}
//
//var num = 3
//num.square()
////不可以直接用3.square()因为要求参数必须是可变类型




//// 下面是一个值类型的例子
//struct S { var data: Int = -1 }
//var a = S()
//var b = a                            // b是a的拷贝
//a.data = 42                            // 更改a的数据，b的不受影响
//print("\(a.data), \(b.data)")        // 输出结果 "42, -1”
//
//
//class TestValueTypeClass {
//    var name: String = "name"
//
//}
//
//var aTestValueTypeClass = TestValueTypeClass()
//var bTestValueTypeClass = aTestValueTypeClass
////aTestValueTypeClass.name = "newName"
//print(bTestValueTypeClass.name)




//MARK: @protocol


// 协议里定义属性
// 协议里定义属性，需要定义set/get方法；
//  如果声明为set/get方法的属性，则遵守协议的类型必须一定实现set/get方法
//  如果声明为get方法的属性，    则遵守协议的类型可以只实现get方法，也可以实现set/get方法


// 声明的属性默认是一定要实现的



// 暂时验证： 无法增加Class类的属性
// 协议增加mutating方法也暂时无效


//protocol TestProtocol {
//    // 协议中定义属性
//    var name: String {set get}
//    static var staticName: String { get }
////    class var className: String {get}
//
//
//    // 协议中定义方法
//    func testProtocolFunction()
//    mutating func testProtocolValueFunction()
//}
//
//class TestProtocolClass: TestProtocol {
//
//    var name: String {
//        set {
//
//        }
//        get {
//            return "getName"
//        }
//    }
//
//    static var staticName: String {
//        return "staticName"
//    }
//
////   class var className: String {
////        set {
////        }
////        get {
////            return "classNzame"
////        }
////    }
//
////      执行方法
//    func testProtocolFunction() {
//        print("执行testProtocolFunction")
//    }
//
//    func testProtocolValueFunction() {
//        print("类里也可以调用mutating方法，因为本身类是引用类型，值是可变的")
//    }
//
//
//}
//
//struct TestProtocolStruct: TestProtocol {
//
//    var structName: String = "structName"
////    class var className: String {
////        return "className"
////    }
//
//    var name: String {
//        set {
//        }
//        get {
//            return "getName"
//        }
//    }
//
//    static var staticName: String {
//        return "staticName"
//    }
//
//    func testProtocolFunction() {
//        print("执行testProtocolFunction")
//    }
//
//    mutating func testProtocolValueFunction() {
//        name = "name的值在mutating方法中改变了"
//    }
//
//}

//class TestDelegateClass {
//
//
//    var a = TestProtocolClass()
//    a.customProtocol = self
//
//}



//// MARK: - 探究集合类型在swift和OC的区别
//let a = NSMutableArray(array: [1,2,3])
//let b:NSArray = a
//a.insert(4, at: 3)
////通过打印地址发现，a,b的内存地址相同，所以仍然是一个对象，因此不难理解a改变,b也会被影响
//print(Unmanaged.passUnretained(a).toOpaque())
//print(Unmanaged.passUnretained(b).toOpaque())
//
////如果不被影响，必须显式的复制
//let c = NSMutableArray(array: [1,2,3])
//let d = c.copy() as!NSArray
//c.insert(4, at: 3)
////c,d地址不同，c的改变不会影响d
//print(c)
//print(d)
//
//print(Unmanaged.passUnretained(c).toOpaque())
//print(Unmanaged.passUnretained(d).toOpaque())
//

// MARK: - 探究==和===的区别


// 引用类型的同一性（identity)
// ==  来判断两个变量是否相等                      结构相等
// === 来检查两个变量是否确实引用了同一个对象      “指针相等或者引用相等。”

/*
 first === third     是true
 (first === second   是false
 
 
 
 
 结构体虽然是值类型，但是不能用== 也不能用 ===
 但是结构体里具体的成员变量可以用==
 */

//class TestSameClass {
//    var name: String?
//}
//
//var firstClass = TestSameClass()
//var secondClass = TestSameClass()
//var thirdClass = firstClass
//
//
//var isIdentity = (firstClass === secondClass)
//
//
//struct TestSameStruct {
//    var name: String?
//}
//
//var firstStruct = TestSameStruct(name: "Jimmy")
//var secondStruct = TestSameStruct(name: "Jimmy")
//
////var isSame = (firstStruct === secondStruct)
//
//let x = [1,2,3]
//var y = x
//y.append(4)


//
//var intArray = [1,2,3,4]
//var stringArray = ["aa","b","c","da"]
//
//intArray.map { (a) -> Int in
//    a + a
//}
//
////intArray.filter { (a) -> Bool in
////
////    true
////}
//
//

// MARK: - swift里数组的成员和OC数组成员相同
//var aNSArray: NSMutableArray = [1,2,3,4]
//aNSArray.firstObject
//
//let aPoint = CGPoint(x: 100.0, y: 100.0)
////var anyArray = [aPoint]
//var aNewArray = [aPoint]
//
// 两者都是true
//aNSArray[1] is NSNumber
//aNewArray[0] is NSValue




// MARK: - 协议中的方法在遵守对象里的实现 VS 在协议扩展中实现方法
// 对比静态调用和动态调用
protocol Shareable {
    var socialMediaDescription: String { get }
    func share()

}
//我们可以在协议扩展中加入 share 方法。它把将要分享到社交网络的的内容打印到标准输出中。我们可以再加入一个方法来对这个输出添加一些格式。

extension Shareable {
    func share() {
        print("Sharing: \(self.socialMediaDescription)")
    }
    func linesAndShare() {
        print("----------")
        share()
        print("----------")
    }
}

extension String: Shareable {
    var socialMediaDescription: String { return self }
    
    func share() {
        print("Special String Sharing: \(self.socialMediaDescription)")
    }
}
let hello: Shareable = "hello"
hello.share()
// 打印 "Sharing: hello"
//更有趣的是，猜猜看如果我们直接在 String 上调用 linesAndShare 时会发生什么？
"hello".linesAndShare()




protocol TestExtensionProtocol {
    var customInt: String { get }
    func protocolFunction()
}

extension TestExtensionProtocol {
    func protocolFunction() {
        print("静态派发的方式，调用协议扩展里的方法")
    }
}

//class Int: TestExtensionProtocol {
//    var customInt: String { get }
//    func protocolFunction() {
//        print("动态调用的方法，调用协议自定义接口的方法")
//    }
//}
//


protocol TestClassProtocol: class {
    func classProtocolFunction()
}


protocol TestFatherProtocol {
    func fatherFunction()
}

protocol TestFirstChildProtocol: TestFatherProtocol {
    func firstChildFunction()
}
protocol TestSecondChildProtocol: TestFatherProtocol {
    func secondChildFunction()
}


class TestProtocolClass: TestClassProtocol, TestFatherProtocol, TestSecondChildProtocol,TestFirstChildProtocol {
    func classProtocolFunction() {
        print("只有类能集成")
    }
    
    func firstChildFunction() {
        print("第一个子类协议的方法")
    }
    
    func secondChildFunction() {
        print("第二个子类协议的方法")
    }
    
//    func fatherFunction() {
//        print("父类")
//    }
}


extension TestFatherProtocol {
    func fatherFunction() {
        print("TestFatherProtocol协议的方法")
    }
}

extension TestFirstChildProtocol {
    func fatherFunction() {
        print("TestFirstChildProtocol协议的方法")
    }
}

//extension TestSecondChildProtocol {
//    func fatherFunction() {
//        print("TestSecondChildProtocol协议的方法")
//    }
//}
let aTestProtocolClass = TestProtocolClass()
aTestProtocolClass.fatherFunction()



// 此时会报错
//struct TestProtocolClassStruct: TestClassProtocol {
//    func classProtocolFunction() {
//        print("结构体也能遵守类协议")
//    }
//}


 protocol TestOCClassProtocol {
    func testProtocolAviableInOC()
}

class TestProtocolInOCClass: NSObject, TestOCClassProtocol {
    func testProtocolAviableInOC() {
        print("testProtocolAviableInOC")
    }
}

let aTestProtocolInOCClass = TestProtocolInOCClass()
aTestProtocolInOCClass.testProtocolAviableInOC()





/// 类的实现和协议的实现

/*
 1. 协协议的扩展可以直接实现协议定义的方法，遵守协议的类型可以直接调用方法实现，不需要自己来实现了
 2. 如果协议扩展中实现了，类也遵守协议在类中实现，或者类自定义了方法，都会覆盖掉协议扩展中实现的方法
 3. 即使协议不声明方法，扩展协议也可以实现，而且可以被遵守协议的类调用
 
 
 */
//protocol IntExtensionProtocol {
////    optional var age: Int {get}
//    func isThin(height: Float, weight: Float) -> Bool
//}
//
//
//extension IntExtensionProtocol {
//    func isThin(height: Float, weight: Float) -> Bool {
//        let num = height - weight
//        print("协议扩展中的方法")
//        return num > 110 ? true : false
//    }
//}
//
//class TestPersonThinClass: IntExtensionProtocol{
//    var height: Float?
//    var weight: Float?
//    init(height: Float, weight: Float) {
//        self.height = height
//        self.weight = weight
//    }
//
//    func isThin(height: Float, weight: Float) -> Bool {
//        let num = height - weight
//        print("遵守协议的类，自定义的方法")
//        return num > 110 ? true : false
//    }
//}
//
//var aTestPersonThinClass = TestPersonThinClass(height: 180, weight: 100)
//aTestPersonThinClass.isThin(height: 190, weight: 100)
//
//
//struct TestPersonThinStruct: IntExtensionProtocol{
//    var height: Float?
//    var weight: Float?
//    init(height: Float, weight: Float) {
//        self.height = height
//        self.weight = weight
//    }
//
//    func isThin(height: Float, weight: Float) -> Bool {
//        let num = height - weight
//        print("遵守协议的结构体，自定义的方法")
//        return num > 110 ? true : false
//    }
//}
//var aTestPersonThinStruct = TestPersonThinStruct(height: 180, weight: 100)
//aTestPersonThinStruct.isThin(height: 190, weight: 100)

let nameDictionary: [Int: String] = [001: "Jimmy"]
let ageDictionary: [Int: Int] = [001: 20]

func getInformationFrom (ID: Int) -> (name: String, age: Int) {
    let name = nameDictionary[ID] ?? "找不到对应的名字"
    let age = ageDictionary[ID] ?? 0
    
    return (name, age)
}

let aPerson = getInformationFrom(ID: 001)

print(aPerson)

//某种意义上来说，任何函数的返回值都是Tuples类型
//func returnVoidFuntion() {
//
//}
// （）等价于（Void）
//func returnVoidFuntion()->() {
//
//}
//
//func returnIntFunction()->Int {
//    return 1
//}
//
//func returnIntFunction()->(Int) {
//    return (1)
//}

