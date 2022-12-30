//
//  RemoveIcon.swift
//  Travel plan app
//
//  Created by Виталий on 25.12.2022.
//

import SwiftUI

struct RemoveIcon: View {
    var body: some View {
        ZStack {
            HStack {
                Spacer()
                VStack {
                    Image
                        .init(systemName: "trash.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .colorInvert()
                    .padding()
                    Spacer()
                }
            }
        }.frame(width: 300, height: 400)
    }
}

struct RemoveIcon_Previews: PreviewProvider {
    static var previews: some View {
        RemoveIcon()
    }
}
