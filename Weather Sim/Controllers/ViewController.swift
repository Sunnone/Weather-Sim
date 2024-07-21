//
//  ViewController.swift
//  Weather Sim
//
//  Created by Иван Гаибов on 18.07.2024.
//

import Foundation
import UIKit
import ImageIO

class ViewController: UIViewController, LanguageToggleDelegate{
    private let imageNames = ["sun", "cloudy", "rain", "storm", "haze", "foggy", "foggy", "snow", "hail", "windy", "tornado"]
    private var toggleButton: CustomToggleButton!
    private var mainImageView = MainImageView(image: UIImage(named: "sun"))
    private let horizontalMenCollectionView = HorizontalMenuCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Переключатель языка
        setupToggleButton()
        //Рандомное изображение в начале
        showRandomImage()
        //Отображение Селектора
        setupViews()
        //Отображение Констретов
        setConstraints()
    }
   
    //MARK: - Функция выбора случайной погоды при старте
    func showRandomImage() {
        let randomIndex = Int.random(in: 0..<imageNames.count)
        let selectedImageName = imageNames[randomIndex]
        mainImageView.image = UIImage(named: selectedImageName)
        }
        
    private func setupViews (){
        view.addSubview(mainImageView)
        view.addSubview(horizontalMenCollectionView)
        horizontalMenCollectionView.cellDelegate = self
    }
    
    //MARK: - Свойства кнопки локализации
    private func setupToggleButton() {
        toggleButton = CustomToggleButton()
        toggleButton.translatesAutoresizingMaskIntoConstraints = false
        toggleButton.delegate = self
        view.addSubview(toggleButton)
        
        NSLayoutConstraint.activate([
            toggleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),  //Отступ слева
            toggleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
                // Отступ снизу
        ])
        NSLayoutConstraint.activate([
            toggleButton.widthAnchor.constraint(equalToConstant: 45),
            toggleButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func languageDidToggle(to language: String) {
        horizontalMenCollectionView.updateLanguage(to: language)
        }
}
//MARK: - Перелистывание погоды с анимацией
extension ViewController: SelectCollectionViewItemProtocol {
    func selectItem(index: IndexPath) {
        var imageName = "sun"
        switch index.item {
            case 0: imageName = "sun"
            case 1: imageName = "cloudy"
            case 2: imageName = "rain"
            case 3: imageName = "storm"
            case 4: imageName = "haze"
            case 5: imageName = "foggy"
            case 6: imageName = "snow"
            case 7: imageName = "hail"
            case 8: imageName = "windy"
            case 9: imageName = "tornado"
            default:
            mainImageView.image = UIImage(named: "sun")
        }
        if let nextImage = UIImage(named: imageName) {
            UIView.transition(with: mainImageView, duration: 0.4, options: .transitionFlipFromLeft, animations: { self.mainImageView.image = nextImage }, completion: nil)
        }
    }
}

//MARK: - Констрейты меню и изображения
extension ViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            horizontalMenCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            horizontalMenCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            horizontalMenCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            horizontalMenCollectionView.heightAnchor.constraint(equalToConstant: 40),
            
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20)
        ])
    }
}
       
    

