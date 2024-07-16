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
                Color.customBG
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                
                    Spacer()
                    
                    VStack{
                        Text("Las Tapas")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding(.top, 20)
                            
                        
                        Text("Restaurant")
                            .font(.system(size: 40))
                            .bold()
                            .foregroundColor(Color(.customOrange))
                    }.padding(.bottom, 150)
                    
                    
                    Spacer()
                    
                    VStack {
                        Text("Osmanlı Mutfağın Lezzetleri \n      Lastapas Restaurant")
                            .font(.title2)
                            .foregroundColor(.customBrown)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                        
                        Text("Lastapas Restaurant, sizlere eşsiz Osmanlı ve dünya mutfaklarının lezzetleri ile damak tadınıza lezzet katacak yemekleri ve içecekleri ile hizmet vermektedir..")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 40)
                            .padding(.top, 10)
                    }
                    .padding(.top, 60)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 400)
                    )
                    
                    Spacer()
                    
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
                    .padding(.bottom, 50)
                    
                    Spacer()
                }
                
                // Restoran logosu (örnek olarak bir resim)
                Image("restaurant_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 200)
                    .onLongPressGesture {
                        showAdminView = true
                    }
            }
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
            .navigationDestination(isPresented: $showAdminView) {
                AdminView()
            }
        }
    }
}



#Preview {
    WelcomeView()
}
