//
//  ViewController.swift
//  FourthHomeWork
//
//  Created by Евгений Шевченко on 23.10.2020.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // Понимаю что экземпляру модели здесь не место. Мозг уже отказал.
    let user = User(
        name: "Sheva",
        password: "2020",
        fullName: "Evgeniy Shevchenko",
        aboutUser:  """
                       О себе пару слов. Мне 24, бывший спортсмен. После того как со спортом не удалось,
                       решил потрудится на пользу государства. Понял что это шляпа ещё та. Так как с детсвта
                       интересовался компьютерами (железом) захотелось создавать ПО на IOS.
                       Теперь я здесь. И ещё не могу понять почему картинка не кгрулая 😔
                    """,
        plans: """
                  Мои планы на будущие это получить хорошие знания с
                  помощью лучшего преподователя Алексея 🤣
               """
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientForView()
        configureTextFields()
    }
    
    // MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabBarController = segue.destination as! UITabBarController
        
        let welcomeVC = tabBarController.viewControllers?.first as! WelcomeViewController
        welcomeVC.userName = user.name
        
        let aboutVC = tabBarController.viewControllers?[1] as! AboutMeViewController
        aboutVC.newAboutMe = user.aboutUser
        
        let navcont = tabBarController.viewControllers?.last as! UINavigationController
        let plansVC = navcont.viewControllers.first as! PlansViewController
        plansVC.fullName = user.fullName
        plansVC.plans = user.plans
    }
    
    // MARK: TouchesBegan
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    // MARK: LogInButtonAction
    @IBAction func logInAction() {
        
        guard userNameTextField.text != "" else {
            showAlert(with: "❗️", and: "Enter your username")
            return
        }
        guard passwordTextField.text != "" else {
            showAlert(with: "❗️", and: "Enter password")
            return
        }
        guard userNameTextField.text == user.name else {
            showAlert(with: "‼️", and: "Please enter the correct username")
            userNameTextField.text = ""
            return
        }
        guard passwordTextField.text == user.password else {
            showAlert(with: "‼️", and: "Incorrect password")
            passwordTextField.text = ""
            return
        }
        performSegue(withIdentifier: "presentModally", sender: nil)
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    

    
    // MARK: forgotButtonAction
    @IBAction func forgotButtonAction(_ sender: UIButton) {
        switch sender.tag {
        case 1: showAlert(with: "User Name", and: user.name)
        case 2: showAlert(with: "Password", and: user.password)
        default: break
        }
    }
    
    // MARK: UnwideSegue
    @IBAction func unwide(segue: UIStoryboardSegue) {
    }
    
    // MARK: AlertController
    private func showAlert(with title: String, and message: String) {
        
        let alertController = UIAlertController(title: title,
                                                message: message,
                                                preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "ОК", style: .default)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
    // MARK: UITextFieldDelegate
    private func configureTextFields() {
        userNameTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    // MARK: SetGradient
    private func setGradientForView() {
        let gradient = CAGradientLayer()

        gradient.colors = [
          UIColor(red: 0.596, green: 0.584, blue: 0.937, alpha: 1).cgColor,
          UIColor(red: 0.937, green: 0.761, blue: 0.843, alpha: 1).cgColor
        ]

        gradient.locations = [0, 1]
        gradient.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradient.endPoint = CGPoint(x: 0.75, y: 0.5)
        gradient.transform = CATransform3DMakeAffineTransform(
            CGAffineTransform(a: 1, b: 1, c: -1, d: 1.31, tx: 0.5, ty: -0.65)
        )
        gradient.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width,
                                              dy: -0.5*view.bounds.size.height)

        gradient.position = view.center
        view.layer.insertSublayer(gradient, at: 0)
    }

}

extension StartViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case userNameTextField:
            userNameTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            logInAction()
        default:
            break
        }
        return true
    }
}
