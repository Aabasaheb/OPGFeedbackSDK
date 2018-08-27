//
//  AuthenticationViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 04/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class AuthenticationViewController: RootViewController, UITextFieldDelegate
{
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    var authObj: OPGAuthenticate?
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        username.delegate=self
        password.delegate=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func authenticate(_ sender: AnyObject)
    {
        let sdk = OPGSDK()        // Creating OPGSDK instance
        do {
            authObj = try sdk.authenticate(self.username.text, password: self.password.text)
        }
        catch{
            print("Authentication Failed")         /* @"Error Occured. Contact Support!" */
        }
        
        if authObj!.isSuccess.int32Value==1
        {
            super.showAlert(alertMessage: "Authentication Successful")
        }
        else
        {
            super.showAlert(alertMessage: "Authentication Failed")
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   
        textField.resignFirstResponder()
        return true
    }
}
