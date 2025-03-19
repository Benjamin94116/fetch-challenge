import SwiftUI

struct RecipeListView: View {
    var viewModel = RecipesListViewModel()
    
    var body: some View {
        NavigationStack {
            Group {
                switch viewModel.state {
                case .loading:
                    ProgressView()
                case .error:
                    ErrorRetryView(message: "Fetching failed. Please try again", viewModel: viewModel)
                case .loaded(let recipes):
                    if !recipes.isEmpty {
                        List(recipes) { recipe in
                            RecipeCell(recipe: recipe)
                        }
                        .refreshable {
                            await viewModel.fectchRecipes()
                        }
                    } else {
                        ErrorRetryView(message: "Recipes is empty please try agin", viewModel: viewModel)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
        .task {
            await viewModel.fectchRecipes()
        }
    }
}
