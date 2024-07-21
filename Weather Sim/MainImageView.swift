//
//  MainImageView.swift
//  Weather Sim
//
//  Created by Иван Гаибов on 20.07.2024.
//

import Foundation
import UIKit

class MainImageView: UIImageView {
    
    override init (image: UIImage?){
        super.init(image: image)
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
