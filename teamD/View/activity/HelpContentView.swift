//
//  HelpContentView.swift
//  teamD
//
//  Created by FMA1 on 05.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct HelpContentView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
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
                            Text("Spielerläuterung")
                                .font(.system(size: 30, weight: .bold))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            Spacer()
                        }
                        .padding(.bottom, 16)
                        HStack {
                            ScrollView{
                                Text("Rush B bedeutet: Komme so schnell wie möglich von A nach B! \nDu bist ein Polizist im Einsatz, aber steckst mitten im Berufsverkehr. Bahne dir deinen Weg durch das Verkehrschaos, indem du die anderen Fahrzeuge verschiebst und die Rettungsgasse bildest.\nAlle Fahrzeuge können sich vorwärts und rückwärts bewegen. Tippe einfach auf die Seite des Fahrzeugs in deren Richtung es sich bewegen soll.\nSobald der Weg frei ist, musst du nur noch den Polizeiwagen über die schwarz-weiß karierte Ziellinie bewegen und das Level ist geschafft.\nWenn du einmal nicht mehr weiter kommst, kannst du das Level über den Button oben rechts wieder zurücksetzen.\nNachdem du ein Level durchgespielt hast, kannst du es auch noch einmal spielen, um deinen Highscore zu verbessern. \n\nIm Generated Modus geht es nur um Schnelligkeit. Es werden zufällig Level generiert und du musst versuchen diese so schnell wie möglich zu lösen bzw. so viele Level wie möglich in einer vorgegeben Zeit durchspielen. \n").lineLimit(nil)
                            }
                            Spacer()
                            
                        }.multilineTextAlignment(.leading)
                    }.padding()
                    .frame(maxWidth: 400)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }){
                MenuButton(text: "ZURÜCK", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
            })
        }
    }




struct HelpContentView_Previews: PreviewProvider {
    static var previews: some View {
        HelpContentView()
    }
}
