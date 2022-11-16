//
//  ContentView.swift
//  homework3
//
//  Created by robert on 2022/11/11.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("「煩」人修仙傳模擬器")
                    .padding()
                Image("small").resizable().scaledToFit().frame(width: 200, height: 200)
                NavigationLink {
                                    MainView()
                                } label: {
                                    Text("開始遊戲")
                                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
