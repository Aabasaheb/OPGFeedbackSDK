//
//  AuthenticationWithSocialMediaViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 01/12/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class AuthenticationWithSocialMediaViewController: RootViewController, UITextFieldDelegate
{
    @IBOutlet weak var txtGoogleToken: UITextField!
    @IBOutlet weak var txtFacebookToken: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.txtGoogleToken.delegate=self
        self.txtFacebookToken.delegate=self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func authenticateWithGoogle(_ sender: AnyObject)
    {
        let sdk = OPGSDK()        // Creating OPGSDK instance
        var authObj: OPGAuthenticate?
        do {
            authObj = try sdk.authenticate(withGoogle: "")
        }
        catch{
            print("Authentication Failed")         /* @"Error Occured. Contact Support!" */
        }
        
        if authObj!.isSuccess.int32Value == 1 {
            super.showAlert(alertMessage: "Authentication Successful")
        }
        else {
            super.showAlert(alertMessage: (authObj?.statusMessage)!)
        }
    }

    @IBAction func authenticateWithFacebook(_ sender: AnyObject)
    {
        let sdk = OPGSDK()        // Creating OPGSDK instance
        var authObj: OPGAuthenticate?
        do {
            authObj = try sdk.authenticate(withFacebook: "")
        }
        catch{
            print("Authentication Failed")         /* @"Error Occured. Contact Support!" */
        }
        
        if authObj!.isSuccess.int32Value == 1 {
            super.showAlert(alertMessage: "Authentication Successful")
        }
        else {
            super.showAlert( alertMessage: (authObj?.statusMessage)!)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }
}
