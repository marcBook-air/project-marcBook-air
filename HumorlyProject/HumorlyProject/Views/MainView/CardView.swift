//
//  CardView.swift
//  Humorly
//
//  Created by Marc Vlasblom on 15/12/2021.
//

import SwiftUI

struct CardView: View {
    @State private var translation: CGSize = .zero
    @State private var swipeStatus: LikeDislike = .none
    
    private var meme: Meme
    private var onRemove: (_ meme: Meme) -> Void
    
    private var thresholdPercentage: CGFloat = 0.5
    
    private enum LikeDislike: Int {
        case like, dislike, none
    }
    
    init(meme: Meme, onRemove: @escaping (_ meme: Meme) -> Void) {
        self.meme = meme
        self.onRemove = onRemove
        
    }
    private func getGesturePercentage(_ geometry: GeometryProxy, from gesture: DragGesture.Value) -> CGFloat {
        gesture.translation.width / geometry.size.width
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Image(self.meme.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .background(Color.white.opacity(0.99))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .animation(.interactiveSpring())
                    .offset(x: self.translation.width, y: 0)
                    .rotationEffect(.degrees(Double(self.translation.width / geometry.size.width) * 25), anchor: .bottom)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                self.translation = value.translation
                                
                                if (self.getGesturePercentage(geometry, from: value)) >= self.thresholdPercentage {
                                    self.swipeStatus = .like
                                } else if self.getGesturePercentage(geometry, from: value) <= -self.thresholdPercentage {
                                    self.swipeStatus = .dislike
                                } else {
                                    self.swipeStatus = .none
                                }
                            }.onEnded { value in
                                if abs(self.getGesturePercentage(geometry, from: value)) > self.thresholdPercentage {
                                    self.onRemove(self.meme)
                                } else {
                                    self.translation = .zero
                                }
                            }
                    )
                if self.swipeStatus == .like {
                    Text("LIKE")
                        .font(.headline)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(Color.green)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.green, lineWidth: 3.0)
                        ).padding(.top)
                } else if self.swipeStatus == .dislike {
                    Text("DISLIKE")
                        .font(.headline)
                        .padding()
                        .cornerRadius(10)
                        .foregroundColor(Color.red)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.red, lineWidth: 3.0)
                        ).padding(.top)
                    
                }
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(meme: Meme(id: 1, imageName: "meme1", description: ""),
                 onRemove: { _ in
        })
            .frame(height: 400)
            .padding()
    }
}
