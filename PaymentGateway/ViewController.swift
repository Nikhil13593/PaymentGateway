//
//  ViewController.swift
//  PaymentGateway
//
//  Created by Nikhil Patil on 03/04/19.
//  Copyright © 2019 Nikhil Patil. All rights reserved.
//

import UIKit
import Razorpay

class ViewController: UIViewController, RazorpayPaymentCompletionProtocol {
  

    var razorpay: Razorpay!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        razorpay = Razorpay.initWithKey("RazorPay Key", andDelegate: self)
        
    }

    
    @IBAction func payNowAction(_ sender: Any) {
        
        let options: [String:Any] = [
            "amount" : "7800000",
            "description": "Buy iPhone XR",
            "image": "http://www.brninfotech.com/pulse/assets/admin/layout/img/logo-big.png",
            "name": "Flipkart.com",
            "prefill": [
            "contact": "",
            "email": ""
            ],
            "theme": [
                "color": "#1478F6"
            ]
        ]
        
        razorpay.open(options)
        
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
        
        let alertController = UIAlertController(title: "Failure", message:str, preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        print(str)
    }
    
    func onPaymentSuccess(_ payment_id: String) {
        
        let alertController = UIAlertController(title: "Success", message:"Payment Id \(payment_id)", preferredStyle: UIAlertController.Style.alert)
        
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
        
        
        print(payment_id)
    }
    
    
}
























