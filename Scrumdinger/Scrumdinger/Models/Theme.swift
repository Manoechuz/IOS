//
//  Theme.swift
//  Scrumdinger
//
//  Created by Moshe Uzan on 29/05/2024.
//

import Foundation
import SwiftUI

enum Theme: String, CaseIterable, Identifiable {
    case bubblegum
    case buttercup
    case indigo
    case lavender
    case magenta
    case navy
    case orange
    case oxblood
    case periwinkle
    case poppy
    case purple
    case seafoam
    case sky
    case tan
    case teal
    case yellow
    
    var mainColor: Color {
            switch self {
            case .bubblegum:
                return Color.pink
            case .buttercup:
                return Color.yellow
            case .indigo:
                return Color.indigo
            case .lavender:
                return Color.purple
            case .magenta:
                return Color.red
            case .navy:
                return Color.blue
            case .orange:
                return Color.orange
            case .oxblood:
                return Color.red
            case .periwinkle:
                return Color.blue
            case .poppy:
                return Color.red
            case .purple:
                return Color.purple
            case .seafoam:
                return Color.green
            case .sky:
                return Color.blue
            case .tan:
                return Color.brown
            case .teal:
                return Color.teal
            case .yellow:
                return Color.yellow
            }
        }
    
    var accentColor: Color {
            switch self {
            case .bubblegum, .buttercup, .lavender, .orange, .periwinkle, .poppy, .seafoam, .sky, .tan, .teal, .yellow : return .black
            case .indigo, .magenta, .navy, .oxblood, .purple: return .white
        }
    }
    
    
    
    var name: String {
        rawValue.capitalized
    }
    
    var id: String {
            name
    }
}
