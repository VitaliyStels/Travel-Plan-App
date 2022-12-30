//
//  CreateTripCard.swift
//  Travel plan app
//
//  Created by Виталий on 21.12.2022.
//

import SwiftUI

struct CreateTripCard: View {
    var body: some View {
        ZStack {
        
        Rectangle()
            .fill(.orange)
            .frame(width: 270, height: 350)
            .cornerRadius(30)
        
        VStack {
            Image
                .init(systemName: "plus.circle")
                .resizable()
                .frame(width: 110, height: 110)
                .colorInvert()
            CommonText(commonTextsText: "Add trip")
        
        }
            
        }
    }
}

struct CreateTripCard_Previews: PreviewProvider {
    static var previews: some View {
        CreateTripCard()
    }
}
