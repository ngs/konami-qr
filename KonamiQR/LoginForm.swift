//
//  LoginForm.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/12.
//

import SwiftUI

struct LoginForm: View {
    @Binding var username: String?
    @Binding var password: String?

    @State var inputUsername = ""
    @State var inputPassword = ""

    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            TextField("Username", text: $inputUsername)
                .padding(10)
                .background(Color("TextFieldBackground"))
            SecureField("Password", text: $inputPassword)
                .padding(10)
                .background(Color("TextFieldBackground"))
            Button {
                username = inputUsername
                password = inputPassword
            } label: {
                Text("Login")
            }
        }.padding(20)
    }
}

struct LoginForm_Previews: PreviewProvider {
    static var previews: some View {
        LoginForm(username: .constant(""), password: .constant(""))
    }
}
