//
//  MenuItemsOptionView.swift
//  LittleLemonDinnerMenu
//
//  Created by Moshe Uzan on 21/08/2024.
//

import SwiftUI

struct MenuItemsOptionView: View {
    
    @EnvironmentObject var viewModel: MenuViewViewModel
    
    var body: some View {
        NavigationStack{
            List{
                Section(header: Text("Selected Categories")){
                    OptionRow(title: MenuCategory.food.rawValue, isSelected: $viewModel.isShowFood)
                    OptionRow(title: MenuCategory.drink.rawValue, isSelected: $viewModel.isShowDrinks)
                    OptionRow(title: MenuCategory.dessert.rawValue, isSelected: $viewModel.isShowDesserts)
                }
                
                Picker("Sort by", selection: $viewModel.sortBy) {
                    ForEach(SortBy.allCases, id: \.self) { category in
                        Text(category.rawValue).tag(category)
                    }
                }
            }
            .pickerStyle(.inline)
        }
        .navigationTitle("Filter")
    }
    
    
    struct OptionRow: View {
        let title: String
        @Binding var isSelected: Bool
        
        var body: some View {
            HStack {
                Button(action: {
                    isSelected.toggle()
                }) {
                    Text(title)
                        .foregroundColor(.black)
                }
                Spacer()
                if isSelected {
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

#Preview {
    MenuItemsOptionView().environmentObject(MenuViewViewModel())
}
