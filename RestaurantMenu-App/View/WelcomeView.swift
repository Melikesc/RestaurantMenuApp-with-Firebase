//
//  WelcomeView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import SwiftUI

struct WelcomeView: View {

    @State private var navigateToHome = false
    @State private var showAdminView = false

    var body: some View {
        
        NavigationStack {
            ZStack {

                Image("rest")
                   .resizable()
                   .scaledToFill()
                   .edgesIgnoringSafeArea(.all)
                Spacer()

                VStack {

                    
                    
                    Spacer()
                    Spacer()
                    
                    VStack {
                        Text("Osmanlı Mutfağın Lezzetleri \n      X Restaurant")
                            .font(.system(size: 25))
                            .foregroundColor(.customBrown)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                        
                        Text("X Restaurant, sizlere eşsiz \nOsmanlı ve dünya mutfaklarının \nlezzetleri ile damak tadınıza lezzet \nkatacak yemekleri ve içecekleri ile \nhizmet vermektedir..")
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                    }
                    .padding(.top, 60)
                    .padding(.bottom, 20)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.customBG)
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 500)
                            .opacity(0.7)
                    )
                    
                    
                    
                    Button(action: {
                        navigateToHome = true
                    }) {
                        Text("Başlayalım →")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 250, height: 50)
                            .background(Color(.customOrange))
                            .cornerRadius(10)
                    }
                    .padding(.bottom, 70)
                    
                    Spacer()
                }
                
                
                Image("restaurant_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 440)
                    
            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
    }
}



#Preview {
    WelcomeView()
}
