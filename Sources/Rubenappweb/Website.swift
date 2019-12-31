import Foundation
import Publish
import Plot

struct RubenAppWeb: Website {
    enum SectionID: String, WebsiteSectionID {
        case blog
    }

    struct ItemMetadata: WebsiteItemMetadata {}

    var url = URL(string: "https://ruben.app")!
    var name = "RubenApps"
    var description = "Desarrollo de aplicaciones sobre iOS e información sobre tecnología"
    var language: Language { .spanish }
    var imagePath: Path? { nil }
    var tagHTMLConfig: TagHTMLConfiguration? = nil
}
