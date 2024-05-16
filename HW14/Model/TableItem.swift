import Foundation

struct TableItem : Identifiable {
    var id : String = UUID().uuidString
    let image : String
    let text : String
    
    static func getMockStackData() -> [TableItem] {
        [
            TableItem(image: "bicycle", text: "Мы великие таланты,"),
            TableItem(image: "polo", text: "Но понятны и просты."),
            TableItem(image: "basketball", text: "Мы певцы и музыканты,"),
            TableItem(image: "flag", text: "Акробаты и шуты.")
        ]
    }
}
