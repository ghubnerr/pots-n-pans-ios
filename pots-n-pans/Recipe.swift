import Foundation

struct Recipe {
    let title: String
    let ingredients: [String]
    let instructions: String
    let pictureLink: String
}

extension Recipe {
    init(data: [String: Any]) {
        let defaultTitle = "Default Title"
        let defaultIngredients: [String] = []
        let defaultInstructions = "Default Instructions"
        let defaultPictureLink = "Default Picture Link"

        guard
            let title = data.keys.first,
            let recipeData = data[title] as? [String: Any],
            let ingredients = recipeData["ingredients"] as? [String],
            let instructions = recipeData["instructions"] as? String,
            let pictureLink = recipeData["picture_link"] as? String
        else {
            self.title = defaultTitle
            self.ingredients = defaultIngredients
            self.instructions = defaultInstructions
            self.pictureLink = defaultPictureLink
            return
        }

        self.title = title
        self.ingredients = ingredients
        self.instructions = instructions
        self.pictureLink = pictureLink
    }
}

