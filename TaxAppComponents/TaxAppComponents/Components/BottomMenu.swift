//
//  BottomMenu.swift
//  TaxAppComponents
//
//  Created by Shreya on 3/5/21.
//

import SwiftUI

struct BottomMenu: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Button(action: {
                    print("Button was tapped")
                }) { Image("pull_up") }
                Spacer().frame(height: 30)
                HStack(spacing: 45) {
                    Button(action: {
                        print("Button was tapped")
                    }) { Image("search") }
                    Button(action: {
                        print("Button was tapped")
                    }) { Image("add") }
                    Button(action: {
                        print("Button was tapped")
                    }) { Image("profile") }
                }.padding(.bottom,  80)
            }.padding(.top, 10)
            Spacer()
        }.background(Color.white).cornerRadius(40.0)
        
    }
}

struct BottomMenu_Previews: PreviewProvider {
    static var previews: some View {
        BottomMenu()
    }
}
