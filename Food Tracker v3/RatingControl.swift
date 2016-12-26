//
//  RatingControl.swift
//  Food Tracker v3
//
//  Created by Minura Iddamalgoda on 25/12/16.
//  Copyright © 2016 Scheme17. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    // MARK: Properties
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        // Calls updateButtonSelectionStates() whenver the rating var changes
        didSet{
            updateButtonSelectionStates()
        }
    }
    
    @IBInspectable var starSize: CGSize = CGSize(width: 44.0, height:44.0){
        didSet{
            setuoButtons()
        }
    }
    
    @IBInspectable var starCount: Int = 5{
        didSet{
            setuoButtons()
        }
    }
    
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
        
        // Clear any existing buttons and clear ratingButtons arr
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        // Load Button Images
        let bundle = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        // For loop to create five buttons using starSize variables
        for index in 0..<starCount {
            // Create button
            let button = UIButton()
            
            // Set button images
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted, .selected])
            
            // Adding constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive = true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive = true
            
            // Set the accessibility label
            button.accessibilityLabel = "Set \(index + 1) star rating"
            
            // Setup the action button
            button.addTarget(self, action:
                #selector(RatingControl.ratingButtonPressed(button:)), for: .touchUpInside)
            
            // Add the button to the stack
            addArrangedSubview(button)
            
            // Add the new button to the ratingButtons arr
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    // MARK: Button Action
    func ratingButtonPressed(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button \(button) is not in the array")
        }
        
        // Number of stars = the index in the array + 1
        let selectedRating = index + 1
        
        if selectedRating == rating {
            // If the selected star represents the current rating, reset the
            // rating to 0
            rating = 0
            
        } else {
            // Otherwise, set the rating to the selected star
            rating = selectedRating
        }
        print("star number \(index) tapped")
    }
    
    private func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerated() {
            // Highlights the buttons to the left of the selected rating
            button.isSelected = index < rating
            
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero"
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set"
            case 1:
                valueString = "1 star set"
            default:
                valueString = "\(rating) stars set"
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}
