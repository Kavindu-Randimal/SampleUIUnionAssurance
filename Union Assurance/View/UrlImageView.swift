//
//  UrlImageView.swift
//  Union Assurance
//
//  Created by Randimal Geeganage on 2022-11-25.
//

import SwiftUI

struct UrlImageView: View {
    @ObservedObject var urlImageModel: UrlImageModel
        
        init(urlString: String?) {
            urlImageModel = UrlImageModel(urlString: urlString)
        }
        
        var body: some View {
            Image(uiImage: urlImageModel.image ?? UrlImageView.defaultImage!)
                .resizable()
                .cornerRadius(10)
                .frame(width: 320, height: 140)
                
                
        }
        
        static var defaultImage = UIImage(named: "hotel")
}

struct UrlImageView_Previews: PreviewProvider {
    static var previews: some View {
        UrlImageView(urlString: nil)
    }
}
