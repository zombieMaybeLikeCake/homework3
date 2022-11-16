//
//  MainView.swift
//  homework3
//
//  Created by robert on 2022/11/12.
//

import SwiftUI

struct MainView: View {
    @State  var name = ""
    @State  var birthday = Date()
    @State  var intelligence: Double = 0
    @State  var bodys: Double = 0
    @State  var luck: Double = 0
    @State  var soul: Double = 0
    @State  var appearance: Double = 0
    @State  var background: Double = 0
    @State var sum: Double = 30
    @State private var showAlert = false
    @State private var success = false
    @State private var alertTitle = ""
    @State private var showNextPage = false
    @State  var attributes : Int = 0
    @State private var ischeatOn = false
    var body: some View {
        ScrollView{
            VStack{
                Spacer()
                HStack(){
                    Spacer()
                    Text("你的名字:")
                    TextField("韓立", text: $name, prompt: Text("你的名字"))
                        .padding().frame(width: 150, height: 50)
                    Spacer()
                    Text("作弊模式")
                    Toggle("作弊模式", isOn: $ischeatOn)
                                   .labelsHidden()
                                   .padding()
                }
                HStack(){
                    Spacer()
                    Text("你的生日:")
                    DatePicker("你的生日:", selection: $birthday,displayedComponents: .date).padding().frame(width: 150, height: 50)
                    Spacer()
                }
                DisclosureGroup("靈根") {
                    Picker(selection: $attributes ) {
                        Text("金靈根").tag(0)
                        Text("木靈根").tag(1)
                        Text("水靈根").tag(2)
                        Text("火靈根").tag(3)
                        Text("土靈根").tag(4)
                    } label: {
                        Text("靈根選擇")
                    }
                }.frame(width: 150, height: 100)
                Group{
                    HStack(){
                        Spacer()
                        Text("智力:")
                        Slider(value: $intelligence, in: 0...10 ,step:1).frame(width: 150, height: 50)
                        Spacer()
                    }
                    HStack(){
                        Spacer()
                        Text("身體:")
                        Slider(value: $bodys, in: 0...10,step:1).frame(width: 150, height: 50)
                        Spacer()
                    }
                    HStack(){
                        Spacer()
                        Text("運氣:")
                        Slider(value: $luck, in: 0...10,step:1).frame(width: 150, height: 50)
                        Spacer()
                    }
                    HStack(){
                        Spacer()
                        Text("外貌:")
                        Slider(value: $appearance, in: 0...10,step:1).frame(width: 150, height: 50)
                        Spacer()
                    }
                    HStack(){
                        Stepper("背景值", value: $background, in: 0...10)
                    }.frame(width: 200, height: 100)
                }
                Spacer()
              Text("已分配技能點：\(intelligence+bodys+luck+background+appearance)")
                Spacer()
                Button {
                    if ischeatOn{
                        showNextPage=true
                    }
                    else{
                        if(intelligence+bodys+luck+background+appearance>40){
                            showAlert = true
                             alertTitle = "技能點不得超過40"
                        }else{
                            showNextPage=true
                        }
                    }
                   
                } label: {
                   VStack {
                      Text("開始遊戲")
                       Spacer()
                       
                       Spacer()
                   }
                } .alert(alertTitle, isPresented: $showAlert, actions: {
                    Button("重新分配") { }
                }
                ).fullScreenCover(isPresented: $showNextPage, content: {StoryView(name:$name,birthday:$birthday,intelligence:$intelligence,bodys:$bodys,luck:$luck,soul:$soul,appearance:$appearance,background:$background,showNextPage:$showNextPage,success:$success,attributes:$attributes)})
                VStack{
                    Text("破關獎勵！")
                    Spacer()
                    Link("原小說目錄章節", destination: URL(string: "https://www.ptwxz.com/html/0/760/")!)
                }.opacity(success ? 1 : 0)
                
            
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
