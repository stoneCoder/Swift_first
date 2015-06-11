//
//  main.swift
//  Swift_first
//
//  Created by 四三一八 on 15/6/10.
//  Copyright (c) 2015年 4318. All rights reserved.
//

import Foundation

/*定义变量*/
var first = 40;
first = 50;
/*定义常量*/
let second = 30;
let third = 40;
let fourth = 40.0;
/*告诉编译器参数类型*/
let five:Double = 30;
let six:Float = 20;
var seven = 20.0;
/*定义字符串*/
let text = "this is my first swift";
let width = 94;
let textWifth = text + String(width);

/*字符串拼接*/
let apples = 3;
let oranges = 5;
let appleSummary = "I have \(apples) apples";
let fruitSummary = "I have \(apples + oranges) pieces of fruit";
let age:Float = 30
let showText = "I am \(age), do you know ?"
//为了让这些字符串的用途更为明显，我们为 join 函数添加外部参数名：
     //函数名（别名 参数名：类型）
func join(string s1: String, toString s2: String, withJoiner joiner: String) -> String {
    return s1 + joiner + s2
}
println(join(string: "haha", toString: "sb!", withJoiner: "you are a"))


/*数组*/
var shoppingList = ["catfish","water","tulips"];
shoppingList[1] = "bottle of water";
/*字典*/
var occupations = ["Malcolm":"Captain","Kayles":"Mechanic"];
occupations["Jayne"] = "Public Relations";

let emptyArray1 = Array<String>();
let emptyArray2 = [String]();
let emptyDictionary = Dictionary<String,Float>();

/*无法判断类型*/
let testArray = [];
let testDic = [:];

/*循环遍历*/
let intArray = [75,43,103,87,12];
var teamScore = 0;
for score in intArray{
    if score > 50 {
        teamScore += 3;
    }else{
        teamScore += 1;
    }
}

for(index,value) in enumerate(intArray){
    println("Item \(index + 1): \(value)")
}

var firstForLoop = 0
for i in 0...4 {
    firstForLoop += i
}
println(firstForLoop);
var secondForLoop = 0
for var i = 0; i < 3; ++i {
    secondForLoop += 1
}
println(secondForLoop);

let interstingNumbers = ["Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25]];
var largest = 0;
var kind:String = "";
for(key,values) in interstingNumbers{
    for number in values{
        if number > largest{
            largest = number;
            kind = String(key);
        }
    }
}
println("The largest number is \(largest) and key is \(kind)");

var optionalString:String?="Hello";
optionalString = nil;
var optionalName:String?="John Applessed";
optionalName = nil;
var greeting = "Hello !";
/*判空
你可以一起使用 if 和 let 来防止值的丢失。这些值是可选的。可选值可以包含一个值或包含一个 nil 来指定值还不存在。写一个问号 "?" 在类型后表示值是可选的*/
if let name = optionalName{
    greeting = "Hello,\(name)";
}else{
    greeting = "Hello,John Applessed";
}

let vegetable = "red pepper"
let vegetableComment:String;
switch vegetable {
    case "celery":
        vegetableComment = "Add some raisins and make ants on a log."
    case "cucumber", "watercress":
        vegetableComment = "That would make a good tea sandwich."
    case let x where x.hasSuffix("pepper"):
          vegetableComment = "Is it a spicy \(x)?"
    default: //by gashero
          vegetableComment = "Everything tastes good in soup."
}
println(vegetableComment);

//定义函数 函数名(参数名:类型) ->返回值
func greet(name:String,day:String,lunch:Array<String>) ->String{
    return "Hello \(name), today is \(day) , and lunch is \(lunch)";
}
println(greet("Bob", "TuesDay",["rice","coffee"]));

//元组返回多个值
func getGasPrices()->(Double,Double,Double){
    return (3.59,3.69,3.79);
}
println(getGasPrices());

//可变参数
func sumOf(numbers:Int...)->Int{
    var sum = 0;
    for number in numbers{
        sum += number;
    }
    return sum;
}

func mathOf(numbers:Int...)->Int{
    var sum = 0;
    for number in numbers{
        sum += number;
    }
    return sum/numbers.count;
}
println(sumOf(42, 597, 11,20));
println(mathOf(42, 597, 11,20));

//内嵌函数
func returnFifteen() ->Int{
    var y = 10;
    func add(){
        y += 5;
    }
    add();
    return y;
}
println(returnFifteen());

//函数是第一类型的。这意味着函数可以返回另一个函数
func makeIncrementer() ->(Int ->Int){
    func addOne(number:Int) ->Int{
        return 1 + number;
    }
    return addOne;
}
var increment = makeIncrementer();
println(increment(7));

//一个函数可以接受其他函数作为参数
func hasAnyMatches(list:Array<Int>,condition:Int->Bool) ->Bool{
    for item in list {
        if condition(item){
            return true;
        }
    }
    return false;
}

func lessThanTen(number:Int) -> Bool{
    return number < 10;
}
var numbers = [20,19,7,12];
println(hasAnyMatches(numbers, lessThanTen));


//函数实际是闭包的特殊情况。你可以写一个闭包而无需名字，只需要放在大括号中即可。使用 in 到特定参数和主体的返回值。
numbers.map({
    (number:Int)-> Int in
    let result = 3 * number
    return result
})

println(numbers.map({number in 3*number}));

/*创建类*/
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String{
        return "A shape with \(numberOfSides) sides"
    }
}
var shape = Shape();
shape.numberOfSides = 7;
println(shape.simpleDescription());

