//
//  PreviewNameCollectionViewCell.swift
//  christmasChill
//
//  Created by Darryl Bayliss on 29/11/2016.
//  Copyright © 2016 Darryl Bayliss. All rights reserved.
//

import UIKit

class PreviewNameCollectionViewCell : UICollectionViewCell {
    
    @IBOutlet weak var image: UIImageView!
    
    public func configureCell(content : Content) {

        image.image = content.image
    }
}
