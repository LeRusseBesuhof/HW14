import Foundation

struct TableItem : Identifiable {
    var id : String = UUID().uuidString
    let image : String
    let text : String
    
    static func getMockStackData() -> [[TableItem]] {
        [
            [TableItem(image: "bicycle", text: "Lorem ipsum dolor sit amet consectetur.")],
            [TableItem(image: "polo", text: "Lorem ipsum dolor sit amet consectetur.")],
            [TableItem(image: "basketball", text: "Lorem ipsum dolor sit amet")],
            [TableItem(image: "flag", text: "Lorem ipsum dolor sit amet")]
        ]
    }
}
