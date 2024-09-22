//
//  MenuItemsView.swift
//  LittleLemonDinnerMenu
//
//  Created by Moshe Uzan on 18/07/2024.
//

import SwiftUI


struct MenuItemsView: View {
    @State var isPresentingEditView: Bool = false
    
    @StateObject private var viewModel = MenuViewViewModel()
    
    
    var body: some View {
        
        NavigationStack{
            
            ScrollView{
                if viewModel.isShowFood {
                    MenuItemView(menuItems: viewModel.foods, menuCategory: .food).environmentObject(viewModel)
                }
                if viewModel.isShowDrinks {
                    MenuItemView(menuItems: viewModel.drinks, menuCategory: .drink).environmentObject(viewModel)
                }
                if viewModel.isShowDesserts {
                    MenuItemView(menuItems: viewModel.desserts, menuCategory: .dessert).environmentObject(viewModel)
                }
            }
            .onAppear() {
                viewModel.updateMenuItems()
            }
            .navigationTitle("Menu")
            .toolbar{
                Button(action: {
                    isPresentingEditView = true
                }){
                    Image(systemName: "slider.horizontal.3")
                }
            }
            .sheet(isPresented: $isPresentingEditView ){
                NavigationStack{
                    MenuItemsOptionView().environmentObject(viewModel)
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") {
                                    viewModel.updateMenuItems()
                                    isPresentingEditView = false
                            }
                        }
                    }
                }
            }
        }
        
    }
}

#Preview {
    MenuItemsView()
}

