//
//  RegisterVC.swift
//  RoomTrac
//
//  Created by Sunil on 25/10/18.
//  Copyright © 2018 Sunil. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var lblOR: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        txtEmail.addLineToView(position: .LINE_POSITION_BOTTOM, color: UIColor.white, width: 0.5)
        txtEmail.placeHolderColor(colorName: colorNames.white)

        txtPassword.addLineToView(position: .LINE_POSITION_BOTTOM, color: UIColor.white, width: 0.5)
        txtPassword.placeHolderColor(colorName: colorNames.white)

        txtFirstName.addLineToView(position: .LINE_POSITION_BOTTOM, color: UIColor.white, width: 0.5)
        txtFirstName.placeHolderColor(colorName: colorNames.white)

        txtLastName.addLineToView(position: .LINE_POSITION_BOTTOM, color: UIColor.white, width: 0.5)
        txtLastName.placeHolderColor(colorName: colorNames.white)

        lblOR.layer.cornerRadius = lblOR.frame.width/2
        lblOR.layer.masksToBounds = true
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func registerAction(_ sender: Any) {
        
    }
    
    @IBAction func switchToLoginPage(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)

    }
    @IBAction func facebookLogin(_ sender: Any) {

    }
    
    @IBAction func googleLogin(_ sender: Any) {
        
    }
}
