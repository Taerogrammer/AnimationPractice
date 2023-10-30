//
//  ContentView.swift
//  CardFlip-SwiftUI
//
//  Created by 김태형 on 2023/10/30.


// 두 가지 뷰가 있을 때, 두 뷰를 90도 변환시키면서 A뷰에서 B뷰를, B뷰에서 A뷰를 보여줌

import SwiftUI

struct ContentView: View {
    @State var backDegree = 0.0
    @State var frontDegree = -90.0
    @State var isFlipped = false

    let width: CGFloat = 200
    let height: CGFloat = 250
    let durationAndDelay: CGFloat = 0.3

    //MARK: Flip Card Function
    func flipCard() {
        isFlipped = !isFlipped
        if isFlipped {
            withAnimation(.linear(duration: durationAndDelay)) {
                backDegree = 90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                frontDegree = 0
            }
        } else {
            withAnimation(.linear(duration: durationAndDelay)) {
                frontDegree = -90
            }
            withAnimation(.linear(duration: durationAndDelay).delay(durationAndDelay)){
                backDegree = 0
            }
        }
    }
    //MARK: View Body
    var body: some View {
        ZStack {
            CardFront(width: width, height: height, degree: $frontDegree)
            CardBack(width: width, height: height, degree: $backDegree)
        }.onTapGesture {
            flipCard()
        }
    }
}

struct CardFront: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree: Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            Image(systemName: "suit.club.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.red)

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))
    }
}

struct CardBack: View {
    let width: CGFloat
    let height: CGFloat
    @Binding var degree : Double

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.2))
                .frame(width: width, height: height)
                .shadow(color: .gray, radius: 2, x: 0, y: 0)

            RoundedRectangle(cornerRadius: 20)
                .fill(.blue.opacity(0.7))
                .padding()
                .frame(width: width, height: height)

            RoundedRectangle(cornerRadius: 20)
                .stroke(.blue.opacity(0.7), lineWidth: 3)
                .padding()
                .frame(width: width, height: height)

            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue.opacity(0.7))

            Image(systemName: "seal")
                .resizable()
                .frame(width: 80, height: 80)
                .foregroundColor(.white)

            Image(systemName: "seal")
                .resizable()
                .frame(width: 150, height: 150)
                .foregroundColor(.blue.opacity(0.7))

        }.rotation3DEffect(Angle(degrees: degree), axis: (x: 0, y: 1, z: 0))

    }
}

#Preview {
    ContentView()
}
