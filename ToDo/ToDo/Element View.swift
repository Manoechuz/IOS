//
//  Element View.swift
//  ToDo
//
//  Created by Moshe Uzan on 04/07/2024.
//

import SwiftUI

struct Element_View: View {
    let element: Element
    var body: some View {
        VStack(alignment: .leading){
            Text(element.title)
                .font(.headline)
                .foregroundStyle(letterColor(for: element))
            Spacer()
            Text(element.contain)
                .foregroundStyle(letterColor(for: element))
        }
        .padding()
    }
    
    func letterColor(for: Element) -> Color{
        if element.isDone {
            return Color.white
        }
        else{
            return Color.black
        }
    }
}

#Preview {
    Element_View(element: Element.sampleData[0])
}
