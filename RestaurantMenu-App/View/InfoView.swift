//
//  InfoView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.customBG
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                
                Image("restaurant_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.top, 80)
                
                
                    
                VStack(spacing: 10) {
                    Text("Geleneksel tariflere göre en kaliteli malzemeler kullanılarak büyük bir tutku ile servis edilmiş eşsiz Osmanlı ve Akdeniz mutfağının ve enfes hizmetimizin tadını çıkarın.")
                        .font(.system(size: 20))
                        .foregroundColor(Color(.customBrown))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 40)
                    
                    Text("Sizleri restoranımızda misafir olarak ağırlamaktan büyük mutluluk duyuyoruz..")
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(.black)
                        .padding(.horizontal, 30)
                }

                VStack(spacing: 20) {
                    
                    Text("Bize Ulaşın")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color(.customBrown))
                    
                    HStack {
                        Image(systemName: "phone")
                            .foregroundColor(.black)
                        Text("+90 000 000 00 00")
                            .font(.body)
                            .foregroundColor(.black)
                        
                    }
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        Text("info@x.com")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Image(systemName: "location")
                            .foregroundColor(.black)
                            .font(.title3)
                        
                        Text("X Mahallesi \nX Sk. No:5\n X/İstanbul")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    
                    HStack {
                        Image("insta")
                            .resizable()
                            .frame(width: 20, height: 20)
                            
                        Text("restaurantigname")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    
                }
                .padding(.top, 20)
                .padding(.bottom,40)
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.orange, Color.gray]), startPoint: .topLeading, endPoint: .bottomTrailing))
                        .frame(width: UIScreen.main.bounds.width * 0.9, height: 200)
                )
                
                Spacer() 
            }
            
        }
    }
}

#Preview {
    InfoView()
}
