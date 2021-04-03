//
//  PostView.swift
//  insta-clone
//
//  Created by root on 4/3/21.
//

import SwiftUI
import FirebaseFirestore
import SDWebImageSwiftUI

struct PostView: View {
    
    @ObservedObject var observed = observer()
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack{
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(observed.status){ i in
                            StoryCard(imgName: i.image).padding(5)
                            
                        }
                    }
                }
                ForEach(observed.status){ i in
                    PostCard(postImage: i.image, userName: i.name, userLoc: i.location).padding(0)
            }
        }.animation(.spring())
    }
}
}

struct StoryCard: View {
    var imgName = ""
    var body: some View{
        AnimatedImage(url: URL(string: imgName))
            .resizable()
            .frame(width: 80, height: 80, alignment: .center)
            .clipShape(Circle())
    }
}


struct PostCard: View {
//    var userImage = ""
    var postImage = ""
    var userName = ""
    var userLoc = ""
//
    var body: some View{
        VStack(alignment: .leading){
            
            HStack{
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 30, height: 30, alignment: .leading)
                    .clipShape(Circle())
                VStack(alignment: .leading){
                    Text("\(userName)")
                    Text("\(userLoc)")
                }
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "ellipsis")
                }).foregroundColor(Color("DarkAndWhite"))
            }.padding()
            
            AnimatedImage(url: URL(string: postImage))
                .resizable()
                .frame(height: 350, alignment: .center)
            HStack{
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "suit.heart")
                        .font(.system(size: 30, weight: .light))
                }).foregroundColor(Color("DarkAndWhite"))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bubble.right")
                        .font(.system(size: 30, weight: .light))
                }).foregroundColor(Color("DarkAndWhite"))
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "paperplane")
                        .font(.system(size: 30, weight: .light))
                }).foregroundColor(Color("DarkAndWhite"))
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 30, weight: .light))
                }).foregroundColor(Color("DarkAndWhite"))
            }.padding(8)
            Group{
                Text("5 likes")
                Text("\(userName)")
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("View all comments")
                        .font(.system(size: 15, weight: .light ))
                }).foregroundColor(Color("DarkAndWhite"))
            }
            .padding(.leading, 10)
            
        }
        
    }
    
}


class observer : ObservableObject {
    @Published var status = [datatype]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("status").addSnapshotListener{ (snap, err) in
            
            if err != nil {
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documentChanges {
                if i.type == .added {
                    let id = i.document.documentID
                    let name = i.document.get("name") as! String
                    let location = i.document.get("location") as! String
                    let image = i.document.get("image") as! String
                    self.status.append(datatype(id: id, name: name, location: location, image: image))
                }
            }
        }
    }
    
}

struct datatype : Identifiable {
    var id : String
    var name: String
    var location: String
    var image: String
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView()
    }
}









//        GeometryReader{ geometry in
//            VStack(alignment: .leading){
//                HStack{
//                    Image("Image")
//                        .resizable()
//                        .clipShape(Circle())
//                        .frame(maxWidth: 32.0, maxHeight: 32.0)
//                    VStack(alignment: .leading){
//                        Text("username")
//                            .font(.headline)
//                        Text("location")
//                            .font(.subheadline)
//                    }
//                    Image(systemName: "ellipsis")
//                        .padding(.leading, geometry.size.width*0.55)
//                }
//                .padding(.leading, 15)
//                Image("Image")
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: geometry.size.width)
//                HStack{
//                    Group{
//                        Image(systemName: "heart")
//                        Image(systemName: "bubble.right")
//                        Image(systemName: "paperplane")
//                        Image(systemName: "bookmark")
//                            .padding(.leading, geometry.size.width*0.60)
//                    }
//                }
//                .padding(.leading, 15)
//                .font(.title2)
//                Text("15 likes")
//                    .font(.headline)
//                    .padding(.leading, 15)
//                VStack(alignment: .leading){
//                    Text("username")
//                        .font(.headline)
//                    Text("description..")
//                        .font(.subheadline)
//                }
//                .padding(.leading, 15)
//
//                HStack{
//                    Image("Image")
//                        .resizable()
//                        .clipShape(Circle())
//                        .frame(maxWidth: 32.0, maxHeight: 32.0)
//                    Text("Add a comment...")
//                        .font(.subheadline)
//                        .frame(width: geometry.size.width*0.63, alignment: .leading)
//                    Text("❤️ 🙌 ...")
//
//                }
//                .padding(.leading, 15)
//                Text("1 hour ago")
//                    .font(.subheadline)
//                    .padding(.leading, 10)
//            }
//        }
