//
//  ViewController.swift
//  Weather Sim
//
//  Created by Иван Гаибов on 18.07.2024.
//

import Foundation
import UIKit
import ImageIO

class ViewController: UIViewController {
    private var toggleButton: CustomToggleButton!
    private let mainImageView = MainImageView(image: UIImage(named: "sun"))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Переключатель языка
        setupToggleButton()
        setupViews()
        setConstraints()

        }
   
        
    private func setupViews (){
        //view.backgroundColor = .backgroundColor
        
        view.addSubview(mainImageView)
    }
    
    //MARK: - Свойства кнопки локализации
    private func setupToggleButton() {
            toggleButton = CustomToggleButton()
            toggleButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(toggleButton)

            let guide = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                toggleButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 20),  // Отступ слева
                toggleButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20)    // Отступ снизу
            ])
        NSLayoutConstraint.activate([
                   toggleButton.widthAnchor.constraint(equalToConstant: 45),
                   toggleButton.heightAnchor.constraint(equalToConstant: 30)
               ])
    
    }
}
       
extension ViewController {
    private func setConstraints(){
        NSLayoutConstraint.activate([
            mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            mainImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150)
        ])
    }
}
       
    

