//
//  ActionBar.swift
//  KonamiQR
//
//  Created by Atsushi Nagase on 2022/03/14.
//

import SwiftUI

struct ActionBar: View {
    @StateObject var viewModel: ViewModel

    var body: some View {
        HStack {
            Button {
                viewModel.logout()
            } label: {
                Text("Logout")
            }
            Spacer().frame(maxWidth: .infinity)
            Toggle("Auto Navigate", isOn: $viewModel.autoNavigate)
        }
        .padding([.top, .bottom], 10)
        .padding([.leading, .trailing], 20)
    }
}

struct ActionBar_Previews: PreviewProvider {
    static var previews: some View {
        ActionBar(viewModel: ViewModel())
    }
}
