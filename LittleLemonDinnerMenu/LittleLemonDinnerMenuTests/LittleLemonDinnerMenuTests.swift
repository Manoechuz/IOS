//
//  LittleLemonDinnerMenuTests.swift
//  LittleLemonDinnerMenuTests
//
//  Created by Moshe Uzan on 18/07/2024.
//

import XCTest
@testable import LittleLemonDinnerMenu

final class LittleLemonDinnerMenuTests: XCTestCase {
    
    let viewModel = MenuViewViewModel()

    func testCheckInitTitle(){
        let food = viewModel.foods[0]
        XCTAssertEqual(food.title, "Food 1")
    }
    
    func testCheckInitIngredient(){
        let food = viewModel.foods[0]
        XCTAssertEqual(food.ingredient, [.tomatoSauce])
    }

}
