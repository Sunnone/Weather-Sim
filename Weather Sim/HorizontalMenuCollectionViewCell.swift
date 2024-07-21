//
//  HorizontalMenuCollectionViewCell.swift
//  Weather Sim
//
//  Created by Иван Гаибов on 21.07.2024.
//

import Foundation
import UIKit

class HorizontalMenuCollectionViewCell: UICollectionViewCell{
    //Параметры текста ячейки
    let nameCategoryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = UIFont(name: "Arial Bold", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    //Параметры ячейки
    private func setupViews(){
        backgroundColor = .black
        layer.cornerRadius = 10
        
        addSubview(nameCategoryLabel)
    }
    //Позиционирование текста в ячейке
    private func setConstraints(){
        NSLayoutConstraint.activate([
            nameCategoryLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameCategoryLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
