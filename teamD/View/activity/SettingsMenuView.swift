//
//  SettingsMenuView.swift
//  teamD
//
//  Created by Nicklas Düringer on 03.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct SettingsMenuView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var viewController = SettingsMenuViewController()
    
    @State private var music_switch : Bool = false
    @State private var sound_switch : Bool = false
    @State private var showToast = false


    var body: some View {
        ZStack {
            Image("zach_inglis_5jk6xg_7by4_unsplash_small")
            VStack {
                Text("Rush B")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .frame(width: 200)
                    .padding(48)
                VStack {
                    HStack {
                        Text("Einstellungen:")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    .padding(.bottom, 16)
                    HStack {
                        Text("Hintergrundmusik")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                            
                        Spacer()
                        Toggle(isOn: $music_switch){
                            
                        }.onChange(of: music_switch) { newValue in
                            self.viewController.onMusicSwitch()
                        }
                        .frame(maxWidth: 60)
                    }
                    .padding(.bottom, 8)
                    HStack {
                        Text("Sound-Effekte")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                        Toggle(isOn: $sound_switch){
                            
                        }.onChange(of: sound_switch) { newValue in
                            self.viewController.onSoundSwitch()
                            
                        }
                        .frame(maxWidth: 60)
                    }
                    .padding(.bottom, 16)
                    HStack {
                        Button(action: {
                            self.viewController.onHighscoreReset()
                            showToast = true
                        }, label: {
                            MenuButton(text: "HIGHSCORES ZURÜCKSETZEN", fontColor: Color(UIColor(hex: ColorValue.orange)), color: .white)
                        }).alert(isPresented: $showToast, content: {
                           Alert(title: Text("Highscores wurden zurückgesetzt."))
                        })
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor(hex: ColorValue.orange)))
                
                VStack {
                    Text("Projekt von: Noah Stürtz, Adrian Werner, Silas Buchwald")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
                .padding(.top, 128)
            }
            .fixedSize(horizontal: true, vertical: true)
        }
        .onReceive(self.viewController.$settings, perform: { settings in
            music_switch = settings.music
            sound_switch = settings.sound
        })
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }){
            MenuButton(text: "ZURÜCK", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
        })
    }
}

struct SettingsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsMenuView()
    }
}
