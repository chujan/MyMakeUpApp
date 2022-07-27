//
//  TableViewCell.swift
//  MyMakeUpApp
//
//  Created by Jennifer Chukwuemeka on 28/06/2022.
//

import UIKit
import Kingfisher

class TableViewCell: UITableViewCell {
    static let identifier = String(describing: TableViewCell.self)

    
    @IBOutlet weak var makeupImageView: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var brandLabel: UILabel!
    
    func setup(makeups: MakeoverElement) {
        makeupImageView.kf.setImage(with: makeups.imageLink.asUrl)
        nameLabel.text = makeups.name
        brandLabel.text = makeups.brand
        
    }
    
}
