//
//  GetScriptViewController.swift
//  SDKDemoApp
//
//  Created by OnePoint Global on 04/10/16.
//  Copyright © 2016 opg. All rights reserved.
//

import UIKit

class GetScriptViewController: RootViewController, UITextFieldDelegate
{
    @IBOutlet weak var surveyId: UITextField!
    @IBOutlet weak var surveyName: UITextField!
    @IBOutlet weak var surveyRef: UITextField!

    var obj: OPGScript?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        surveyId.delegate=self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        return true
    }

    @IBAction func getScript(_ sender: AnyObject)
    {
        let sdk = OPGSDK()        // Creating OPGSDK instance
        let survey = OPGSurvey()
        if((self.surveyId.text?.isEmpty)! ||  (self.surveyRef.text?.isEmpty)! || (self.surveyName.text?.isEmpty)!) {
            super.showAlert(alertMessage: "Please provide a valid input")
            return
        }
        let surveyIdInt = Int(self.surveyId.text!)
        survey.surveyID = NSNumber(value:surveyIdInt!)
        survey.surveyName = self.surveyName.text
        survey.surveyReference = self.surveyRef.text
        
        do {
            obj = try sdk.getScript(survey)
        }
        catch{
            print("GetSCript Failed")         /* @"Error Occured. Contact Support!" */
        }
        
        if ( obj?.isSuccess.int32Value==1) {
            super.showAlert(alertMessage: "Script Download Successful!")
        }
        else {
            super.showAlert(alertMessage: "Script Download Failed!")
        }
    }
}
