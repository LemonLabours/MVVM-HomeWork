import SwiftUI

struct Book: Identifiable {
    var id = UUID()
    var title: String
    var coverImageName: String
}

class BookViewModel: ObservableObject {
    @Published var books: [Book] = [
        Book(title: "Harry Potter", coverImageName: "hp"),
        Book(title: "Castle of Glass", coverImageName: "glass"),
        Book(title: "Educated", coverImageName: "educated")
    ]
    
    @Published var selectedBookID: UUID
    
    init() {
        if let selectedBookID = UserDefaults.standard.string(forKey: "selectedBookID") {
            self.selectedBookID = UUID(uuidString: selectedBookID) ?? UUID()
        } else {
            self.selectedBookID = UUID()
        }
    }
    
    func selectBook(book: Book) {
        selectedBookID = book.id
        UserDefaults.standard.set(selectedBookID.uuidString, forKey: "selectedBookID")
    }
    
    func updateBookCoverImage(newImageName: String) {
        guard let bookIndex = books.firstIndex(where: { $0.id == selectedBookID }) else {
            return
        }
        
        books[bookIndex].coverImageName = newImageName
    }
}

struct BookView: View {
    @StateObject private var viewModel = BookViewModel()
    
    var body: some View {
        VStack {

            
            List(viewModel.books) { book in
                Button(action: {
                    viewModel.selectBook(book: book)
                }) {
                    HStack {
                        Image(book.coverImageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text(book.title)
                            .font(.headline)
                    }
                }
            }
            .padding()
            
            Text("Selected Book: \(viewModel.books.first(where: { $0.id == viewModel.selectedBookID })?.title ?? "")")
                .font(.title)
                .padding()
            
            Image(viewModel.books.first(where: { $0.id == viewModel.selectedBookID })?.coverImageName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Button("Update Cover") {
                viewModel.updateBookCoverImage(newImageName: "worm")
            }
            .padding()
        }
    }
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView()
    }
}
