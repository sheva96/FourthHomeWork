//
//  PlansViewController.swift
//  FourthHomeWork
//
//  Created by Евгений Шевченко on 23.10.2020.
//

import UIKit

class PlansViewController: UIViewController {

    @IBOutlet weak var fullNameLabel: UILabel!
    
    var fullName: String!
    
    var plans: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let fullName = fullName else { return }
        fullNameLabel.text = "Full name: \(fullName)"
        
        setGradientForView()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailVC = segue.destination as! DetailViewController
        detailVC.plans = plans
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
            CGAffineTransform(a: 1, b: 1, c: -1, d: 1.31, tx: 0.5, ty: -0.65)
        )

        gradient.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width,
                                            dy: -0.5*view.bounds.size.height)

        gradient.position = view.center
        view.layer.insertSublayer(gradient, at: 0)
    }
}
