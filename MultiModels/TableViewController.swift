//
//  TableViewController.swift
//  MultiModels
//
//  Created by Lachlan McKerrow on 19/8/20.
//  Copyright © 2020 Lachlan McKerrow. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {

        // 01g Create the property for the CookbookModel
        var model = TableModel()
        
        // 01h Declare a cookbook, contents and chapters properties so we can store a reference to contents and chapters that come back, and initialise them to an empty array
        var cookbook = [Cookbook]()
        var contents = [Content]()
        var chapters = [Chapter]()

        override func viewDidLoad() {
            super.viewDidLoad()

            // Do any additional setup after loading the view.
            
            // 01m Assign the ContVC as delegate
            model.delegate = self // as! CookbookModelProtocol
            
            // 01i Call getCookbook from the CookbookModel
            model.getTable()
            
        }

    }

    // 01n Create the extension and have the ContVC conform to the CookbookModelProtocol in an extension
    extension TableViewController: TableModelProtocol {
        
        // 01o Get the chapters and recipes from the CookbookModel initially as (_ cookbook: [Cookbook])
        // func cookbookRetrieved(_ cookbook: [Cookbook]) {
        func tableRetrieved(_ contents: Content) {
            
            // 01p TEST (needs 01q over in CookbookModel.swift) print a statement to verify that the comms have been set up correctly
            // print("Test that Cookbook comes back")
        
        }
    }

