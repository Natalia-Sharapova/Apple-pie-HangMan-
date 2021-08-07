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
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progress: UIProgressView!
    
    //MARK: Properties:
    
    var currentGame: GameApplePie!
    let incorrectMovesAllowed = 7
    var wordForCompare = ""
    
    var listOfTexsts = [
        "Байкал — самое большое пресноводное озеро в мире и самое глубокое. Его площадь — 31,7 тысяч кв. км, что чуть больше Бельгии. Глубина достигает 1642 м. В нём содержится четверть мировых запасов пресной воды. Вода в озере настолько чистая и прозрачная, что её можно пить. Озеро очень древнее, ему 25 млн лет.",
        "Озеро Танганьика - одно из самых длинных, глубоких и древних озер на Земле. Танганьика является вторым крупнейшим после Байкала пресноводным озером в мире. Площадь Танганьика составляет около 34 тыс. кв. м. Берега представляют отвесные скалы и только с восточной части берег пологий. Озеро испещрено бухтами и заливами. Танганьика с местного языка переводится, как Вода богатая рыбой. Рыбы в нем действительно много, как промысловой, так и экзотической.",
        "Уникальность озера Восток состоит в том, что оно много миллионов лет было изолировано от земной поверхности льдом. Размеры установлены приблизительно, поскольку ученые до этих пор не могут правильно измерить ширину и длину водоема. Возможная площадь озера – 15,5 тыс. кв.км. Глубина по предположениям ученых достигает 1,2 тыс. м. Толщина ледяного панциря над водоемом составляет 3,7 км.",
        "Каспийское море расположено на стыке двух частей Евразийского континента — Европы и Азии. Каспийское море по форме похоже на латинскую букву S, протяженность Каспийского моря с севера на юг — примерно 1200 километров. По одной из гипотез Каспийское море получило своё название в честь древних племен коневодов — каспиев, живших до нашей эры на юго-западном побережье Каспийского моря. За всю историю своего существования Каспийское море имело около 70 наименований у разных племён и народов",
        "Озеро Сан-Мартин — самое глубокое в Америке. И очень причудливых очертаний, похожее на растопыренную восьмипалую руку, что стало следствием грандиозных ледниковых процессов, тысячи лет назад охвативших юг Южной Америки. У озера еще одна особенность: оно поделено между двумя странами — Чили и Аргентиной. Оно четвертое по глубине в мире и самое глубокое из ледниковых: дно опускается до 836 м во впадине около ледника О'Хиггинс — одного из крупнейших на плато.",
        "Ньяса – озеро, находящееся на территории Восточной Африки.  Его протяженность составляет 578 километров, а размер максимальной глубины равен 712 метров. Озерные воды заполняют трещину в коре Земного шара в южной области Рифтовой Великой долины. Его поверхность над морем располагается на высоте 473 метра, а общий размер равен 30 645 километрам. На озерном дне находится большое количество осадочных пород.",
        "Иссык-Куль лежит на высоте 1609 м и поэтому относится к самым крупным горным озерам планеты. Однако, это не единственный рекорд киргизского озера. Иссык-Куль очень велик - длина водоема составляет 182 км, а ширина 58 км. По размерам он входит в 25 самых больших озер мира.Максимальная глубина природного водоема достигает 702 м, а средняя - 278 м. Озеро бессточное - в него впадает более восьми десятков небольших рек. Благодаря этому, озерная вода имеет чуть солоноватый вкус - ее минерализация составляет 5,9 ‰.",
        "Большое Невольничье озеро является вторым по величине водоемом, расположенным в Северо-Западных землях Канады. Также, по оценкам специалистов, оно занимает десятую ступень в списке самых крупных озер всего мира, так как площадь его водного бассейна достигает 28400 километров квадратных. Водоем был назван в честь проживающего на его берегах индийского племени «слейв», что в переводе означало «раб», но после детального изучения оказалось, что перевод был выполнен неправильно, но название озера уже никто не менял. озеро расположено на высоте около 156 метров над уровнем моря. Объем его водного бассейна достигает 2090 километров кубических, а наибольшая глубина – 614 метров. Озеро, длина которого составляет 480 километров, а ширина - 109 километров, насчитывает 3057 километров береговой линии, восточная и северная часть которой полностью укрыта тундрой. В зимнее время водоем покрыт льдом, который может выдержать несколько грузовиков.",
        "Кристальная чистота, невероятный синий цвет и множество легенд именно с этим ассоциируется кратерное озеро Крейтер. Более 7000 лет назад после разрушения стратовулкана Мазама сформировалась кальдера, которая и стала «матерью» невероятного водоема, входящего в сотни самых красивых озёр мира. После извержения, свидетелями которого стали предки индейцев, потоки лавы сформировали непроницаемую кальдеру, в которой и расположено озеро. Из-за полной изоляции и отсутствия притоков и истоков 18,7 км воды здесь появились благодаря таянию снегов и проливных дождей. Крейтер по праву считается одним из самых чистых на нашей планете. Ведь из средней глубины в 300 метров видимость составляет целых 35.",
        "В Аргентине это озеро называется Буэнос-Айрес (Lago Buenos Aires), а в Чили – Хенераль-Каррера (Lago General Carrera). Оба эти названия международно признаны. Это озеро занимает 11 место среди самых глубоких озер в мире. Максимальная глубина озера Буэнос-Айрес составляет 586 метров. Оно имеет площадь 1850 км2. Озеро Буэнос-Айрес расположено на высоте 217 метров над уровнем моря. Это озеро имеет ледниковое происхождение и окружено горными хребтами Анд. "
        
    ]
    
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
    ]
    
    var listOfWordsForCompare = [
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
    ]
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    //MARK: Methods
    
    func enabledButtons(enable: Bool = true) {
        for button in letterButton {
            button.isEnabled = enable
        }
    }
    
    func newRound() {
        guard !listOfWords.isEmpty else {
            enabledButtons(enable: false)
            updateUI()
            return
        }
        
        infoButton.isHidden = true
        let newWord = listOfWords.removeFirst()
        currentGame = GameApplePie(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed)
        updateUI()
        enabledButtons()
    }
    
    func updateWordLabel () {
        var displayWord = [String]()
        for letter in currentGame.guessedWord {
            displayWord.append(String(letter))
        }
        correctWordLabel.text = displayWord.joined(separator: " ")
    }
    
    func updateState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
            infoButton.isHidden = true
            progress.progress += 1 / 10
        } else if currentGame.guessedWord == currentGame.word && currentGame.guessedWord != listOfWordsForCompare[9] {
            wordForCompare = currentGame.guessedWord
            totalWins += 1
            infoButton.isHidden = false
            progress.progress += 1 / 10
        } else if currentGame.guessedWord == currentGame.word && currentGame.guessedWord == listOfWordsForCompare[9] {
            wordForCompare = currentGame.guessedWord
            totalWins += 1
            infoButton.isHidden = false
            progress.progress += 1 / 10
        }
        updateUI()
    }
    
    func updateUI() {
        let movesRemaining = currentGame.incorrectMovesRemaining
        let imageNumber = (movesRemaining + 64) % 8
        let image = "palm_\(imageNumber)"
        palmImageView.image = UIImage(named: image)
        updateWordLabel()
        scoreLabel.text = "Выигрыши: \(totalWins), проигрыши: \(totalLosses)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        infoButton.isHidden = true
        progress.setProgress(0, animated: false)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInfo" {
            let destination = segue.destination as! infoViewController
            for (index, word) in listOfWordsForCompare.enumerated() {
                
                if word == wordForCompare && word != listOfWordsForCompare[9] {
                    destination.infoImage = UIImage(named: "lake \(index)")!
                    destination.infoText = listOfTexsts[index]
                }
                
                if word == wordForCompare && word == listOfWordsForCompare[9] {
                    destination.infoImage = UIImage(named: "lake 9")!
                    destination.infoText = listOfTexsts[9]
                }
            }
        }
    }
    
    //MARK: IB - Action:
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letter = sender.title(for: .normal)!
        currentGame.playerGuessed(letter: Character(letter))
        updateState()
    }
}

