

import XCTest
@testable import Recipes_challenge

class RecipesLoaderTests: XCTestCase {
    
    func testFetchRecipesSuccess() async {

        let urlString = "https://d3jbb8n5wk0qxi.cloudfront.net/recipes.json"
        do {
            let recipes = try await RecipesLoader.fetchRecipes(urlString)
            XCTAssertNotNil(recipes.count)
        } catch {
            XCTFail("fetchRecipes() failed with error: \(error)")
        }
    }
    
    func testFetchRecipesNetworkFailure() async {
        
        do {
            let _ = try await RecipesLoader.fetchRecipes("https://d3jbb8n5wk0qxi.cloudfront.net/recipes-malformed.json")
            XCTFail("fetchRecipes() should have thrown an error") // Should never reach here
        } catch let error as NSError {
            XCTAssertNotNil(error)
        }
    }
    
}
