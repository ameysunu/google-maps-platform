//
//  ViewDesign.swift
//  google-maps-platform
//
//  Created by Amey Sunu on 23/09/2022.
//

import SwiftUI

struct MyTextField: View {
    
    @State var username: String
    var textFieldText: String
    
    var body: some View {
        TextField("", text: $username)
            .placeholder(when: username.isEmpty) {
                Text(textFieldText).foregroundColor(.gray)
        }
            .foregroundColor(.white)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color.white, lineWidth: 1.0))
            .padding(.bottom, 20)
            .autocapitalization(.none)
    }
}

struct MyPasswordField: View {
    
    @State var password: String
    var textFieldText: String
    
    var body: some View {
        SecureField("", text: $password)
            .placeholder(when: password.isEmpty) {
                Text(textFieldText).foregroundColor(.gray)
        }
            .foregroundColor(.white)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 5.0)
                .stroke(Color.white, lineWidth: 1.0))
            .padding(.bottom, 20)
            .autocapitalization(.none)

    }
}

//struct ErrorPopView: View {
//
//    @State var popupText: String
//
//    var body: some View {
//
//            RoundedRectangle(cornerRadius: 20)
//                .fill(Color.indigo)
//                .frame(width: 300, height: 200)
//                .overlay(
//                    VStack{
//                        HStack{
//                        Spacer()
//                        Image(systemName: "xmark.octagon.fill")
//                                .foregroundColor(.white)
//                        Text("Error")
//                            .font(.title)
//                            .foregroundColor(.white)
//                        Spacer()
//                        }
//                        .padding()
//                        Text(popupText)
//                            .foregroundColor(Color.white)
//                            .padding()
//                        Spacer()
//                        Button(action:{
//
//                        }){
//                            Text("Okay")
//                                .foregroundColor(.white)
//                        }
//                        .padding(10)
//                        .frame(maxWidth: .infinity)
//                        .background(Color(hex: "231651"))
//                        .foregroundColor(.white)
//                        .cornerRadius(8)
//                        .padding()
//                    }
//                )
//
//    }
//}

//struct PopView_Previews: PreviewProvider {
//    static var previews: some View {
//        ErrorPopView(popupText: "Test")
//    }
//}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

struct Popup<T: View>: ViewModifier {
    let popup: T
    let isPresented: Bool

    // 1.
    init(isPresented: Bool, @ViewBuilder content: () -> T) {
        self.isPresented = isPresented
        popup = content()
    }

    // 2.
    func body(content: Content) -> some View {
        content
            .overlay(popupContent())
    }

    // 3.
    @ViewBuilder private func popupContent() -> some View {
        GeometryReader { geometry in
            if isPresented {
                popup
                    .frame(width: geometry.size.width, height: geometry.size.height)
            }
        }
    }
}
