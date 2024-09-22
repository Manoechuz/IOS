//
//  elementDetails.swift
//  LittleLemonDinnerMenu
//
//  Created by Moshe Uzan on 21/08/2024.
//

import SwiftUI

struct MenuItemDetailsView: View {
    
    var menuItem: MenuItem
    
    var body: some View {
        VStack{
            Image("LittleLemonLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 900, height: 450)
            Text("Price:")
                .bold()
            Text(String(format: "%.2f", menuItem.price))
            Text("Ordered:")
                .bold()
            Text("\(menuItem.ordersCount)")
            Text("Ingredients:")
                .bold()
            ForEach(menuItem.ingredient, id: \.self) {
                Text($0.rawValue)
            }
            
        }
        .navigationTitle(menuItem.title)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let menuItem = MenuItem(price: 12, title: "Food 1", menuCategory: .food, ordersCount: 15, ingredient: [.tomatoSauce])
        MenuItemDetailsView(menuItem: menuItem)
    }
}
