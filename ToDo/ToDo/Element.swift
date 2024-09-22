//
//  Element.swift
//  ToDo
//
//  Created by Moshe Uzan on 04/07/2024.
//

import Foundation

struct Element: Identifiable, Codable {
    let id: UUID
    var title: String
    var contain: String
    var isDone: Bool
    
    init(id: UUID = UUID(), title: String, contain: String, isDone: Bool) {
        self.id = id
        self.title = title
        self.contain = contain
        self.isDone = isDone
    }
}

extension Element{
    static var emptyElement: [Element]{
        [Element(title: "Task", contain: "Do...", isDone: false)]
    }
}

extension Element {
    static let sampleData: [Element] =
        [
            Element(
                title: "Cuisiner",
                contain: "Il faut que j'aille cuisiner de la marmoma",
                isDone: false
            ),
            Element(
                title: "Acheter un cadeau",
                contain: "Il faut que j'achete un cadeau a ma femme",
                isDone: false
            )
        ]
}
