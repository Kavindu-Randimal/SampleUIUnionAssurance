//
//  Network.swift
//  Union Assurance
//
//  Created by Randimal Geeganage on 2022-11-24.
//

import Foundation
import SwiftUI

struct DataModel: Decodable{
    var title : String?
    var sub_title: String?
    var is_completed : Bool
    var expire_date : String
    var image : String?
    var id : String
}

class ViewModel : ObservableObject {
    
    @Published var hotels = [DataModel]()
    
    func fetch(){
        guard let url = URL(string: "https://621f4674311a70591407189f.mockapi.io/rewards") else {
            return
        }
        
        URLSession.shared.dataTask(with: url){ (data, res, err) in
            do{
                if let data = data{
                    
                    let result = try JSONDecoder().decode([DataModel].self, from: data)
                    DispatchQueue.main.async {
                        self.hotels = result 
                    }
                    
                }else{
                    print("no data")
                }
            }catch (let error){
                print(error.localizedDescription)
            }
            
        }
        .resume()
    }
}
