//
//  CreatTask.swift
//  ToDo
//
//  Created by Moshe Uzan on 09/07/2024.
//

import SwiftUI

struct CreatTask: View {
    @Binding var element: Element
    
    var body: some View {
        List{
            Section(header: Text("New Task")){
                TextField("Enter a Title", text: $element.title)
                TextField("Enter the Description", text: $element.contain)
            }
            
        }
    }
}

#Preview {
    CreatTask(element: .constant(Element.sampleData[0]))
}
