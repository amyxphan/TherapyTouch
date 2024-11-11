//
//  QuoteGenerator.swift
//  TherapyTouch
//
//  Created by Amy Phan on 11/8/24.
//
import SwiftUI

struct Quote {
    let text: String
    let author: String
}

struct QuoteGenerator {
    //will need to automate this and make categories
    private let quotes = [
        Quote(text: "The only limit to our realization of tomorrow is our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(text: "The best way to predict the future is to invent it.", author: "Alan Kay"),
        Quote(text: "Life is 10% what happens to us and 90% how we react to it.", author: "Charles R. Swindoll"),
        Quote(text: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
    ]
    
    func getRandomQuote() -> Quote {
        return quotes.randomElement() ?? Quote(text: "No quote available", author: "")
    }
}
