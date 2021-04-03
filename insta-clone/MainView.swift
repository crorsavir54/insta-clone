//
//  MainView.swift
//  insta-clone
//
//  Created by root on 4/3/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        
        TabView{
            
            NavigationView{
                ContentView()
                    .navigationBarTitle("InstaClone")
                    .navigationBarItems(trailing: Button(action: {}, label: {
                        Image(systemName: "paperplane")
                        .resizable()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 26, height: 26)
                    }).foregroundColor(Color("DarkAndWhite"))
                                            
                    )
                
            }.tabItem { Image(systemName: "house") }
            
            Text("Discover").tabItem {
                Image(systemName: "magnifyingglass")
            }
            Text("Add").tabItem {
                Image(systemName: "plus.square")
            }
            Text("Activity").tabItem {
                Image(systemName: "heart.fill")
            }
            Text("User").tabItem {
                Image(systemName: "person")
            }
            
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
