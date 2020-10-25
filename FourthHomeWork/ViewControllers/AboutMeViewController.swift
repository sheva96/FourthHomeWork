//
//  AboutMeViewController.swift
//  FourthHomeWork
//
//  Created by Евгений Шевченко on 23.10.2020.
//

import UIKit

class AboutMeViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var whiteView: UIView!
    
    @IBOutlet weak var aboutMeLabel: UILabel!
    
    var newAboutMe: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        aboutMeLabel.text = newAboutMe
        setGradientForView()
    }
    
    
    override func viewWillLayoutSubviews() {
        whiteView.layer.cornerRadius = 20
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
    }
    
    // MARK: SetGradient
    private func setGradientForView() {
        let gradient = CAGradientLayer()
        
        let colorOne = UIColor(red: 0.424, green: 0.91, blue: 0.992, alpha: 1)
        let colorTwo = UIColor(red: 0.051, green: 0.004, blue: 0.357, alpha: 1)
        
        gradient.frame = view.frame
        gradient.colors = [colorOne.cgColor, colorTwo.cgColor]
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
