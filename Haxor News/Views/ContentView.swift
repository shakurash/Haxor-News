import SwiftUI

struct ContentView: View {
 @ObservedObject   var apiManager = APIManager()
    var body: some View {
        NavigationView {
            List(apiManager.messages) { rowContent in
                NavigationLink(destination: DetailView(url: rowContent.url)) {
                HStack {
                    Text(String(rowContent.points))
                    Text(rowContent.title)
                }
                }
            }
        .navigationBarTitle("Hax News")
        }
    .onAppear {
    self.apiManager.performRequest()
    }
    
    
}
    }




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct Post: Identifiable {
//    let id: String
//    let title: String
//}

//let messages = [
//    Post(id: "1", title: "Wiadomosc1"),
//    Post(id: "2", title: "Wiadomosc2"),
//    Post(id: "3", title: "Wiadomosc3"),
//]
