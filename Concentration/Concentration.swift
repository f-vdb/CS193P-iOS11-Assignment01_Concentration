//
//  Concentration.swift
//  Lecture 2 - Concentration
//
//  Created by Michel Deiman on 13/11/2017.
//  Copyright © 2017 Michel Deiman. All rights reserved.
//

import Foundation

class Concentration {
	
	var cards = [Card]()
	var indexOfOneAndOnlyFaceUpCard: Int?
	var score = 0
	var flipCount = 0
	
	func chooseCard(at index: Int) {
		if !cards[index].isMatched {
			if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
				// check if cards match
				if cards[matchIndex].identifier == cards[index].identifier {
					cards[matchIndex].isMatched = true
					cards[index].isMatched = true
					score += 2
				} else {
					if cards[index].wasFaceUp {
						score -= 1
					}
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = nil	// not one and only ...
			} else {
				// either no card or two cards face up
				for flipdownIndex in cards.indices {
					cards[flipdownIndex].isFaceUp = false
				}
				cards[index].isFaceUp = true
				indexOfOneAndOnlyFaceUpCard = index
			}
		}
		flipCount += 1
	}
	
	init(numberOfPairsOfCards: Int) {
		var unShuffeldCards: [Card] = []
		for _ in 1...numberOfPairsOfCards {
			let card = Card()
			unShuffeldCards += [card, card]
		}
	//	TODO: Shuffle the cards
		while !unShuffeldCards.isEmpty {
			let randomIndex = unShuffeldCards.count.arc4Random
			let card = unShuffeldCards.remove(at: randomIndex)
			cards.append(card)
		}
	}
	
}
