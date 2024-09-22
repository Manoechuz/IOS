//
//  ContentView.swift
//  ToDo
//
//  Created by Moshe Uzan on 04/07/2024.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var persistenceController = PersistenceController()
    
    @State private var editingElement = Element(title: "", contain: "", isDone: false)
    @State private var isPresentingEditView = false
    
    var body: some View {
        VStack {
            NavigationStack{
                List{
                    if persistenceController.elements.isEmpty {
                        Text("No Current Task(s)")
                            .foregroundColor(.blue)
                            .padding()
                    }
                    else{
                        ForEach(persistenceController.elements.sorted { !$0.isDone && $1.isDone }) {element in
                            
                            Element_View(element: element)
                                .contextMenu {
                                    NavigationLink(destination: DetailElement(element: binding(for: element))){
                                        Label("Edit", systemImage: "pencil")
                                    }
                                }
                                .swipeActions(edge: .trailing){
                                    Button{
                                        withAnimation{
                                            toggleElementDone(element: element)
                                        }
                                        
                                    }
                                    label: {
                                        Label("Done", systemImage: "checkmark.circle.fill")
                                    }
                                    .tint(.blue)
                                }
                            
                                .swipeActions(edge: .leading){
                                    Button{
                                        withAnimation{
                                            deleteElement(element)
                                        }
                                    }
                                label: {
                                    Label("Delete", systemImage: "trash.circle.fill")
                                }
                                .tint(.red)
                                }
                        .listRowBackground(element.isDone ? Color.green : Color.white)
                        }
                        
                    }
                    
                }
                .navigationTitle("To-Do List")
                
                .toolbar{
                    Button(action: {
                        isPresentingEditView = true
                    }){
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $isPresentingEditView ){
                    NavigationStack{
                        CreatTask(element: $editingElement)
                            .navigationTitle("Add Task")
                            .toolbar {
                                ToolbarItem(placement: .cancellationAction) {
                                    Button("Cancel") {
                                        isPresentingEditView = false
                                        editingElement = Element(title: "", contain: "", isDone: false)
                                    }
                                }
                                ToolbarItem(placement: .confirmationAction) {
                                    Button("Create") {
                                        if editingElement.title == "" && editingElement.contain == ""{
                                            
                                        }
                                        else{
                                            isPresentingEditView = false
                                            
                                            persistenceController.elements.append(editingElement)
                                            editingElement = Element(title: "", contain: "", isDone: false)
                                        }
                                    }
                                }
                            }
                    }
                }
            }
        }
    }

    private func deleteElement(at offsets: IndexSet) {
        persistenceController.elements.remove(atOffsets: offsets)
    }
    private func deleteElement(_ element: Element) {
        if let index = persistenceController.elements.firstIndex(where: { $0.id == element.id }) {
            persistenceController.elements.remove(at: index)
        }
    }
    private func binding(for element: Element) -> Binding<Element> {
        guard let index = persistenceController.elements.firstIndex(where: { $0.id == element.id }) else {
            fatalError("Element not found")
        }
        return $persistenceController.elements[index]
    }
    
    private func toggleElementDone(element: Element) {
            if let index = persistenceController.elements.firstIndex(where: { $0.id == element.id }) {
                persistenceController.elements[index].isDone.toggle()
            }
        }
}

#Preview {
    ContentView()
}
