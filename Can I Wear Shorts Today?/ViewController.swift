//
//  ViewController.swift
//  Can I Wear Shorts Today?
//
//  Created by Darryl Nunn on 2/3/16.
//  Copyright © 2016 Darryl Nunn. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var cityField: UITextField!
    
    @IBOutlet var weatherDisplayLabel: UILabel!

    @IBAction func fetchWeather(sender: AnyObject) {
        
        print(cityField.text)
        
        let url = NSURL(string: "http://www.weather-forecast.com/locations/\(cityField.text!)/forecasts/latest")!
        
        print(url)
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if data != nil {
                print(data)
            }
        
        }
        task.resume()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

