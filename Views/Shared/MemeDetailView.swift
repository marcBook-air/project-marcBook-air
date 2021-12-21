//
//  MemeDetailView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 20/12/2021.
//

import SwiftUI

struct MemeDetailView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var items : [Any] = []
    @State var sheet = false
    
    var meme: Meme
    var memeIndex: Int {
        modelData.memes.firstIndex(where: {$0.id == meme.id})!
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    // when taped on meme you can share it
                    Button(
                        action: {
                            items.removeAll()
                            items.append(UIImage(named: meme.imageName)!)
                            sheet.toggle()
                        }, label: {
                            MemeDetailHelperView(image: meme.image)
                        })
                        .sheet(isPresented: $sheet, content: {
                            shareSheet(items: items)
                        })
                    
                    // title and category banner
                    HStack {
                        VStack(alignment: .leading) {
                            // name of meme
                            Text(meme.name)
                                .multilineTextAlignment(.leading)
                                .font(.headline)
                            
                            // category of meme
                            Text(meme.category.rawValue)
                                .font(.subheadline)
                        }
                        .padding()
                        Spacer()
                        
                        // button to add meme to favorites
                        FavoriteButtonView(isSet: $modelData.memes[memeIndex].isFavorite)
                            .padding()
                    }
                    .padding()
                    .frame(width: 360, height: 90)
                    .background(Color.red.opacity(0.4))
                    .cornerRadius(10)
                    .shadow(color: .red, radius: 7)
                }
            }
        }
    }
}

struct MemeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MemeDetailView(meme: ModelData().memes[0])
    }
}

// struct to enable sharesheed to pop up when meme is taped
// source https://youtu.be/WZOvroeUuxI
struct shareSheet : UIViewControllerRepresentable {
    var items : [Any]
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(activityItems: items, applicationActivities: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
