//
//  CardModel.swift
//  MagicTheGatheringTestApp
//
//  Created by Noel H. Yusta on 5/4/24.
//

import Foundation


// Modelo para representar una carta individual

class Card: Codable {
    let name: String?
    let type :String?
    let imageUrl: URL?
    let rarity: String?
    let text: String?
    
  
    init(name: String?, type: String?, imageUrl: URL?, rarity: String?, text: String?) {
        self.name = name
        self.type = type
        self.imageUrl = imageUrl
        self.rarity = rarity
        self.text = text
    }
}

// Modelo para representar la respuesta de la API que contiene una lista de cartas

class CardResponse: Codable {
    let cards: [Card]
}
