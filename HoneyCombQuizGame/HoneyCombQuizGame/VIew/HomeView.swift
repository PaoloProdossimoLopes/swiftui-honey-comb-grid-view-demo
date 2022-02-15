//
//  HomeView.swift
//  HoneyCombQuizGame
//
//  Created by Paolo Prodossimo Lopes on 15/02/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var currentPuzzle = puzzlesMock[0]
    
    var body: some View {
        VStack {
            
            VStack {
                //Header player
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrowtriangle.backward.square.fill")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Image(systemName: "speaker.wave.2.fill")
                            .font(.title)
                            .padding()
                            .background(Color(UIColor.systemBlue.withAlphaComponent(0.6)), in: Circle())
                            .foregroundColor(.black)
                    }
                }
                .overlay {
                    Text("Level 1").font(.title.bold())
                }
                
                //Puzzle Image
                Image(currentPuzzle.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .padding()
                
                //Puzzle fill blanks
                HStack(spacing: 10) {
                    ForEach(0..<currentPuzzle.awnser.count, id:\.self) { index in
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color(UIColor.systemBlue.withAlphaComponent(0.6)))
                                .frame(height:60)
                        }
                    }
                }
            }
            .padding()
            .background(.white, in: RoundedRectangle(cornerRadius: 15))
            
            //Custom Honey comb
            
            //NExt Button
            Button {
                
            } label: {
                Text("Next")
                    .font(.title2.bold())
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(maxWidth: .infinity)
                    .background(Color(UIColor.systemBlue.withAlphaComponent(0.6)),
                                in: RoundedRectangle(cornerRadius: 15))
            }
                .padding(.top)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color.gray.opacity(0.2))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
