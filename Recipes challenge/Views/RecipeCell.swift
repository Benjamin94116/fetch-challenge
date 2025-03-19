
import SwiftUI

struct RecipeCell: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: Layout.standard) {
            // Recipe Image
            AsyncImage(url: recipe.photoUrlSmall) { image in
                image.resizable()
                    .scaledToFill()
            } placeholder: {
                Image(systemName: "carrot")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
            .frame(width: Layout.photoHeightWidth, height: Layout.photoHeightWidth)
            .clipShape(RoundedRectangle(cornerRadius: Layout.recipeImageCornerRadius))
            
            // Texts next to image
            VStack(alignment: .leading, spacing: Layout.TitleSubtitleSpacing) {
                Text(recipe.name)
                    .font(.headline)
                
                Text(recipe.cuisine)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer() // Pushes text to the left
        }
        .padding(.vertical, Layout.tableViewPadding)
    }
    
}

