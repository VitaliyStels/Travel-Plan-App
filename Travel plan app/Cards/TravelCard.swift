//
//  TravelCard.swift
//  Travel plan app
//
//  Created by Виталий on 21.12.2022.
//

import SwiftUI

struct TravelCard: View {
    let cardColor : Color = Color.yellow
    var cardName : String
    var cardSystemImage = "airplane"
    var cardTicketsPrice : Int
    var cardFoodPrice : Int
    var cardApartmentPrice : Int
    var cardEntertainmentPrice : Int
    var cardCurrency : String
    
    var body: some View {
        ZStack {
        
        Rectangle()
                .fill(cardColor)
            .frame(width: 300, height: 400)
            .cornerRadius(30)
        
        VStack {
            HStack {
                Image
                    .init(systemName: cardSystemImage)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .colorInvert()
                    .padding()
                Spacer()
                
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(cardName)
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                    
                    CommonText(commonTextsText: "Tickets: \(cardCurrency)\(cardTicketsPrice)")
                    CommonText(commonTextsText: "Food: \(cardCurrency)\(cardFoodPrice)")
                    CommonText(commonTextsText: "Apartment: \(cardCurrency)\(cardApartmentPrice)")
                    CommonText(commonTextsText: "Entertainment: \(cardCurrency)\(cardEntertainmentPrice)")
                    
                }.padding()
                Spacer()
            }.frame(width:300)
            
            Spacer()
            
        }.frame(width: 300, height: 400)
            
        }
    }
}

struct TravelCard_Previews: PreviewProvider {
    static var previews: some View {
        TravelCard(cardName: "Card Name City", cardTicketsPrice: 10, cardFoodPrice: 100, cardApartmentPrice: 1500, cardEntertainmentPrice: 240, cardCurrency: "$")
    }
}
