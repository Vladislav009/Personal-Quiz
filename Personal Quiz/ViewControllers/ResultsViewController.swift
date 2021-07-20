//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet weak var resultTitleLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    
    var userAnswers: [Answer]!
    var typeAnimals: [AnimalType] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        calculateResult()
    }
}

extension ResultsViewController {
    private func setUpUI() {
        navigationItem.setHidesBackButton(true, animated: true)
    }
    
    private func calculateResult(){
        if let answers = userAnswers {
            for answer in answers {
                typeAnimals.append(answer.type)
            }
        }
        
        let dups = Dictionary(grouping: typeAnimals, by: {$0}).filter { $1.count > 1 }.keys
        
        if let resultTitle = dups.first {
            resultTitleLabel.text = "Вы - \(resultTitle.rawValue)!"
            resultDescriptionLabel.text = resultTitle.definition
        }
    }
}
