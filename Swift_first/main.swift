//
//  main.swift
//  Swift_first
//
//  Created by 四三一八 on 15/6/10.
//  Copyright (c) 2015年 4318. All rights reserved.
//

import Foundation

/*定义常量*/
var first = 40;
first = 50;
/*定义变量*/
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
let age:Float = 30;
let showText = "I am \(age), do you know ?";

/*数组*/
var shoppingList = ["catfish","water","tulips"];
shoppingList[1] = "bottle of water";
/*字典*/
var occupations = ["Malcolm":"Captain","Kayles":"Mechanic"];
occupations["Jayne"] = "Public Relations";

let emptyArray = Array<String>();
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

