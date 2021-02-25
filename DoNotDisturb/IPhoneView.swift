//
//  IPhoneView.swift
//  DoNotDisturb
//
//  Created by Iryna V Betancourt on 2/24/21.
//

import SwiftUI
import Firebase

struct IPhoneView: View {

    @ObservedObject var manager = Manager()

    var body: some View {
        VStack {
            HStack {
                Image("DoNotDisturbImage")
                Text("Please Do Not Disturb.").fontWeight(.bold).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Spacer()
            }.frame(width: 65, height:100).padding()

            List(manager.doNotDisturbRequests) { request in
                HStack {
                    Image(request.notificationType?.imageName ?? "DoNotDisturbImage")
                    Text(request.notificationType?.speecha ?? "")
                    Spacer()
                    Text(request.timestamp?.timeString() ?? "").font(.caption).foregroundColor(Color.gray)
                }.frame(height:55)
            }
        }
    }
}



struct IPhoneView_Previews: PreviewProvider {
    static var previews: some View {
        IPhoneView()
    }
}