class NamedShape {
    var numberOfSides:Int = 0;
    var name:String;
    /*结构体*/
    init(name:String){
        self.name = name;
    }
    
    func simpleDescription()->String{
        return "A shape with \(numberOfSides) sides and name is \(self.name)"
    }
}

var namedShape = NamedShape(name:"Test");
namedShape.numberOfSides = 7;
println(namedShape.simpleDescription());


class Square:NamedShape {
    var sideLength:Double;
    init(sideLength:Double,name:String){
        self.sideLength = sideLength;
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area()->Double{
        return sideLength*sideLength;
    }
    /*重载父类的方法*/
    //子类的方法可以通过标记 override 重载超类中的实现，而没有 override 的会被编译器看作是错误。编译器也会检查那些没有被重载的方法。
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}

let test = Square(sideLength: 5.2, name: "my test square");
println(test.area());
println(test.simpleDescription());


class EquilateralTriangle : NamedShape {
    var sideLength : Double = 0.0
    init(sideLength:Double,name:String){
        self.sideLength = sideLength;
        super.init(name: name);
        numberOfSides = 3;
    }
    
    var perimeter:Double{
        get{
            return 3.0*sideLength;
        }
        
        set{
            sideLength = newValue/3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}

//设置属性的值 调用超类的构造器 改变超类定义的属性的值，添加附加的工作来使用方法、getter、setter也可以在这里
/*初始化值*/
let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle");
/*调用set方法设置perimeter的值*/
triangle.perimeter = 9.9
println(triangle.simpleDescription());

class TriangleAndSquare {
    //如果你不需要计算属性，但是仍然要提供在设置值之后执行工作，使用 willSet 和 didSet
    var triangle:EquilateralTriangle{
        willSet{
            square.sideLength = newValue.sideLength;
        }
    }
    
    var square:Square{
        willSet{
            triangle.sideLength = newValue.sideLength;
        }
    }
    
    init(size:Double,name:String){
        square = Square(sideLength: size, name: name);
        triangle = EquilateralTriangle(sideLength: size, name: name);
    }
}

var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape");
println(triangleAndSquare.triangle.sideLength);
println(triangleAndSquare.square.sideLength);
triangleAndSquare.square = Square(sideLength: 50.0, name: "larger square")
println(triangleAndSquare.triangle.sideLength);

//当与可选值一起工作时，你可以写 "?" 到操作符之前类似于方法属性。如果值在"?"之前就已经是 nil ，所有在 "?" 之后的都会自动忽略，而整个表达式是 nil 。另外，可选值是未包装的，所有 "?" 之后的都作为未包装的值。在两种情况中，整个表达式的值是可选值。
let optionalSquare:Square? = Square(sideLength: 2.5, name: "optional square");
let sideLength = optionalSquare?.sideLength;

/*枚举*/
//使用 enum 来创建枚举。有如类和其他命名类型，枚举可以有方法。
enum Rank:Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    
    func simpleDescription() ->String{
        switch self{
            case .Ace: return "ace"
            case .Jack: return "jack"
            case .Queen: return "queen"
            case .King: return "king"
            default: return String(self.rawValue)
        }
    }
}

let ace = Rank.Jack
println(ace);
let aceRawValue = ace.rawValue;
println(aceRawValue);


enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades: return "Spades"
        case .Hearts: return "Hearts"
        case .Diamonds:return "Diamonds"
        case .Clubs:  return "Clubs"
        }
    }
}
let hearts = Suit.Spades //by gashero
println(hearts.hashValue);
let heartsDescription = hearts.simpleDescription()
println(heartsDescription);

//使用 struct 创建结构体。结构体支持多个与类相同的行为，包括方法和构造器。一大重要的区别是代码之间的传递总是用拷贝(值传递)，而类则是传递引用。
struct Card{
    var rank:Rank
    var suit:Suit
    func simpleDescription() -> String{
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .Three, suit: .Spades);
println(threeOfSpades.simpleDescription());


enum ServerResponse {
    case Result(String, String)
    case Error(String)
}
let serverResponse:String;
let success = ServerResponse.Result("6:00 am", "8:09 pm")
let failure = ServerResponse.Error("Out of cheese.")
switch success {
  case let .Result(sunrise, sunset):
        serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
   case let .Error(error):
        serverResponse = "Failure... \(error)"
}
println(serverResponse);

