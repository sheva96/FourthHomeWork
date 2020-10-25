//
//  WelcomeViewController.swift
//  FourthHomeWork
//
//  Created by Евгений Шевченко on 23.10.2020.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    var userName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGradientForView()
        
        guard let userName = userName else { return }
        welcomeLabel.text = "Welcome, \(userName)!"
    }
    
    // MARK: UnwideSegueButton
    @IBAction func logOutAction() {
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
            CGAffineTransform(a: -1, b: 1, c: -1, d: -1.31, tx: 1.5, ty: 0.65)
        )

        gradient.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width,
                                              dy: -0.5*view.bounds.size.height)

        gradient.position = view.center
        view.layer.insertSublayer(gradient, at: 0)
    }
}
