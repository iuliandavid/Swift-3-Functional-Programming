//: [Previous](@previous)

import Foundation

let content = "10,20,40,30,80,60"
func extractElements(content: String) -> [String] {
    return content.characters.split(",").map { String($0) }
}

let elements = extractElements(content)

func formatWithCurrency(content: [String]) -> [String] {
    return content.map {"\($0)$"}
}

let formattedElements = formatWithCurrency(elements)

let composedFunction = { data in formatWithCurrency(extractElements(data)) }

composedFunction(content)

// Composed function with custom operators

infix operator |> { associativity left }
func |> <T, V>(f: T -> V, g: V -> V ) -> T -> V {
    return { x in g(f(x)) }
}

let composedWithCustomOperator = extractElements |> formatWithCurrency
composedWithCustomOperator("10,20,40,30,80,60")


//: [Next](@next)