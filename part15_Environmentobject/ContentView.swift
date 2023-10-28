//
//  ContentView.swift
//  MyFamilyBook
//
//  Created by emi oiso on 2023/10/17.
//

import SwiftUI

class Ponta: ObservableObject{
    @Published var name = ""
    @Published var age = ""
    @Published var wight = ""
}

struct ContentView: View {
    @EnvironmentObject var ponta: Ponta
    @State var isShowInfoView = false
    
    var body: some View {
        VStack {
            Text("ぽんちゃんの情報を入力してください。")
                .font(.headline)
            TextField("名前",text:$ponta.name)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
            
            TextField("年齢",text:$ponta.age)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
        
            TextField("体重",text:$ponta.wight)
                .autocapitalization(.none)
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
            
            Button("決定"){
                isShowInfoView = true
            }
            .sheet(isPresented: $isShowInfoView){
                InfoView()
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}


struct InfoView: View {
    @EnvironmentObject var ponta: Ponta
    
    var body: some View{
        VStack{
            Text("【 ぽんちゃん情報 】")
                .padding()
            Text("名前:\(ponta.name)")
            Text("年齢:\(ponta.age)")
            Text("体重:\(ponta.wight)")
            Button("決定"){
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}
#Preview {
    ContentView()
}
