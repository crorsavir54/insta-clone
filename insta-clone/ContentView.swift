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
        PostView()
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
