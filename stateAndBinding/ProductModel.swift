//
//  ProductModel.swift
//  stateAndBinding
//
//  Created by mac on 9/30/24.
//
import Foundation

struct ProductModel:Identifiable {
    var id:Int
    var name:String
    var price:Int
    var photo:String
    var location:String
    var startsCount:Int
    
    init(id: Int, name: String, price: Int, photo: String, location: String, startsCount: Int) {
        self.id = id
        self.name = name
        self.price = price
        self.photo = photo
        self.location = location
        self.startsCount = startsCount
    }
}
