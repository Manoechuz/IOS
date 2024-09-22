//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Moshe Uzan on 19/05/2024.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
