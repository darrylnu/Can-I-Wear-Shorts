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
        
        cityField.text = ""
        
        
        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if data != nil {
                
                let webData = NSString(data: data!, encoding: NSUTF8StringEncoding)
                let weatherDataHalf = webData?.componentsSeparatedByString("3 Day Weather Forecast Summary:</b><span class=\"read-more-small\"><span class=\"read-more-content\"> <span class=\"phrase\">")
                
                if weatherDataHalf!.count > 0 {
                    
                    let weatherRead = weatherDataHalf![1].componentsSeparatedByString("</span")
                    
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                         self.weatherDisplayLabel.text = weatherRead[0].stringByReplacingOccurrencesOfString("&deg;", withString: "\u{00B0}")
                    })
                   
                } else {
                    self.weatherDisplayLabel.text = "Please enter in a city to see the weather."
                }
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

