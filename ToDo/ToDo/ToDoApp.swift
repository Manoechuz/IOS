//
//  ToDoApp.swift
//  ToDo
//
//  Created by Moshe Uzan on 04/07/2024.
//

import SwiftUI

@main
struct ToDoApp: App {
    @State private var elements: [Element] = Element.emptyElement
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
