//
//  CharacterDetailView.swift
//  RickAndMotryApi
//
//  Created by Andrew Ananda on 26/08/2024.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: CharacterModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
          VStack {

              
              ZStack(alignment: .topLeading) {
                  
                  AsyncImage(url: URL(string: character.image)) { image in
                      image
                          .resizable()
                          .aspectRatio(contentMode: .fill)
                          .frame(width: UIScreen.main.bounds.width, height: 400)
                          .cornerRadius(20)
                          .padding(.horizontal, 20)
                  } placeholder: {
                      ProgressView()
                          .progressViewStyle(CircularProgressViewStyle())
                          .frame(width: UIScreen.main.bounds.width, height: 400)
                          .cornerRadius(20)
                          .padding(.horizontal, 20)
                  }
                  .clipShape(RoundedRectangle(cornerRadius: 20))
                  .padding(.bottom, 20)
                  
                  HStack {
                      Button(action: {
                          presentationMode.wrappedValue.dismiss()
                      }) {
                          Image(systemName: "arrow.left")
                              .padding(10)
                              .foregroundColor(Color(UIColor.label))
                              .background(Circle().fill(Color(UIColor.systemBackground)))
                              .shadow(radius: 4)
                      }
                      Spacer()
                  }
                  .padding(.leading, 30)
                  .padding(.top, 60)
                  
                  
              }
              
              // Character Details
              VStack {
                  HStack {
                      VStack(alignment: .leading, spacing: 4) {
                          Text(character.name)
                              .font(.system(size: 18, weight: .bold))
                              .foregroundColor(.listItemCharacterName)
                              .frame(alignment: .leading)
                          
                          Text("\(character.species) • \(character.gender)")
                              .font(.system(size: 14, weight: .medium))
                              .foregroundColor(.gray)
                              .frame(alignment: .leading)
                          
                          if let origin = character.origin.name {
                              Text("Location: \(origin)")
                                  .font(.system(size: 14, weight: .semibold))
                                  .foregroundColor(.listItemCharacterName)
                                  .frame(alignment: .leading)
                                  .padding(.top, 10)
                          }
                      }
                      Spacer()
                      
                      Text(character.status)
                          .font(.system(size: 14, weight: .semibold))
                          .foregroundColor(.white)
                          .padding(.horizontal, 12)
                          .padding(.vertical, 6)
                          .background(Color.blue)
                          .cornerRadius(20)
                  }
              }
              .padding(.horizontal, 20)
              .padding(.top, 10)
              
              Spacer()
          }
          .navigationBarHidden(true)
          .edgesIgnoringSafeArea(.all)
      }
        
        
        
    }
