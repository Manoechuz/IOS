//
//  PersistenceController.swift
//  ToDo
//
//  Created by Moshe Uzan on 09/07/2024.
//

import Foundation

class PersistenceController: ObservableObject {
    @Published var elements: [Element] = [] {
        didSet {
            saveElements()
        }
    }
    
    init() {
        loadElements()
    }
    
    private func saveElements() {
        if let encoded = try? JSONEncoder().encode(elements) {
            UserDefaults.standard.set(encoded, forKey: "elements")
        }
    }
    
    private func loadElements() {
        if let savedData = UserDefaults.standard.data(forKey: "elements"),
           let decodedElements = try? JSONDecoder().decode([Element].self, from: savedData) {
            elements = decodedElements
        } else {
            elements = Element.emptyElement
        }
    }
}
