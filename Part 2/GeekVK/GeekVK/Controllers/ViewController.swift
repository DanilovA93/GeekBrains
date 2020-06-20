//
//  ViewController.swift
//  GeekVK
//
//  Created by Антон Данилов on 25.04.2020.
//  Copyright © 2020 Антон Данилов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
            
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var loginInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    var loadProcessView: LoadProcessView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    
        loadProcessView = LoadProcessView(x: 30, y: 30)
        self.view.addSubview(loadProcessView!)
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if findUserByMailAndPassword() == nil {
            showLoginError()
        }
        return true
    }
    
    private func showLoginError() {
        let alter = UIAlertController(title: "Error", message: "Incorrect user data entered", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alter.addAction(action)
        present(alter, animated: true, completion: nil)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        let userInfo = notification.userInfo!
        var keyBoardFrame: CGRect = (userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        keyBoardFrame = self.view.convert(keyBoardFrame, from: nil)
        
        var contentInset: UIEdgeInsets = self.scrollView.contentInset
        contentInset.bottom = keyBoardFrame.size.height
        scrollView.contentInset = contentInset
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        let contentInset: UIEdgeInsets = UIEdgeInsets.zero
        scrollView.contentInset = contentInset
    }
    
    @IBAction func closeKeyboard(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func unwindToLogin(unwindSegue: UIStoryboardSegue) {
    }
    
    private func findUserByMailAndPassword() -> User? {
        var currentUser: User?
        
        for user in usersDB() {
            if user.email == loginInput.text && user.password == passwordInput.text {
                currentUser = user
            }
        }
        return currentUser
    }
    
    private func usersDB() -> Array<User> {
        var arr: Array<User> = Array()
        let user1: User = User(id: 1, email: "", password: "", firstName: "Jessie", lastName: "Howard", avatar: [UIImage(named: "mouse")!])
        let user2: User = User(id: 2, email: "user2", password: "321", firstName: "Elisabeth", lastName: "Peters", avatar: [UIImage(named: "mouse")!])
        
        arr.append(user1)
        arr.append(user2)
        
        return arr
    }
}
