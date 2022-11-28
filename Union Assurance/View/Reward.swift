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
    
    @State private var showingAlert = false
    @State private var coverAlert = false
    
    
    
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
                        
                        Button(action: { showingAlert = true
                        }){
                            Image(systemName: "bell")
                                .foregroundColor(Color.white)
                                .padding(.trailing)
                            
                        }.alert("Notification Empty", isPresented: $showingAlert) {
                            Button("OK") { }
                        }
                        
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
                        //                        print("insurance covered")
                        coverAlert = true
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
                            ).alert("Not implemented yet", isPresented: $coverAlert
                            ) {
                                Button("OK") { }
                            }
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
                                    HStack{ Text(hotel.sub_title!)
                                            .multilineTextAlignment(.leading)
                                            .foregroundColor(.gray)
                                            .font(.system(size: 12))
                                            .fontWeight(.bold)
                                    }
                                    .padding(.leading)
                                    .frame(width:310, height: 42)
                                    VStack{
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
                                    .padding(.bottom,30)
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
                                HStack{ Text(hotel.sub_title!)
                                        .multilineTextAlignment(.leading)
                                        .foregroundColor(.gray)
                                        .font(.system(size: 12))
                                    
                                        .fontWeight(.bold)
                                }
                                .padding(.leading)
                                .frame(width:310, height: 42)
                                VStack{
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
                                .padding(.bottom,10)
                                
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
func dateFromString(_ string: String) -> Date {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = .current
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: string) ?? Date()
}



struct Reward_Previews: PreviewProvider {
    static var previews: some View {
        Reward()
    }
}
