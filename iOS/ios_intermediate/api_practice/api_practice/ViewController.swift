//
//  ViewController.swift
//  api_practice
//
//  Created by Ryan Holstein on 5/25/17.
//  Copyright © 2017 Ryan Holstein. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    let apiKey = "286abf6056d0a1338f772d1b7202e728"
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://api.themoviedb.org/3/movie/550?api_key=\(apiKey)")
        let session = URLSession.shared
        let task = session.dataTask(with: url!, completionHandler: {
            data, response, error in
            do {
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    print(jsonResult)
                }
            } catch {
                print(error)
            }
        })
 
        task.resume()
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

