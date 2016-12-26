//
//  Food_Tracker_v3Tests.swift
//  Food Tracker v3Tests
//
//  Created by Minura Iddamalgoda on 25/12/16.
//  Copyright © 2016 Scheme17. All rights reserved.
//

import XCTest
@testable import Food_Tracker_v3

class Food_Tracker_v3Tests: XCTestCase {
    
    // MARK: Meal Class Tests
    
    // Confirm that the Meal initialiser returns a Meal obj. when passed 
    // valid params. 
    func testMealInitializationSucceeds(){
        // Zero rating test case
        let zeroRating = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRating)
        
        // Highest positive rating
        let positiveRating = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRating)
    }
    
    // Confirm that the Meal initialiser returns nil if passed an invalid param.
    func testMealInitializationFails(){
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
        
        // Empty string
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
        
    }
    
}
