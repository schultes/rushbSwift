//
//  GameView.swift
//  teamD
//
//  Created by FMA1 on 05.09.21.
//  Copyright © 2021 FMA1. All rights reserved.
//

import SwiftUI

struct GameView: View {
    let level: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @StateObject var viewController = GameViewController()
    @Binding var shouldPopToRootView: Bool
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            if !viewController.isFinished {
                Image("zach_inglis_5jk6xg_7by4_unsplash_small")
                VStack {
                    Text(level > 0 ? "Rush B": "\(self.viewController.timeLeft)s")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(.white)
                        .frame(width: 200)
                        .padding(8)
                    VStack(spacing: 0) {
                        ForEach(0..<viewController.grid.height) { y in
                            HStack(spacing: 0) {
                                ForEach(0..<viewController.grid.width) { x -> SquareCellView in
                                    var renderGoal = false
                                    if (y == 2 && x == 5) { renderGoal = true }
                                    if viewController.cells.count > 0 {
                                        return SquareCellView(size: 50, image: viewController.getImage(cellIndex: y*self.viewController.w+x), color: viewController.cells[y*self.viewController.w+x].block?.color ?? Block.Colors.GREY, renderGoal: renderGoal, index: y*6+x, handleTab: viewController.handleTab)
                                    } else {
                                        return SquareCellView(size: 50, image: "", color: Block.Colors.GREY, renderGoal: renderGoal, index: 0, handleTab: viewController.handleTab)
                                    }
                                }
                            }
                        }
                    }
                    HStack {
                        if viewController.level > 0 {
                            Text("Counter: \(viewController.count) | Highscore: \(viewController.highscoreModel.score)")
                            .padding(12).foregroundColor(.white)
                        } else {
                            Text("Level Nr.: \(viewController.timeBreakerLevel) | Highscore: \(viewController.highscoreModel.score)")
                            .padding(12).foregroundColor(.white)
                        }
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color(UIColor(hex: ColorValue.orange)))
                    .padding(5)
                    .navigationBarBackButtonHidden(true)
                    .navigationBarItems(leading: Button(action: {
                        self.shouldPopToRootView = false
                        self.presentationMode.wrappedValue.dismiss()
                    }){
                        IconButton(icon: "xmark", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
                    }, trailing:
                        Button(action: {
                            self.viewController.resetLevel()
                        }, label: {
                            IconButton(icon: "arrow.triangle.2.circlepath", fontColor: .white, color: Color(UIColor(hex: ColorValue.orange)))
                        })
                    )
                }
            } else {
                EndscreenLevelMenuView(shouldPopToRootView: self.$shouldPopToRootView, count: level == 0 ? viewController.timeBreakerLevel : viewController.count, level: viewController.level, maxLevels: LevelMenuModelController.levels.length())
            }
        }
        .onReceive(timer) { time in
            if self.level != 0 {
                self.timer.upstream.connect().cancel()
                return
            }
            if self.viewController.timeLeft > 0 {
                self.viewController.timeLeft -= 1
            } else {
                self.viewController.finished()
            }
        }
        .onAppear {
            self.viewController.resetTimeBreaker()
            self.viewController.loadLevel(level: level)
            self.viewController.loadAndPlaySound()
        }
        .onDisappear {
            self.viewController.stopMusicPlayer()
            self.viewController.stopSoundEffectPlayer()
            
        }
    }
}

/*
struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(level: 1)
    }
}
 */
