//
//  Meal.swift
//  Food Tracker v3
//
//  Created by Minura Iddamalgoda on 26/12/16.
//  Copyright © 2016 Scheme17. All rights reserved.
//

import UIKit

class Meal {
    
    // MARK: Properties
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialisation
    init?(name: String, photo: UIImage?, rating: Int) {
        // Check for empty name
        guard !name.isEmpty else {
            return nil
        }
        
        // Check for rating between 0 and 5
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        self.name = name
        self.photo = photo
        self.rating = rating
        
    }
}

