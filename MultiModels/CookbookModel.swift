//
//  CookbookModel.swift
//  MultiModels
//
//  Created by Lachlan McKerrow on 15/2/20.
//  Copyright © 2020 Lachlan McKerrow. All rights reserved.
//
// 01c In Models Group create a swift CookbookModel file

import Foundation

// 01j Create the CookbookModelProtocol
protocol CookbookModelProtocol {
    
    // 01k create one required function with 1 parameter, which are the cookbook data to get back initially as (_ cookbook: [Cookbook])
    // func cookbookRetrieved(_ cookbook: [Cookbook])
    func cookbookRetrieved(_ cookbook: Cookbook)
    
}

// 01d Create the class CookbookModel
class CookbookModel {
    
    // 01l Create the CookbookModelProtocol delegate
    var delegate:CookbookModelProtocol?
    
    // 01e Create the method to get the Cookook, which is made up of an array of Chapters, and nested arrays of Recipes
    func getCookbook() {
        
        // 01r TEST pass back an empty array [Cookbook] - run the simulator to validate 01p in ContVC prints in console.
        // delegate?.cookbookRetrieved([Cookbook]())
        
        // 02a Create a method to getLocalJsonFile()
        getLocalJsonFile()
        
    }
    
    
    // 02b Create the function to get data from local source
    func getLocalJsonFile() {
        
            // 02c Get a path to the local JSON file in our app bundle - Don't forget to add the JSON file into the project
            let path = Bundle.main.path(forResource: "Cookbook", ofType: ".json")
            
            // 02d As 02c returns a String, we have to do a guard statement to check that it is != nil
            guard path != nil else {
                print("Can't find the JSON file")
                return
            }
            
            // 02e Create a URL object from that string path
            let url = URL(fileURLWithPath: path!)
            
            // 02f-j Decode that data into instances of the DataStruct
            // 02f do / catch block
            do {
                
                // 02g Get the data from the URL, with contentsOf initialiser, and as it throws, we have to use the try keyword and a do / catch block
                let data = try Data(contentsOf: url)
                
                // 02h Paste in the command from Struct
                let cookbook = try JSONDecoder().decode(Cookbook.self, from: data)
                
                // 02i In order to simplify the code, we need to alter the Protocol/Delegate model from
                // cookbookRetrieved(_ cookbook: [Cookbook])
                // to
                // cookbookRetrieved(_ cookbook: Cookbook)
                // in both CM and ContentVC at 01k and 01o respectively, then we can do 02j
                
                // 02j Return the Cookbook Structs to the ContentsViewController
                delegate?.cookbookRetrieved(cookbook)
                
                // 02k Copy the Cookbook.json file into the project
                // 02l Put in a break point on 02h line, run app, then step into and do a po cookbook to see if Json Data is parsed. If all ok, remove breakpoint
                // 02m Do initial commit to GitHub
                
            }
            catch {
                print("Couldn't create data object from file.")
                return
            } // End do catch block
            
        } // End getLocalJsonFile

}
