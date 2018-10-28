//
//  ViewController.swift
//  RoomTrac
//
//  Created by Sunil on 25/10/18.
//  Copyright © 2018 Sunil. All rights reserved.
//

import UIKit

enum colorNames {
    case white
    case gray
}

enum LINE_POSITION {
    case LINE_POSITION_TOP
    case LINE_POSITION_BOTTOM
}

extension UITextField {

    func placeHolderColor(colorName : colorNames) {
        var myMutableStringTitle = NSMutableAttributedString()

        myMutableStringTitle = NSMutableAttributedString(string:self.placeholder ?? "", attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 20)])
        switch colorName {
        case .gray:
            myMutableStringTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range:NSRange(location:0,length:(self.placeholder ?? "").count))
        default:
            myMutableStringTitle.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.white, range:NSRange(location:0,length:(self.placeholder ?? "").count))
        }
        // Color
        self.attributedPlaceholder = myMutableStringTitle
    }


    func addLineToView(position : LINE_POSITION, color: UIColor, width: Double) {
        let lineView = UIView()
        lineView.backgroundColor = color
        lineView.translatesAutoresizingMaskIntoConstraints = false // This is important!
        self.addSubview(lineView)

        let metrics = ["width" : NSNumber(value: width)]
        let views = ["lineView" : lineView]
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[lineView]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))

        switch position {
        case .LINE_POSITION_TOP:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[lineView(width)]", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        case .LINE_POSITION_BOTTOM:
            self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[lineView(width)]|", options:NSLayoutConstraint.FormatOptions(rawValue: 0), metrics:metrics, views:views))
            break
        default:
            break
        }
    }

}

class ViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var lblOR: UILabel!
    @IBOutlet weak var loginView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        txtEmail.addLineToView(position: .LINE_POSITION_BOTTOM, color: UIColor.white, width: 0.5)
        txtEmail.placeHolderColor(colorName: colorNames.white)

        txtPassword.addLineToView(position: .LINE_POSITION_BOTTOM, color: UIColor.white, width: 0.5)
        txtPassword.placeHolderColor(colorName: colorNames.white)

        lblOR.layer.cornerRadius = lblOR.frame.width/2
        lblOR.layer.masksToBounds = true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    @IBAction func loginAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Landing") as! LandingVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func forgotPassword(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Forgot") as! ForgotPasswordVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func switchToRegisterPage(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "Register") as! RegisterVC
        self.navigationController?.pushViewController(controller, animated: true)
    }
    @IBAction func facebookLogin(_ sender: Any) {

    }
    @IBAction func googleLogin(_ sender: Any) {

    }

}

