//
//  PokeCard.swift
//  PokeCard
//
//  Created by Jadië Oliveira on 25/10/23.
//

import Foundation
// MARK: - Cards
struct Cards: Codable {
	var cards: [Card]?
}

// MARK: - Card
struct Card: Codable {
	var id, name: String?
	var nationalPokedexNumber: Int?
	var imageURL, imageURLHiRes: String?
	var types: [RetreatCost]?
	var supertype: Supertype?
	var subtype, evolvesFrom, hp, number: String?
	var artist, rarity: String?
	var series: Series?
	var cardSet, setCode: String?
	var attacks: [Attack]?
	var weaknesses: [Resistance]?
	var retreatCost: [RetreatCost]?
	var convertedRetreatCost: Int?
	var resistances: [Resistance]?
	var text: [String]?
	var ability: Ability?

	enum CodingKeys: String, CodingKey {
		case id, name, nationalPokedexNumber
		case imageURL = "imageUrl"
		case imageURLHiRes = "imageUrlHiRes"
		case types, supertype, subtype, evolvesFrom, hp, number, artist, rarity, series
		case cardSet = "set"
		case setCode, attacks, weaknesses, retreatCost, convertedRetreatCost, resistances, text, ability
	}
}

// MARK: - Ability
struct Ability: Codable {
	var name, text: String?
	var type: TypeEnum?
}

enum TypeEnum: String, Codable {
	case ability = "Ability"
	case pokéBody = "Poké-Body"
	case pokéPower = "Poké-Power"
}

// MARK: - Attack
struct Attack: Codable {
	var cost: [RetreatCost]?
	var name, text, damage: String?
	var convertedEnergyCost: Int?
}

enum RetreatCost: String, Codable {
	case colorless = "Colorless"
	case darkness = "Darkness"
	case fairy = "Fairy"
	case fighting = "Fighting"
	case fire = "Fire"
	case free = "Free"
	case grass = "Grass"
	case lightning = "Lightning"
	case metal = "Metal"
	case psychic = "Psychic"
	case water = "Water"
}

// MARK: - Resistance
struct Resistance: Codable {
	var type: RetreatCost?
	var value: String?
}

enum Series: String, Codable {
	case base = "Base"
	case blackWhite = "Black & White"
	case diamondPearl = "Diamond & Pearl"
	case ex = "EX"
	case heartGoldSoulSilver = "HeartGold & SoulSilver"
	case platinum = "Platinum"
	case sunMoon = "Sun & Moon"
	case swordShield = "Sword & Shield"
	case xy = "XY"
}

enum Supertype: String, Codable {
	case energy = "Energy"
	case pokémon = "Pokémon"
	case trainer = "Trainer"
}
