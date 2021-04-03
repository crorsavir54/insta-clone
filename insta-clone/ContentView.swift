//
//  ContentView.swift
//  insta-clone
//
//  Created by root on 4/3/21.
//

import SwiftUI
import CoreData

struct ContentView: View {

    var body: some View {
        VStack{
            HStack {
                Text("Instaclone")
                    .padding()
                Image(systemName: "paperplane")
                    .padding(.leading, 200)
            }
            .font(.title)
            .frame(maxWidth: .infinity, maxHeight: 50, alignment: .leading)
            .background(Color.white)
            ScrollView{
                PostView()
                PostView()
                PostView()
                
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
