//
//  DetailViewController.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 12/07/2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    var makeoverElements :MakeoverElement!
    
    
    @IBOutlet weak var productImageView: UIImageView!
    
    @IBOutlet weak var productName: UILabel!
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var priceNameLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateView()

        
    }
    
    private func populateView() {
        
            
        
        
        productImageView.kf.setImage(with: makeoverElements.imageLink.asUrl)
        productName.text =  makeoverElements.name
        
        Currency.allCases.forEach { _ in
        priceNameLabel.text = makeoverElements.currency?.rawValue
        }
        priceLabel.text = makeoverElements.price
        ratingLabel.text = makeoverElements.rating?.formatted()
        for index in 0..<makeoverElements.productColors.count {
            nameLabel.text = makeoverElements.productColors[index].colourName
            
        }
        
        
        
        
        descriptionLabel.text = makeoverElements.makeoverDescription
        
       
    }
    

    

}

