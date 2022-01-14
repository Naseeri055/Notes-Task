//
//  TodoLoginVC.swift
//  Note
//
//  Created by Nasser Aseeri on 30/05/1443 AH.
//

import UIKit
import Firebase

class TodoLoginVC: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet weak var emailLabiLogin: UILabel!
    @IBOutlet weak var passwordLablLogin: UILabel!
    @IBOutlet weak var emailTextF: UITextField!
    @IBOutlet weak var LoginButt: UIButton!
    @IBOutlet weak var passTextFil: UITextField!
    
    @IBOutlet weak var regisButt: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func loginButton(_ sender: Any) {
        if let email = emailTextF.text,
           let password = passTextFil.text {
            Activity.showIndicator(parentView: self.view, childView: activityIndicator)
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let _ = authResult {
                    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TodoVC") as? UITabBarController {
                        vc.modalPresentationStyle = .fullScreen
                        Activity.removeIndicator(parentView: self.view, childView: self.activityIndicator)
                        self.present(vc, animated: true, completion: nil)
                    }
                }
            }
        }
    }
    
    
    
    
    
}
