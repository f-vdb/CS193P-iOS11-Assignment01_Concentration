//
//  Card.swift
//  Lecture 2 - Concentration
//
//  Created by Michel Deiman on 13/11/2017.
//  Copyright © 2017 Michel Deiman. All rights reserved.
//

import Foundation

struct Card {
	var isFaceUp = false	{ didSet { if isFaceUp { isSeen = true } } }
	var isMatched = false
	var isSeen = false
	var identifier: Int
	
	private static var identifierFactory = 0
	
	static func getUniqueIdentifier() -> Int {
		identifierFactory += 1
		return identifierFactory
	}
	
	init() {
		self.identifier = Card.getUniqueIdentifier()
	}
}
