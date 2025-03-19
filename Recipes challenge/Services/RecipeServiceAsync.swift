
import Foundation

enum RecipesLoader {
    
    static func fetchRecipes(_ urlString: String) async throws -> [Recipe] {
       
        guard let url = URL(string: urlString) else {
            fatalError("Unable to initialize URL from \(urlString).")
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        let recipes = try decoder.decode(Recipes.self, from: data)
        
        return recipes.recipes
    }
}
