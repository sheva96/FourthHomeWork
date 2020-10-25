//
//  DetailViewController.swift
//  FourthHomeWork
//
//  Created by Евгений Шевченко on 25.10.2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var plansLabel: UILabel!
    
    var plans: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plansLabel.text = plans
        
        setGradientForView()
        
        whiteView.layer.cornerRadius = 20
    }
    
    // MARK: SetGradient
    private func setGradientForView() {
        let gradient = CAGradientLayer()

        gradient.colors = [
          UIColor(red: 0.392, green: 0.91, blue: 0.871, alpha: 1).cgColor,
          UIColor(red: 0.541, green: 0.392, blue: 0.91, alpha: 1).cgColor
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
