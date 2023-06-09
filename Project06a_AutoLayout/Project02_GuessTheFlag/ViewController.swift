import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!

    var countries = [String]()
    var score = 0
    var questionAnswered = 0
    var correctAnswer = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(showScore))

        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1

        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion()
    }

    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)

        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)

        title = "Score \(score), Choose: " + countries[correctAnswer].uppercased() + "'s flag"
    }

    func restartGame(action: UIAlertAction!) {
        score = 0
        correctAnswer = 0
        questionAnswered = 0

        askQuestion(action: nil)
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var message: String

        if sender.tag == correctAnswer {
            score += 1
            questionAnswered += 1
            if questionAnswered == 5 {
                title = "Game over"
                message = "You have answered 5 questions! \n Your score is \(score)"
            } else {
                title = "Correct"
                message = "Your score is \(score)"
            }
        } else {
            score -= 1
            questionAnswered += 1
            if questionAnswered == 5 {
                title = "Game over"
                message = "You have answered 5 questions! \n Your score is \(score)"
            } else {
                title = "Wrong"
                message = """
                Your score is \(score)
                That is the flag of: \(countries[sender.tag].uppercased())
                """
            }
        }

        let ac = UIAlertController(title: title, message: message , preferredStyle: .alert)
        if title != "Game over" {
            ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        } else {
            ac.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartGame))
        }
        present(ac, animated: true)
    }

    @objc func showScore() {
        let vc = UIActivityViewController(activityItems: ["Score: \(score)"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

