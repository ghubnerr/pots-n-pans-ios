//
//  RecipesViewController.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import UIKit

class RecipesViewController: UINavigationController {

    var responseObject: ResponseModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let recipeLoader = RecipeLoader()

        recipeLoader.loadRecipes(responses: responseObject!) { filteredRecipes in
            if let filteredRecipes = filteredRecipes {
                print(filteredRecipes)
            } else {
                print("Error loading or filtering recipes.")
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
