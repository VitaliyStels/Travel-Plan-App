//
//  ManageTripsCard.swift
//  Travel plan app
//
//  Created by Виталий on 24.12.2022.
//

import SwiftUI

struct ManageTripsCard: View {
    var body: some View {
        ZStack {
        
        Rectangle()
            .fill(.red)
            .frame(width: 270, height: 350)
            .cornerRadius(30)
        
        VStack {
            Image
                .init(systemName: "pencil.circle")
                .resizable()
                .frame(width: 110, height: 110)
                .colorInvert()
            Text("Manage trips")
                .foregroundColor(.white)
                .font(.system(size: 18))
        
        }
            
        }
    }
}

struct ManageTripsCard_Previews: PreviewProvider {
    static var previews: some View {
        ManageTripsCard()
    }
}
