//
//  HorizontalMenuCollectionView.swift
//  Weather Sim
//
//  Created by Иван Гаибов on 21.07.2024.
//

import Foundation
import UIKit

protocol SelectCollectionViewItemProtocol: AnyObject{
    func selectItem(index: IndexPath)
}

class HorizontalMenuCollectionView: UICollectionView {
    
    private let categoryLayout = UICollectionViewFlowLayout()
    
    private let nameCategoryArrayRussian = ["Ясно", "Облачно", "Дождь", "Гроза", "Мгла", "Туман", "Снег", "Град", "Ветренно", "Смерч"]
    private let nameCategoryArrayEnglish = ["Sun", "Cloudy", "Rain", "Storm", "Haze", "Foggy", "Snow", "Hail", "Windy", "Tornado"]
    
    var currentLanguage = "Russian"
    var nameCategoryArray: [String] { return currentLanguage == "Russian" ? nameCategoryArrayRussian : nameCategoryArrayEnglish}
    
    weak var cellDelegate: SelectCollectionViewItemProtocol?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: categoryLayout)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateLanguage(to language: String) {
            currentLanguage = language
            reloadData()
    }
    
    private func configure (){
        categoryLayout.minimumInteritemSpacing = 10
        categoryLayout.scrollDirection = .horizontal
        
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        
        delegate = self
        dataSource = self
        register(HorizontalMenuCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        selectItem(at: [0, 0], animated: true, scrollPosition: [])
    }
}
//MARK: - UICollectionViewDataSource

extension HorizontalMenuCollectionView: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameCategoryArrayRussian.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? HorizontalMenuCollectionViewCell else { return UICollectionViewCell() }
            cell.nameCategoryLabel.text = nameCategoryArray[indexPath.item]
            return cell
        }
}

//MARK: - UICollectionViewDelegate

extension HorizontalMenuCollectionView: UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        cellDelegate?.selectItem(index: indexPath)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension HorizontalMenuCollectionView: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let categoryFont = UIFont(name: "Arial Bold", size: 18)
        let categoryAttributs = [NSAttributedString.Key.font: categoryFont as Any]
        let categoryWidth = nameCategoryArrayRussian[indexPath.item].size(withAttributes: categoryAttributs).width + 20
        
        return CGSize(width: categoryWidth, height: collectionView.frame.height)
    }
}
