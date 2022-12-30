//
//  HalloCard.swift
//  Travel plan app
//
//  Created by Виталий on 28.12.2022.
//

import SwiftUI

struct HalloCard: View {
    var cardColors : [Color] = [Color.purple, Color.green, Color.yellow, Color.black, Color.gray, Color.blue, Color.brown, Color.indigo]
    
    @State var cardColor : Color = Color.purple
    @State var cardWasPressed = false
    var cardName : String = "Hallo!"
    var cardSystemImage = "hand.raised"
    var cardTicketsPrice : String = "$$$"
    var cardFoodPrice : String = "$$$"
    var cardApartmentPrice : String = "$$$"
    var cardEntertainmentPrice : String = "$$$"
    
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
                    .frame(width: 30, height: 40)
                    .colorInvert()
                    .padding()
                Spacer()
                
            }
            
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text(cardName)
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .bold))
                    
                    CommonText(commonTextsText: "Tickets: \(cardTicketsPrice)")
                        .opacity(0.80)
                    CommonText(commonTextsText: "Food: \(cardFoodPrice)")
                        .opacity(0.60)
                    CommonText(commonTextsText: "Apartment: \(cardApartmentPrice)")
                        .opacity(0.40)
                    CommonText(commonTextsText: "Entertainment: \(cardEntertainmentPrice)")
                        .opacity(0.20)
                    
                    HStack {
                        Text("You can create or delete trip with buttons below")
                            .foregroundColor(.white)
                        .font(.system(size: 17))
                        
                        Image
                            .init(systemName: "arrow.down.circle.fill")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .offset(y: cardWasPressed ? 20 : 0)
                            .animation(.easeIn(duration: 0.2).repeatCount(3), value: cardWasPressed)
                    }
                    
                    Spacer()
                    Text("This card will disappear automatically")
                        .foregroundColor(.white)
                        .font(.system(size: 14))

                    
                }.padding()
                Spacer()
            }.frame(width:300)
            
            Spacer()
            
        }.frame(width: 300, height: 400)
          
            
            
        }
        .onTapGesture {
            let choosedColor = cardColors.randomElement()
            withAnimation(.spring()) {
            cardWasPressed.toggle()
                if choosedColor != cardColor {
                    cardColor = choosedColor ?? Color.purple
                }
            }
        }
    }
}

struct HalloCard_Previews: PreviewProvider {
    static var previews: some View {
        HalloCard()
    }
}
