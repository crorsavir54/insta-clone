//
//  PostView.swift
//  insta-clone
//
//  Created by root on 4/3/21.
//

import SwiftUI

struct PostView: View {
    var body: some View {
        VStack{
            HStack{
                Image("Image")
                    .renderingMode(.original)  // << here !!
                    .resizable()
                    .frame(width: 32.0)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    HStack{
                        Text("Username")
                            .font(.headline)
                        Image(systemName: "ellipsis")
                            .padding(.leading, 230)
                    }
                    Text("Location")
                        .font(.subheadline)
                }
            }.frame(maxWidth: .infinity, maxHeight: 32.0)
            Image("Image")
            HStack(spacing: 15){
                Image(systemName: "heart")
                Image(systemName: "bubble.right")
                Image(systemName: "paperplane")
                Image(systemName: "ellipsis")
                    .padding(.leading, 60)
                Image(systemName: "bookmark")
                    .padding(.leading, 130)
            }
            .font(.title2)
            .frame(maxWidth: .infinity, maxHeight: 32.0)
        }
        .padding(.top)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}
