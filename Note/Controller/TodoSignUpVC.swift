import UIKit
import Firebase

class TodoSignUpVC: UIViewController {
    var activityIndicator = UIActivityIndicatorView()
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var emailLabel1: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField1: UITextField!
    @IBOutlet weak var passwordLable1: UILabel!
    @IBOutlet weak var passwordLable2: UILabel!
    @IBOutlet weak var registeriBuott: UIButton!
    @IBOutlet weak var LoginButt: UIButton!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func handleRegister(_ sender: Any) {
        if let name = nameTextField.text,
           let email = emailTextField1.text,
           let password = passwordTextField.text,
           let  confirmPassword = confirmPasswordTextField.text,
           password == confirmPassword {
            Activity.showIndicator(parentView: self.view, childView: activityIndicator)
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    print("Registration Auth Error",error.localizedDescription)
                }
                if let authResult = authResult {
                    let db = Firestore.firestore()
                    let userData: [String:String] = [
                        "id":authResult.user.uid,
                        "name":name,
                        "email":email,
                    ]
                    db.collection("users").document(authResult.user.uid).setData(userData) { error in
                        if let error = error {
                            print("Registration Database error",error.localizedDescription)
                        }else {
                            if let vc = UIStoryboard(name: "Main", bundle: nil)
                                .instantiateViewController(withIdentifier: "TodoVC") as? UITabBarController {
                                vc.modalPresentationStyle = .fullScreen
                                Activity.removeIndicator(parentView: self.view, childView: self.activityIndicator)
                                self.present(vc, animated: true, completion: nil)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func LoginButton(_ sender: Any) {
    }
}
