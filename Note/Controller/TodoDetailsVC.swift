//
//  TodoDetailsVC.swift
//  Note
//
//  Created by Nasser Aseeri on 30/05/1443 AH.
//

import UIKit

class TodoDetailsVC: UIViewController {
    
    var todo: Todo!
    var index: Int!
    
    @IBOutlet weak var todoImageView: UIImageView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var todoTitleLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if todo.image != nil {
            todoImageView.image = todo.image
        }else {
            todoImageView.image = UIImage(named: "Image-4")
        }
        
        setupUI()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(currentTodoEdited), name: NSNotification.Name(rawValue: "CurrentTodoEdited"), object: nil)
        
    }
    
    @objc func currentTodoEdited(notification: Notification)
    {
        if let todo = notification.userInfo?["editedTodo"] as? Todo
        {
            self.todo = todo
            setupUI()
            
        }
    }
    
    func setupUI(){
        detailsLabel.text = todo.details
        todoTitleLabel.text = todo.title
        todoImageView.image = todo.image
    }
    
    
    @IBAction func editTodoButtonClicked(_ sender: Any) {
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "NewTodoVC") as? NewTodoVC {
            
            viewController.isCreation = false
            viewController.editedTodo = todo
            viewController.editedTodoIndex = index
            
            navigationController?.pushViewController(viewController, animated: true)
            
        }
        
    }
    
    @IBAction func deleteButtonClicked(_ sender: Any) {
        _ = UIAlertController(
            title: "Attention",
            message: "Are you sure you want to delete the note?",
            preferredStyle: UIAlertController.Style.alert)
        _ = UIAlertAction(title: "Yes", style: .default) { alert in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TodoDeleted"), object: nil, userInfo: ["deletedTodoIndex" : self.index as Any])
        }
        
        
        
        //
        //
        //            let alert = MyAlertViewController(
        //                title: "تم",
        //                message: "تمت عملية الحذف بنجاح",
        //                imageName: "warning_icon")
        //
        //            alert.addAction(title: "تم", style: .default) { alert in
        //                self.navigationController?.popViewController(animated: true)
        //            }
        //
        //            self.present(alert, animated: true, completion: nil)
        //        }
        //
        //        alert.addAction(title: "إلغاء", style: .cancel)
        //
        //        present(alert, animated: true, completion: nil)
        
        
        let confirmAlert = UIAlertController(title: "Attention", message: "Are you sure you want to delete the note?", preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "Confirm the deletion", style: .destructive) { alert in
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "TodoDeleted"), object: nil, userInfo: ["deletedTodoIndex" : self.index as Any])
            
            let alert = UIAlertController(title: "It was completed", message: "Deleted successfully", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "It was completed", style: .default) { alert in
                self.navigationController?.popViewController(animated: true)
            }
            alert.addAction(closeAction)
            self.present(alert, animated: true, completion: nil)
        }
        
        confirmAlert.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "It was completed", style: .default, handler: nil)
        
        confirmAlert.addAction(cancelAction)

        present(confirmAlert, animated: true, completion: nil)
        
        
        
    }
    
}


