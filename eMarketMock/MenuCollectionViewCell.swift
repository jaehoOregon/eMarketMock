//
//  MenuCollectionViewCell.swift
//  eMarketMock
//
//  Created by Jaeho Jung on 2022/09/19.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    
    func setup(_ item: listItem) {
        menuImage.image = UIImage(named: item.image)
        menuLabel.text = item.title
    }        
}
