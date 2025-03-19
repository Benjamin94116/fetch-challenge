import Foundation

struct Recipe: Decodable, Identifiable {
    var id: String { name }
    let name: String
    let uuid: String
    let cuisine: String
    let photoUrlLarge: URL?
    let photoUrlSmall: URL?
    let sourceUrl: URL?
    let youtubeUrl: URL?
}
