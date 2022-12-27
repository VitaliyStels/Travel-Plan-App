//
//  Trip.swift
//  Travel plan app
//
//  Created by Виталий on 21.12.2022.
//

import SwiftUI
import Foundation

class Trip: Identifiable, Codable {
    var id : String
//    var cardColor : Color = Color.green
    var name : String
    var ticketsPrice : Int
    var foodPrice : Int
    var apartmentPrice : Int
    var entertainmentPrice : Int

//    init(id : String, cardColor : Color, name: String, ticketsPrice: Int, foodPrice: Int, apartmentPrice: Int, entertainmentPrice: Int){
    init(id : String, name: String, ticketsPrice: Int, foodPrice: Int, apartmentPrice: Int, entertainmentPrice: Int){
        self.id = id
//        self.cardColor = cardColor
        self.name = name
        self.ticketsPrice = ticketsPrice
        self.foodPrice = foodPrice
        self.apartmentPrice = apartmentPrice
        self.entertainmentPrice = entertainmentPrice
    }

}
