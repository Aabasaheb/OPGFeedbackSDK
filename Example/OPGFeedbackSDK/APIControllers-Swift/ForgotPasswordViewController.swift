//
//  ForgotPasswordViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 04/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: RootViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtEmailID: UITextField!
    var obj: OPGForgotPassword!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmailID.delegate=self
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
    
    @IBAction func forgotPass(_ sender: AnyObject)
    {
        let sdk = OPGSDK()        // Creating OPGSDK instance
        do {
            obj = try sdk.forgotPassword(txtEmailID.text)
        }
        catch{
            print("Forgot Password Failed")         /* @"Error Occured. Contact Support!" */
        }
        
        if (obj?.isSuccess.int32Value==1) {
            super.showAlert(alertMessage: "Mail Sent Successfully")
        }
        else {
            super.showAlert(alertMessage: "Mail Sending Failed")
        }
    }
}
