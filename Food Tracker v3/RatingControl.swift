//
//  RatingControl.swift
//  Food Tracker v3
//
//  Created by Minura Iddamalgoda on 25/12/16.
//  Copyright © 2016 Scheme17. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0

    // MARK: Initialisation
    override init(frame: CGRect) {
        super.init(frame: frame)
        setuoButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setuoButtons()
    }
    
    // MARK: Private Methods
    private func setuoButtons(){
        for _ in 0..<5 {
            // Create button
            let button = UIButton()
            button.backgroundColor = UIColor.red
            
            // Adding constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
            button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
            
            // Setup the action button
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonPressed(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
        }
    }
    
    // MARK: Button Action
    func ratingButtonPressed(button: UIButton) {
        print("button pressed")
    }

}
