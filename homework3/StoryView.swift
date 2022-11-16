//
//  StoryView.swift
//  homework3
//
//  Created by robert on 2022/11/14.
//

import SwiftUI

struct StoryView: View {

    @Binding  var name :String
    @Binding  var birthday : Date
    @Binding  var intelligence: Double
    @Binding  var bodys: Double
    @Binding  var luck: Double
    @Binding  var soul: Double
    @Binding  var appearance: Double
    @Binding  var background: Double
    @Binding  var showNextPage : Bool
    
    @State    var storys = ["修仙冒險開始","","","","","","","","","","","","","","","","","","","",""]
    @State    var n = 0
    @State    var showlastPage = false
    @State    var showthreadpromble = false
    @State    var showproblem = false
    @State    var showproblemone = false
    @State    var showproblemtwo = false
    @State    var Ispick = false
    @State    var Islive = false
    @State private var Textcolor = Color.black
    @Binding  var attributes : Int
    @State private var alertTitle = "你掛了！！！"
    let dateFormatter = DateFormatter()
    var body: some View {
        VStack{
            Form {
                ScrollView{
                    ForEach(storys, id: \.self){
                        story in
                        Text(story)
                            .foregroundColor(Textcolor)
                    }
                }
            }
            ZStack{
                HStack{
                    Button{
                       
                        if(n==3){
                            showthreadpromble = false
                            n+=1
                            storys.insert("你隨著三叔到了七玄門", at: n)
                        }
                            }label:{
                        Text("yes")
                            }
                    Spacer()
                                    Button{
                                        showlastPage = true
                                        alertTitle = "你錯失了唯一能修仙的機會！"
                                    }label:{
                                        Text("no")
                                    }
                }.frame(width: 100, height: 50)
                    .opacity(showthreadpromble ? 1:0)
                HStack{
                    Button{
                        Ispick = false
                        if(n==8){
                            showproblem = false
                        }
                            }label:{
                        Text("把瓶子狠狠地甩到旁邊去")
                            }
                    Spacer()
                                    Button{
                                        Ispick = true
                                        if(n==8){
                                            showproblem = false
                                        }
                                    }label:{
                                        Text("撿起瓶子帶回去研究")
                                    }
                }.frame(width: 200, height: 50)
                    .opacity(showproblem ? 1:0)
                HStack{
                    Button{
                        if(n==11){
                            showproblemone = false
                        }
                        showlastPage = true
                        alertTitle = "你喝了綠液！爆體而亡"
                            }label:{
                        Text("自己喝掉")
                            }
                    Spacer()
                        Button{
                            if(n==11){
                                showproblemone = false
                            }
                            Islive = true
                                    }label:{
                                        Text("找小動物喂給他喝")
                                    }
                }.frame(width: 200, height: 50)
                    .opacity(showproblemone ? 1:0)
            }
            Button{
                showthreadpromble =  false
                showproblem = false
                n=add(num:n)
                if(n==1){
                    dateFormatter.dateFormat = "YYYY/MM/dd"
                    storys.insert(name+"在"+dateFormatter.string(from: birthday)+first(num:background,choose:&born), at: n)
                }
                else if(n==2) {
                    if(luck<5){
                        showlastPage = Bool.random()
                        if(showlastPage){
                            alertTitle = "走在路上你運氣不好被路過的馬車撞了\n你掛了！！！"
                    }
                        storys.insert("你運氣不錯長大到了七歲", at: n)
                    }
                }
                else if(n==3){
                    if(background>3){
                        storys.insert("有一天你的三叔來到你們家，他看起來非常陰險狡滑，他問你要不要跟他去報名一個叫七玄門的門派的招生考驗", at: 3)
                        showthreadpromble=true
                    }else{
                        storys.insert("有一天你的三叔來到你們家，他看起來非常陰險狡滑，他問你要不要跟他去報名一個叫七玄門的門派的招生考驗，但是由於你家太窮，你毫不猶豫答應下來了", at: 3)
                    }
                }
                else if(n==4){
                    storys.insert("你隨著三叔到了七玄門", at: n)
                }
                else if(n==5){
                    if(bodys<9){
                        showlastPage = true
                        if(background<3){
                            alertTitle = "你身體素質太差無法通過宗門考試！被遣返回去經過數年後餓死在家鄉"
                        }
                        else{
                            alertTitle = "你身體素質太差無法通過宗門考試！你錯失了唯一能修仙的機會！"
                        }
                    }
                    else if(bodys==9){
                        storys.insert("雖然你沒通過宗門考試，但是你的表現驚艷到一位陪考官，他決定破例收留你", at: n)
                    }
                    else{
                        storys.insert("你順利通過宗門考試，成為了一位內門弟子", at: n)
                    }
                }
                else if(n==6){
                    if(bodys==10){
                        showlastPage = true
                        alertTitle = "數年後，你從弟子晉升成一位長老，在一次門派鬥爭的打鬥中丟了小命"
                    }
                    else{
                        storys.insert("那位陪考官叫墨老，他給了你一本口訣，要求你在半年將這口訣練出一定的程度", at: n)
                    }
                }
                else if(n==7){
                    if(attributes==1){
                        storys.insert("經過了你勤苦的修煉，半年後你終於取得了小許成果", at: n)
                    }
                    else{
                        storys.insert("雖然你一直勤苦的修煉，但是半年後你還是毫無進展，墨老把你逐出了他的門下，你變成了一個外門弟子", at: n)
                    }
                }
                else if(n==8){
                    if(attributes == 2){
                        storys.insert("你成為了墨老的親傳弟子，他叫你繼續修煉那個口訣，你過很久才知道那個口訣較長生經\n某一天你在散步的時候被一個小瓶子給絆倒你決定", at: n)
                        showproblem = true
                    }
                    else{
                        showlastPage = true
                        alertTitle = "數年後，你從弟子晉升成一位長老，在一次門派鬥爭的打鬥中丟了小命"
                    }
                }
                else if(n==9){
                    if(Ispick == true){
                        storys.insert("你決定撿起瓶子帶回去研究，修煉時間被耽誤了", at: n)
                    }
                    else{
                        storys.insert("你決定把瓶子狠狠地甩到旁邊去繼續修煉", at: n)
                    }
                }
                else if(n==10){
                    if(Ispick == true){
                            storys.insert("你發現瓶子會產生神秘綠液", at: n)
                        }
                        else{
                            storys.insert("你持續修練把口訣練到了第四層", at: n)
                        }
                }
                else if(n==11){
                    if(Ispick == true){
                            storys.insert("為了搞清綠液的功用你決定", at: n)
                            showproblemone = true
                        }
                        else{
                            storys.insert("墨老很高興他說他要出門遊歷一番", at: n)
                        }
                }
                else if(n==12){
                    if Ispick{
                        if Islive {
                            storys.insert("小動物們喝完綠液爆體而亡，你嚇壞了", at: n)
                        }
                        else{
                            showlastPage = true
                            alertTitle = "你喝了綠液！爆體而亡"
                        }
                    }
                    else{
                        storys.insert("你成為宗門一個特立獨行的存在", at: n)
                    }
                }
                else if(n==13){
                    if Ispick{
                        storys.insert("過幾天，你發現在灑了綠液的周圍，靈草年份特別提高", at: n)
                    }
                    else{
                        storys.insert("有一天墨老忽然回來，把你帶到一個小房間裡", at: n)
                    }
                }
                else if(n==14){
                    if Ispick{
                        storys.insert("你開始用綠液催熟靈草，開始嗑藥，你把功法修煉到了第六層", at: n)
                    }
                    else{
                        showlastPage = true
                        alertTitle = "你被墨老用秘法奪舍，你掛了！！！"
                    }
                }
                else if(n==15){
                    storys.insert("墨老前來驗收你修煉成果，你了隱藏修為", at: n)
                }
            }
            label:{
                Text("繼續")
            }
            Spacer()
            ColorPicker("文字顏色", selection: $Textcolor)
              .padding()
        }.alert(alertTitle, isPresented: $showlastPage, actions: {
            Button("重新輪迴") {
                showNextPage = false
            }})
        
    }
}

struct StoryView_Previews: PreviewProvider {
    @State  static var name = ""
    @State  static var birthday = Date()
    @State  static var intelligence: Double = 0
    @State  static var bodys: Double = 9
    @State  static var luck: Double = 10
    @State  static var soul: Double = 0
    @State  static var appearance: Double = 0
    @State  static var background: Double = 7
    @State  static var showNextPage = false
    @State  static var attributes : Int = 2
    @State static var DialColor: Color = .black
    static var previews: some View {
        StoryView(name:$name,birthday:$birthday,intelligence:$intelligence,bodys:$bodys,luck:$luck,soul:$soul,appearance:$appearance,background:$background,showNextPage:$showNextPage,attributes:$attributes)
    }
}
	
