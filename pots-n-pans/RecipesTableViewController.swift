//
//  RecipesTableViewController.swift
//  pots-n-pans
//
//  Created by Gabriel Hübner on 11/14/23.
//

import UIKit

class RecipesTableViewController: UITableViewController {
    var responseObject: ResponseModel?
    let recipeLoader = RecipeLoader()
    
    
    var recipes: [Recipe] = []


    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(TableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
        recipeLoader.loadRecipes(responses: responseObject!) { filteredRecipes in
            if let filteredRecipes = filteredRecipes {
                self.recipes = filteredRecipes
            } else {
                print("Error loading or filtering recipes.")
            }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1 // Assuming you want a single section
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell else {
            print("Failed to dequeue a cell with identifier 'reuseIdentifier' or the cell is not of type TableViewCell.")
            return UITableViewCell() // Return a default cell or handle it as needed
        }

        let recipe = recipes[indexPath.row]
        
        print(recipe)

        cell.recipeTitle?.text = recipe.title
        cell.recipeIngredients?.text = recipe.ingredients.joined(separator: ", ")

        return cell
    }


}
