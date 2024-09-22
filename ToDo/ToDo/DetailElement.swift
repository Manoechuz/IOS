//
//  DetailElement.swift
//  ToDo
//
//  Created by Moshe Uzan on 04/07/2024.
//

import SwiftUI

struct DetailElement: View {

    @Binding var element: Element
    
    @State private var buttonValue: String = "checkmark.circle.fill"
    var body: some View {
        List{
            Section(header: Text("Task")){
                TextField("Title", text: $element.title)
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                TextField("Description", text: $element.contain)
            }
        }
    }
}

#Preview {
    DetailElement(element: .constant(Element.sampleData[0]))
}
