//
//  Reward.swift
//  Union Assurance
//
//  Created by Randimal Geeganage on 2022-11-24.
//

import SwiftUI

struct Reward: View {
    
    @State private var selection = 0;
    @StateObject var viewModel = ViewModel()
    var body: some View {
        
        ScrollView(showsIndicators: false){
            ZStack{
                Image("coverrec")
                    .resizable()
                    .rotationEffect(.radians(.pi))
                    .aspectRatio(contentMode: .fit)
                VStack{
                    HStack{
                        Spacer()
                        Text("Rewards")
                            .font(.system(size: 20))
                            .fontWeight(.heavy)
                            .foregroundColor(.white)
                            .padding(.leading,20)
                        Spacer()
                        Image(systemName: "bell")
                            .foregroundColor(Color.white)
                            .padding(.trailing,10)
                        
                    }
                    .padding(.bottom,10)
                    Text("UNION")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("ASSURANCE")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                    Text("Insurance cover from union assurance")
                        .font(.system(size: 15))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.bottom,10)
                    Button(action: {
                        print("insurance covered")
                    }) {
                        Text("Insurance Cover")
                            .frame(minWidth: 0, maxWidth: 180 )
                            .font(.system(size: 18))
                            .fontWeight(.bold)
                            .padding()
                            .foregroundColor(.basiccolor)
                            .overlay(
                                RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.white, lineWidth: 2)
                            )
                    }
                    
                    .background(Color.white)
                    .cornerRadius(20)
                    
                    .padding(.top,20)
                    
                }
                
            }
            VStack{
                Picker("What is your selection?", selection: $selection) {
                    Text("All").tag(0)
                    Text("Goat").tag(1)
                    Text("Partner").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 250,height: 60)
                
            }
            VStack{
                VStack(alignment: .leading){
                    Text("Completed Rewards")
                        .fontWeight(.bold)
                        .font(.system(size: 15))
                        .padding(.leading,10)
                    
                    ScrollView (.horizontal,showsIndicators: false){
                        HStack(spacing: 20) {
                            ForEach (viewModel.hotels, id: \.id){
                                hotel in
                                VStack(alignment: .leading){
                                    UrlImageView(urlString: hotel.image)
                                    Text(hotel.title!)
                                        .foregroundColor(.black)
                                        .padding(.leading)
                                        .fontWeight(.bold)
                                    Text(hotel.sub_title!)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                        .lineLimit(10)
                                        .padding(.leading)
                                        .fontWeight(.bold)
                                    HStack{
                                        Text("Expire date:")
                                            .foregroundColor(.red)
                                            .font(.system(size: 12))
                                        Text(hotel.expire_date)
                                            .foregroundColor(.red)
                                            .font(.system(size: 12))
                                    }
                                    .padding()
                                    
                                    
                                }
                                .frame(width:320, height: 270)
                                .background(Color.white)
                                .cornerRadius(10)
                                .padding(.leading)
                            }
                        }.onAppear(perform: {viewModel.fetch()
                        })
                    }
                }
            }
            
            
            VStack(alignment: .leading){
                Text("Completed Rewards")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .padding(.leading,10)
                
                ScrollView (.horizontal,showsIndicators: false){
                    HStack(spacing: 20) {
                        ForEach (viewModel.hotels, id: \.id){
                            hotel in
                            VStack(alignment: .leading){
                                UrlImageView(urlString: hotel.image)
                                Text(hotel.title!)
                                    .foregroundColor(.black)
                                    .padding(.leading)
                                    .fontWeight(.bold)
                                Text(hotel.sub_title!)
                                    .foregroundColor(.gray)
                                    .font(.system(size: 12))
                                    .lineLimit(10)
                                    .padding(.leading)
                                    .fontWeight(.bold)
                                Text(hotel.expire_date)
                                    .foregroundColor(.red)
                                    .padding()
                                    .font(.system(size: 12))
                                
                            }
                            .frame(width:320, height: 270)
                            .background(Color.white)
                            .cornerRadius(10)
                            .padding(.leading)
                        }
                    }.onAppear(perform: {viewModel.fetch()
                    })
                }
            }
            
        }
        .ignoresSafeArea()
        .background(Color.background)
        
    }
    
}




extension Color {
    static let basiccolor = Color("basic")
    static let background = Color("background")
    static let logocolor = Color("LogoColor")

}




struct Reward_Previews: PreviewProvider {
    static var previews: some View {
        Reward()
    }
}
