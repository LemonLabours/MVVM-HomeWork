import SwiftUI

struct FruitView: View {
    @StateObject private var viewModel = FruitViewModel()
    
    var body: some View {
        VStack {
            Text("Selected Fruit: \(viewModel.fruits.first(where: { $0.id == viewModel.selectedFruitID })?.name ?? "")")
                .font(.title)
                .padding()
            
            Image( viewModel.fruits.first(where: { $0.id == viewModel.selectedFruitID })?.imageName ?? "")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .padding()
            
            Button("Update Image") {
                viewModel.updateFruitImage(newImageName: "1")
            }
            .padding()
            
            List(viewModel.fruits) { fruit in
                Button(action: {
                    viewModel.selectFruit(fruit: fruit)
                }) {
                    HStack {
                        Image(systemName: fruit.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                        
                        Text(fruit.name)
                            .font(.headline)
                    }
                }
            }
            .padding()
        }
    }
}

struct FruitView_Previews: PreviewProvider {
    static var previews: some View {
        FruitView()
    }
}
