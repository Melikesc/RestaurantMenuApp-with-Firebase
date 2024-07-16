//
//  InfoView.swift
//  RestaurantMenuApp
//
//  Created by Melike Sultan CAN on 10.07.2024.
//

import SwiftUI

struct InfoView: View {
    
    var body: some View {
        
        ZStack {
            
            Color.customBG
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                // Restoran logosu (örnek olarak bir resim)
                Image("restaurant_logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding(.top, 80) // Logoyu biraz aşağıdan başlatıyoruz
                
                
                    
                VStack(spacing: 10) { // VStack aralığını azaltmak için spacing kullanıyoruz
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
                        Text("+90 212 526 46 46")
                            .font(.body)
                            .foregroundColor(.black)
                        
                    }
                    
                    HStack {
                        Image(systemName: "envelope")
                            .foregroundColor(.black)
                        Text("info@lastapas.com")
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    
                    HStack {
                        Image(systemName: "location")
                            .foregroundColor(.black)
                            .font(.title3)
                        
                        Text("Alemdar Mahallesi \nÇataçeşme Sk. No:5\n Sultanahmet/İstanbul")
                            .font(.body)
                            .foregroundColor(.black)
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    
                    
                    HStack {
                        Image("insta") // Instagram ikonunu projeye eklediğinizi varsayıyoruz
                            .resizable()
                            .frame(width: 20, height: 20) // İkon boyutunu ayarlayın
                            
                        Text("las.tapasrestaurant")
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
                
                Spacer() // Boş alanı en alta ekliyoruz
            }
            
        }
    }
}

#Preview {
    InfoView()
}
