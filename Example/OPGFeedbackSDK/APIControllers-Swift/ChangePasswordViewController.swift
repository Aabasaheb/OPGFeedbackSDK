//
//  ChangePasswordViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 04/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class ChangePasswordViewController: RootViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtCurrPass: UITextField!
    @IBOutlet weak var txtNewPass: UITextField!
    var obj: OPGChangePassword!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtNewPass.delegate=self
        txtCurrPass.delegate=self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func changePassSwift(_ sender: AnyObject)
    {
        let sdk = OPGSDK()        // Creating OPGSDK instance
        do {
            obj = try sdk.changePassword(txtCurrPass.text, newPassword: txtNewPass.text)
        }
        catch{
            print("Change Password Failed")         /* @"Error Occured. Contact Support!" */
        }
        if (obj.isSuccess.boolValue == true)
        {
            super.showAlert(alertMessage: "Password Changed Successfully")
        }
        else
        {
            super.showAlert(alertMessage: "Password Change Failed")
        }
    }
}
