//
//  RootViewController.swift
//  OPGFeedbackSDK
//
//  Created by Manjunath on 24/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func showAlert(alertMessage: String) {
        let alert = UIAlertController(title: "OPGSDKv0.1.6", message: alertMessage, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func showNoInternetConnectionAlert() {
        self.showAlert(alertMessage: "No internet connection. Please try again!")
    }
}
