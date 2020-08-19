//
//  Struct.swift
//  MultiModels
//
//  Created by Lachlan McKerrow on 15/2/20. Modified on 9/5/20 adding in text content.
//  Copyright © 2020 Lachlan McKerrow. All rights reserved.
//
// 01a In Helpers Group create a swift Struct.file
// 01b Paste in the content from // 00c
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let cookbook = try? newJSONDecoder().decode(Cookbook.self, from: jsonData)

import Foundation

// MARK: - Cookbook
struct Cookbook: Decodable {
    let cookbookTitle, cookbookBiline: String
    let totalContents, totalChapters, totalRecipes: Int
    let contents: [Content]
    let chapters: [Chapter]
}

// MARK: - Chapter
struct Chapter: Decodable {
    let chapterIndex: Int
    let chapterName, chapterImage: String
    let recipes: [Recipe]
}

// MARK: - Recipe
struct Recipe: Decodable {
    let recipeIndex: Int
    // let recipeStructured: Bool
    let recipeDetails: RecipeDetails
}

// MARK: - RecipeDetails
struct RecipeDetails: Decodable {
    let recipeName: String
    let recipePartList: [RecipePartList]?
    let recipeOrigin, recipePreamble, recipeImage, recipeServes: String?
    let recipeAsBlurb: String?
}

// MARK: - RecipePartList
struct RecipePartList: Decodable {
    let recipePartLabel: String?
    let recipeIngredientsList: [RecipeIngredientsList]
    let recipeSteps: String
}

// MARK: - RecipeIngredientsList
struct RecipeIngredientsList: Decodable {
    let recipeIngredientsName: String
}

// MARK: - Content
struct Content: Decodable {
    let contentIndex: Int
    let contentName: String
    let contentImage: String?
    let biographyCat: [BiographyCat]?
    let conversionCat: [ConversionCat]?
    let measurementCat: [MeasurementCat]?
    let contentsList: [ContentsList]?
    let recipeContributorPreamble: String?
    let recipeContributorList: [RecipeContributorList]?
}

// MARK: - BiographyCat
struct BiographyCat: Decodable {
    let biographyContrubutor, biographyText, biographyPostNominals: String
    let biographyBiline: String?
}

// MARK: - ContentsList
struct ContentsList: Decodable {
    let contentItem, contentPage: String
}

// MARK: - ConversionCat
struct ConversionCat: Decodable {
    let conversionType, conversionTypeFrom, conversionTypeTo: String
    let conversionIncrement: [ConversionIncrement]
    let conversionNote: String?
}

// MARK: - ConversionIncrement
struct ConversionIncrement: Decodable {
    let conversionFrom, conversionTo: String
}

// MARK: - MeasurementCat
struct MeasurementCat: Decodable {
    let measurementType, measurementTypeFrom, measurementTypeTo: String
    let measurementIncrement: [MeasurementIncrement]
}

// MARK: - MeasurementIncrement
struct MeasurementIncrement: Decodable {
    let measurementFrom, measurementItem, measurementTo: String
}

// MARK: - RecipeContributorList
struct RecipeContributorList: Decodable {
    let recipeContributor: String
}
