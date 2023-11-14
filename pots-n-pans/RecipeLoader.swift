//
//  RecipeLoader.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import Foundation

class RecipeLoader {
    func loadRecipes(responses: ResponseModel, completion: @escaping ([String: Any]?) -> Void) {
        if let path = Bundle.main.path(forResource: "Recipes", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let allRecipes = jsonResult as? [String: Any] {
                    
                    let filteredRecipes = allRecipes.filter { responses.output.recipes.contains($0.key) }
                    
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


