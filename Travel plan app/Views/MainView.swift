//
//  ContentView.swift
//  Travel plan app
//
//  Created by Виталий on 21.12.2022.
//

import SwiftUI
import Foundation


struct MainView: View {
    @State var creatingNewTrip = false
    @State var creatingCardNameField = ""
    @State var creatingCardTicketsPriceField = ""
    @State var creatingCardFoodPriceField = ""
    @State var creatingCardApartmentPriceField = ""
    @State var creatingCardEntertainmentPriceField = ""
    @State var creatingCardCurrencyField = ""
    @State var managingMode = false
    @State var tripSpendings = 0
    
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
    
    func clearCreatingMenu() {
        creatingCardNameField = ""
        creatingCardTicketsPriceField = ""
        creatingCardFoodPriceField = ""
        creatingCardApartmentPriceField = ""
        creatingCardEntertainmentPriceField = ""
    }
    
    var body: some View {
        if !creatingNewTrip {
            ScrollView {
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    
                   
                    
                    ForEach(data.reversed()) { Trip in
                        ZStack {
                            
                            TravelCard(cardName: Trip.name, cardTicketsPrice: Trip.ticketsPrice, cardFoodPrice: Trip.foodPrice, cardApartmentPrice: Trip.apartmentPrice, cardEntertainmentPrice: Trip.entertainmentPrice, cardCurrency: Trip.choosedCurrency)
                             
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
                            
                            
                            TripTotals(tripCurrency: Trip.choosedCurrency, tripTotals: Trip.ticketsPrice + Trip.foodPrice + Trip.apartmentPrice + Trip.entertainmentPrice)
                            
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
                        .cornerRadius(30)
                        
                        ManageTripsCard()

                            .cornerRadius(30)
                            .onTapGesture {
                                managingMode.toggle()
                            }
                        
                    }.padding(.leading, 10)
                        
                }
                
                StatisticsCard(countOfTrips: data.count)
                
            }
        }
        
        else {
            VStack(spacing: 14) {
                Spacer()
                
                TextField("Choose currency (leave clear to use $)", text: $creatingCardCurrencyField)
                TextField("Card Name", text: $creatingCardNameField)
                TextField("tickets Price", text: $creatingCardTicketsPriceField)
                TextField("food Price", text: $creatingCardFoodPriceField)
                TextField("apartment Price", text: $creatingCardApartmentPriceField)
                TextField("entertainment Price", text: $creatingCardEntertainmentPriceField)
                
                Spacer()
                
                HStack(spacing: 34) {
                    Button("Cancel") {
                        creatingNewTrip.toggle()
                        clearCreatingMenu()
                    }
                    
                    Spacer()
                    
                    Button("Create") {
                        let uuid = UUID().uuidString
                        if creatingCardNameField != "" {
                            if creatingCardCurrencyField == "" {
                                creatingCardCurrencyField = "$"
                            }
                            data.append(Trip(id: uuid, name: creatingCardNameField, ticketsPrice: Int(creatingCardTicketsPriceField) ?? 0, foodPrice: Int(creatingCardFoodPriceField) ?? 0, apartmentPrice: Int(creatingCardApartmentPriceField) ?? 0, entertainmentPrice: Int(creatingCardEntertainmentPriceField) ?? 0, choosedCurrency: creatingCardCurrencyField))
                            creatingNewTrip.toggle()
                            saveData()
                            print("Trip was created: \(uuid)")
                            clearCreatingMenu()
                        }
                        
                    }
                    
                }
            }
            .frame(width: 330)
        }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

