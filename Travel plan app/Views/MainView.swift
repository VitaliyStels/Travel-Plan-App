//
//  ContentView.swift
//  Travel plan app
//
//  Created by Виталий on 21.12.2022.
//

import SwiftUI
import Foundation


struct MainView: View {
    @State var data : [Trip]
    @State var halloWindowShows : Bool
    
    init() {
        if let rawData = UserDefaults.standard.data(forKey: "SavedData") {
            if let decoded = try? JSONDecoder().decode([Trip].self, from: rawData) {
                data = decoded
                halloWindowShows = false
                return
            }
        }
        data = []
        halloWindowShows = true

    }
    
    @State var creatingNewTrip = false
    @State var creatingCardNameField = ""
    @State var creatingCardTicketsPriceField = ""
    @State var creatingCardFoodPriceField = ""
    @State var creatingCardApartmentPriceField = ""
    @State var creatingCardEntertainmentPriceField = ""
    @State var minimalMode = false
    @State var managingMode = false
    
    
    func removeTrip(withId: String) {
        if let i = data.firstIndex(where: {$0.id == withId}) {
            data.remove(at: i)
        }
    }
    
    func saveData() {
        if let encoded = try? JSONEncoder().encode(data) {
            UserDefaults.standard.set(encoded, forKey: "SavedData")
            print("Data saved")
        }
    }
    
    var body: some View {
        if !creatingNewTrip {
            ScrollView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                   
                    
                    ForEach(data.reversed()) { Trip in
                        
                        ZStack {
                            
                            TravelCard(cardName: Trip.name, cardTicketsPrice: Trip.ticketsPrice, cardFoodPrice: Trip.foodPrice, cardApartmentPrice: Trip.apartmentPrice, cardEntertainmentPrice: Trip.entertainmentPrice)
                             
                                RemoveIcon()
                                    .opacity(managingMode ? 1 : 0)
                                    .onTapGesture {
                                        if managingMode {
                                            removeTrip(withId: Trip.id)
                                            print("Removed Trid with id: \(Trip.id)")
                                            saveData()
                                        }
                                        
                                    }
                                    .animation(.easeInOut(duration: 0.1), value: managingMode)
                                
                            TripTotals(tripTotals: Trip.ticketsPrice + Trip.foodPrice + Trip.apartmentPrice + Trip.entertainmentPrice)
                            
                        }

                    }.padding(.leading, 10)
                        .padding(.bottom, 10)

                    
                    if halloWindowShows {
                        HalloCard()
                            .padding(.leading, 10)
                            .padding(.bottom, 10)
                    }
                }
            }
            
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        CreateTripCard().onTapGesture {
                            managingMode = false
                            creatingNewTrip.toggle()
                        }
                        .frame(height: minimalMode ? 200 : 300)
                        .animation(.easeIn, value: minimalMode)
                        .cornerRadius(30)
                        
                        ManageTripsCard()
                            .frame(height: minimalMode ? 200 : 300)
                            .animation(.easeIn, value: minimalMode)
                            .cornerRadius(30)
                            .onTapGesture {
                                managingMode.toggle()
                            }
                        
                    }.padding(.leading, 10)
                        
                }
                
                InfoCard()
                    
                    .frame(height: minimalMode ? 50 : 100)
                    .onTapGesture {
//                        minimalMode.toggle()
                    }
            }
        }
        
        else {
            
                
            
            VStack(spacing: 14) {
                Spacer()
                
                TextField("Card Name", text: $creatingCardNameField)
                TextField("tickets Price", text: $creatingCardTicketsPriceField)
                TextField("food Price", text: $creatingCardFoodPriceField)
                TextField("apartment Price", text: $creatingCardApartmentPriceField)
                TextField("entertainment Price", text: $creatingCardEntertainmentPriceField)
                
                Spacer()
                
                HStack(spacing: 34) {
                    Button("Cancel") {
                        creatingNewTrip.toggle()
                        creatingCardNameField = ""
                        creatingCardTicketsPriceField = ""
                        creatingCardFoodPriceField = ""
                        creatingCardApartmentPriceField = ""
                        creatingCardEntertainmentPriceField = ""
                    }
                    
                    Spacer()
                    
                    Button("Create") {
                        let uuid = UUID().uuidString
                        data.append(Trip(id: uuid, name: creatingCardNameField, ticketsPrice: Int(creatingCardTicketsPriceField) ?? 0, foodPrice: Int(creatingCardFoodPriceField) ?? 0, apartmentPrice: Int(creatingCardApartmentPriceField) ?? 0, entertainmentPrice: Int(creatingCardEntertainmentPriceField) ?? 0))
                        creatingNewTrip.toggle()
                        saveData()
                        print("Trip was created: \(uuid)")
                    }
                    
                }
            }
            .frame(width: 330)
            
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
}
