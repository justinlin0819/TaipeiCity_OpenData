//
//  ViewController.swift
//  TaipeiCity_OpenData
//
//  Created by Justin Lin on 2018/8/14.
//  Copyright © 2018年 Justin Lin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let urlStr = "http://data.taipei/opendata/datalist/apiAccess?scope=resourceAquire&rid=e6831708-02b4-4ef8-98fa-4b4ce53459d9"
        if let url = URL(string: urlStr) {
            let task = URLSession.shared.dataTask(with: url) { (data, response , error) in
                if let data = data, let dic = try?
                    JSONSerialization.jsonObject(with: data) as? [String: Any], let results = dic?["results"] as? [[String: Any]] {
                    for location in results {
                        print(location["locationName"])
                    }
                }
            }
            task.resume()
        }
    }
}

