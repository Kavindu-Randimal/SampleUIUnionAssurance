//
//  Home.swift
//  Union Assurance
//
//  Created by Randimal Geeganage on 2022-11-24.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack{
            Image("BgRemovedLogo")
                .resizable()
                .frame(width: 330, height: 120)
                .padding(50)
            
            Text("Developed By")
                .font(.system(size: 15))
                .foregroundColor(.logocolor)
            Text("Randimal Geeganage")
                .font(.system(size: 15))
                .fontWeight(.bold)
                .foregroundColor(.logocolor)
        }
        
    }

}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
