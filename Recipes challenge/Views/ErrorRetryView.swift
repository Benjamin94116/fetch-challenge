import SwiftUI

struct ErrorRetryView: View {
  let message: String
    let viewModel: RecipesListViewModel

  var body: some View {
    VStack {
      Text(message)
        .padding()

      Spacer()
        .frame(height: Layout.standard)

      Button("Retry") {
        Task {
            await viewModel.fectchRecipes()
        }
      }
    }
  }
}

