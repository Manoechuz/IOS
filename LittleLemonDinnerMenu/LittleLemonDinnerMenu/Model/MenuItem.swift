//
//  MenuItem.swift
//  LittleLemonDinnerMenu
//
//  Created by Moshe Uzan on 26/08/2024.
//

import Foundation

protocol MenuItemProtocol {
    var id: UUID {get}
    var price: Double {get}
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var ordersCount: Int { get set }
    var ingredient: [Ingredient] { get set }
}


struct MenuItem: MenuItemProtocol, Hashable, Identifiable {
    
    var id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var ordersCount: Int
    var ingredient: [Ingredient]
}
