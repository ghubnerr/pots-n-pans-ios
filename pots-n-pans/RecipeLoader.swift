//
//  RecipeLoader.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import Foundation

class RecipeLoader {
    func loadRecipes(responses: ResponseModel, completion: @escaping ([Recipe]?) -> Void) {
            if let path = Bundle.main.path(forResource: "Recipes", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    
                    if let allRecipes = jsonResult as? [String: [String: Any]] {
                        let filteredRecipes: [Recipe] = allRecipes.compactMap { (title, recipeData) -> Recipe? in
                            guard let ingredients = recipeData["ingredients"] as? [String],
                                  let instructions = recipeData["instructions"] as? String,
                                  let pictureLink = recipeData["picture_link"] as? String,
                                  responses.output.recipes.contains(title) else {
                                return nil
                            }

                            return Recipe(title: title, ingredients: ingredients, instructions: instructions, pictureLink: pictureLink)
                        }
                        completion(filteredRecipes)
                    } else {
                        completion(nil)
                    }
                } catch {
                    completion(nil)
                }
            } else {
                completion(nil)
            }
        }
    }
