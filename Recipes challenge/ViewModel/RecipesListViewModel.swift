
import Observation

@Observable
class RecipesListViewModel{
    enum State {
        case loading
        case loaded(recipes: [Recipe])
        case error
    }
    
    var state = State.loading
    
    func fectchRecipes() async {
        state = .loading
        do {
            let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
            let recipes = try await RecipesLoader.fetchRecipes(urlString)
            state = .loaded(recipes: recipes)
        } catch {
            state = .error
        }
    }
}
