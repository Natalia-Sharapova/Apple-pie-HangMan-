//
//  ViewController.swift
//  Apple pie
//
//  Created by Наталья Шарапова on 29.07.2021.
//

import UIKit

class ViewController: UIViewController {

    
    //MARK: IB - Outlets:
    
    @IBOutlet weak var palmImageView: UIImageView!
    @IBOutlet var letterButton: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    //MARK: Properties:
    
    var currentGame: GameApplePie!
    let incorrectMovesAllowed = 7
    var listOfWords = [
        "Байкал",
        "Танганьика",
        "Восток",
        "Каспийское",
        "Сан-Мартин",
        "Ньяса",
        "Иссык-Куль",
        "Невольничье",
        "Крейтер",
        "Буэнос-Айрес",
            "Матана",
        "Хорниндалсватнет",
        "Cалезское",
            "Тоба",
        "Тахо",
        "Лаго-Архентино",
        "Шелан",
        "Салсваннет",
        "Киву",
        "Квеснел",
        "Мьёса",
        "Хауроко",
        "Тиншё",
        "Адамс-Лейк",
        "Ван",
        "Посо"]
    
    var totalWins = 0
    var totalLosses = 0
    
    //MARK: Methods
    
    func newRound() {
        let newWord = listOfWords.removeFirst()
    currentGame = GameApplePie(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
    }
    
    func updateWordLabel () {
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
        
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = (movesRemaining + 64) % 8
            //movesRemaining < 0 ? 0 : movesRemaining < 8 ? movesRemaining : 7
        let image = "Palm \(imageNumber)"
        palmImageView.image = UIImage(named: image)
        updateWordLabel()
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
    }

    
    
//MARK: IB - Action:
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
      let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateUI()
    }
}

