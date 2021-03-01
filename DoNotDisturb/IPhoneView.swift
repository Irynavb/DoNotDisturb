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
            List(manager.doNotDisturbRequests) { request in
                HStack {
                    Text(request.notificationType?.speech ?? "")
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
