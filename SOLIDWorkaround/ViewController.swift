//
//  ViewController.swift
//  NetworkingSample
//
//  Created by Admin on 19/05/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        serializeJSON()
    }

    func serializeJSON() {
        let json = FileLoader.getJsonFile("Sample")
            .next(FileData.changeToData)
            .next(serializeJson)
        print(json)
    }
}

