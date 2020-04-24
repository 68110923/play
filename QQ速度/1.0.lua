
Import "GK.lua"
Import "ShanHai.lua"

Dim intX,intY,X,Y,temp,i=0,旋转方向
Dim 主任务 = ReadUIConfig("主任务"),运行模式完成后=ReadUIConfig("运行模式完成后"),全部执行=ReadUIConfig("全部执行"),全部执行_登陆除外=ReadUIConfig("全部执行_登陆除外")
Dim 登录 = ReadUIConfig("登录"),搭配大赛点赞 = ReadUIConfig("搭配大赛点赞"),皇冠领奖 = ReadUIConfig("皇冠领奖"),休闲区 = ReadUIConfig("休闲区"),个人竞速12局 = ReadUIConfig("个人竞速12局"),组队道具1局 = ReadUIConfig("组队道具1局"),浪漫邂逅 = ReadUIConfig("浪漫邂逅")
Dim 自动领奖 = ReadUIConfig("自动领奖"),许愿池任务 = ReadUIConfig("许愿池任务"),追缉任务 = ReadUIConfig("追缉任务")
Dim 随机数,参数1,参数2,参数3,参数4
SetScreenScale 540,960,0
Call 全局_初始化()
call 收费认证()

//自制函数


Function 等待(秒数)
    TracePrint "等待"&秒数&"秒"
    Delay 秒数 * 1000
End Function
Function random(参数1, 参数2)
    random=int(GK.R(参数1, 参数2))
End Function
Function random_click(参数1,参数2,参数3,参数4)
    Tap 参数1+random(参数3,参数4),参数2+random(参数3,参数4)
End Function






//全局_动作
Function 收费认证()
    Dim rsa公钥 = "-----BEGIN PUBLIC KEY-----\n"&_
	"MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDSSWc4GvU5LIu7YYPERo+rl0+6\n"&_
	"wiFEpNRRiEReG+Ss/tuNd9D9h0bJeUucEWM2tJ167/dfsqTNaMRbOEb3Wlmk5SBu\n"&_
	"4oeeeGgZwfUKbC8+Ii3C6/MU0l4Tmg+/bnW66bDn5ki8Cdp8EKsyw5cMw2lIIQOD\n"&_
	"9ntM390dQg7Kt/o9FQIDAQAB\n"&_
	"-----END PUBLIC KEY-----\n"
    Dim rsa私钥 = "-----BEGIN RSA PRIVATE KEY-----\n"&_
	"MIICXQIBAAKBgQC354TH1TPRvGjemHDqcSQqanhhLIe+yd2Cl1PP9/wg+gpa6YlB\n"&_
	"al5D2tSMSWJ55Q7c5EKEh4ljwGLMY87ml4OOXFHC7GCo2/B79A7veli6cA03RNd8\n"&_
	"+qV/evHxqtZkO9MjFjlzooFYw3PCCUEFU7EDz+u5nSNdPxdeB+yAKwofuQIDAQAB\n"&_
	"AoGACepvKb2sg7lkj6T5SKDFVg6j0zx9DLvSaFtLsvXQZ8BHnOeE5aysLL0wsug1\n"&_
	"ibRAqQcbMY1jyme6BAJ5Kkx+1K+AISPy1OccKtztziiUIi/EUs1+DiOn4cRi4pGo\n"&_
	"QlaAMbVLznT/J734Azrk91JrbVNVpsGf2huQ49CUjg+8K9ECQQC/o7tEwAIMsNXo\n"&_
	"lipMhiaL+GXjV5/OvWRgnp36n1PrzsLfArCGPlaCaQIfIWwjo9pHmJIKg1UqtBEx\n"&_
	"pQQSGVxRAkEA9arAIpJmPttiVhRvHtv3r0RPkccIj5nebWJDZM90vcWRQPvvYXC7\n"&_
	"jhkSGBhIoEM53lIm36MoOY2lGPnbU2766QJBAITTh0jvjHwfVSQQcOD5Wl5JnNUm\n"&_
	"Nq2kt54AUp8TL6eRd5/6zT8+lddt0Pqiv8E0IGbfaNnAjZc7l29BYMDqswECQQCc\n"&_
	"F583GEBBBhIIUbl9KRTKVyQboxQscf7jD4F0x2AMyECPwsQJ7KAvHHzjtGJI+g4F\n"&_
	"1br/c+K2Furk4LTb4XMpAkBGu+5WfWIlUeBwSvzoxb9toUqSHu2lGgSqSjxvMW5u\n"&_
	"ZC3gQxUH0ypQozvwlQsvXwGs4r5pkxXPLLaChRwaPkU2\n"&_
	"-----END RSA PRIVATE KEY-----\n"
	
    INITELFKEYS rsa公钥, rsa私钥
End Function
Function 结束游戏()
    killApp "com.tencent.tmgp.speedmobile"
    TracePrint "结束游戏"
End Function
Function 全局_初始化()
    KeepScreen True
    

    旋转方向 = GetScreenRotation()
End Function
Function 全局_左上角返回()
    Delay 1000
    random_click(514,45,-5,5)
    TracePrint "左上角返回"
    Delay 1500
End Function


Function 全局_领奖点确定()
    Delay 1000
    
    FindColor 121,397,195,561,"FFC300|FFC300|FFC300|FFC300",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        Delay 200
        random_click(intX, intY, -2, 2)
        random_click(intX,intY,-2,2)
        Delay 1500
    End If
End Function
Function 全局_领奖确定使用点确定()
    Delay 1000
    If CmpColorEx("406|442|FDFDFB,403|515|FFFFFF,174|348|FFC300,140|445|FFC300,139|502|2FFFFF,175|623|32FFFF",0.9) = 1 Then
        FindColor 127,322,197,468,"FFC300|FFC300|FFC300|FFC900",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY, -3, 3)
            TracePrint"全局_领奖确定使用点确定"
            Delay 1000
        End If
    End If
    Delay 1000
End Function
Function 全局_活动点叉()
    FindMultiColor 441,830,518,913,"FFFFFF","-12|12|FFFFFF,-13|-6|FFFFFF,6|13|FFFFFF",0,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX,intY,-3,3)
        TracePrint "全局_活动点叉"
        Delay 2500
    End If
End Function
Function 全局_活动点叉_登录()
    If CmpColorEx("336|65|2CD2FB,396|67|2FCEFA,333|201|2CD2FB,395|192|2CCCFA",0.9) = 1 Then
        FindColor 400,844,479,920,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX,intY,-3,3)
            TracePrint "全局_活动点叉_登录"
            Delay 1500
        End If
    End If
End Function
Function 全局_活动点叉_说明()
    Delay 1500
    If CmpColorEx("463|715|6B481B,437|695|6F481B,435|813|6C461A,462|815|684419",0.9) = 1 Then
        FindColor 409,754,495,844,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX,intY,-3,3)
            TracePrint "全局_活动点叉_说明"
            Delay 1500
        End If
    End If
End Function
Function 全局_签到框点叉()
    FindColor 441,871,482,915,"F39C82|F69C8A|FBEEE8|FBDAD0",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        Delay 1000
        random_click(intX,intY,-3,3)
        TracePrint "全局_签到框点叉"
        Delay 3000
    End If
End Function
Function 全局_提示框点确定()
    FindColor 128, 490, 239, 686, "21CFFF|21CFFF|21CFFF|27D2FF", 1, 0.9, intX, intY
    If intX > -1 And intY > -1 Then
        random_click(intX,intY,-3,3)
        TracePrint "全局_提示框点确定"
        Delay 3000
    End If
End Function
Function 全局_提示框点下次吧()
    If CmpColorEx("405|462|FFFFFF,390|462|FFFFFF,391|491|FFFFFF,399|498|FDFCFB",0.9) = 1 Then
        FindColor 136,304,223,446,"FFFFFF|FFFFFF|FAF8EF|FFFFFF",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX,intY,-3,3)
            TracePrint "全局_提示框点下次吧"
            Delay 3000
        End If
    End If
End Function
Function 全局_温馨提示框点取消()
    If CmpColorEx("402|444|FAF9F6,391|463|FCFAF9,390|513|FFFFFF,399|519|FDFCFB",0.9) = 1 Then
        FindColor 136,294,227,459,"FFC300|FFC300|FFC300|FFC300",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX,intY,-3,3)
            TracePrint "全局_提示框点取消"
            Delay 3000
        End If
    End If
End Function
Function 全局_好友邀请点叉()
    If CmpColorEx("174|332|FFC300,211|346|FFC300,211|452|FFC300,173|440|FFC300", 0.9) = 1 Then 
        Delay 100
        If CmpColorEx("174|504|21CDFF,208|517|21CDFF,207|620|21CDFF,174|610|21CDFF",0.9) = 1 Then
            Delay 100
            FindColor 363,696,429,771,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
            If intX > -1 And intY > -1 Then 
                Delay 100
                random_click(intX,intY,-3,3)
                TracePrint "全局_好友邀请点叉"
                Delay 500
            End If
        End If
    End If
    Delay 1000
End Function






//登录_动作
Function 打开app()
    RunApp "com.tencent.tmgp.speedmobile"
    TracePrint "打开游戏"
    Delay 2000
End Function
Function 进入游戏()
    Do	
        If CmpColorEx("192|302|2531F4,202|303|2531F4,70|403|28E8FF,99|550|2DE9FF",0.9) = 1 Then
            FindMultiColor 50,382,116,577,"062E73","-8|100|0B2F6C,-14|-12|062E73,-6|48|062E73",1,0.9,intX,intY
            If intX > -1 And intY > -1 Then
                random_click(intX,intY,-5,5)
                TracePrint "进入游戏"
                Delay 10000
                Exit Do
            Else 
                TracePrint "未找到进入游戏"
                Delay 3000
            End If
        ElseIf 开始_点叉() = 1 Then
        	random_click 447,775,-3,3
        	Delay 1000
        Else
            TracePrint"未找到开始游戏界面"
            Delay 3000
        End If
    Loop
    Do
        If CmpColorEx("47|909|041728,46|918|041728,516|793|231E1D,523|523|0A1924,518|531|152129",0.9) = 1 or CmpColorEx("421|846|20CDFF,402|737|20CDFF,333|784|F9F9F9,336|808|F3E3E3,319|756|4A4AF7,322|829|2008AD,226|740|FEBF42,188|849|FEBF42",0.9) = 1 Then
            TracePrint "进入游戏成功"
            Exit Do
        Else 
            Delay 3000
        End If
    Loop
End Function
Function 每日签到()
    Delay 1000
    If CmpColorEx("421|846|20CDFF,402|737|20CDFF,333|784|F9F9F9,336|808|F3E3E3,319|756|4A4AF7,322|829|2008AD,226|740|FEBF42,188|849|FEBF42",0.9) = 1 Then
        FindColor 15,420,101,628,"14D7FF|21CDFF|21CDFF|17D5FF",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX,intY,-3,3)
            TracePrint "每日签到"
            Delay 2000
            Call 全局_领奖确定使用点确定()
            Call 全局_领奖点确定()
        End If
        Call 全局_签到框点叉()
    End If
End Function


//休闲区_动作
Function 进入休闲区()
    Do
        FindMultiColor 121,644,183,765,"C3B64D","-32|-4|C1AB42,-48|94|B0A23D,-10|99|CBB93D",0,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX,intY,-3,3)
            TracePrint "进入休闲区"
            Delay 7000
            Exit Do
        Else 
            Delay 3000
        End If
    Loop
    Do
        If CmpColorEx("505|33|FFFFFF,337|42|C26736,521|295|FFFFFF,97|883|FFFFFF,331|940|FFFFFF", 0.9) = 1 Then 
            TracePrint "进入休闲区成功"
            Exit Do
        Else 
            Delay 3000
        End If
    Loop
End Function
Function 进入小游戏1()
    Delay 3000
    FindMultiColor 10,805,140,933,"FFFFFF","31|-6|FFFFFF,41|26|FFFFFF,7|19|FFFFFF",0,0.9,intX,intY
    If intX > -1 And intY > -1 Then
        random_click(intX, intY, -3, 3)
        random_click(323,939,-3,3)
        TracePrint "进入小游戏1"
        Delay 3000
    Else 
        Delay 1000
        Call 进入小游戏1()
    End If
End Function
Function 进入小游戏2()
    Do
        FindMultiColor 346,51,464,221,"21BDD2","74|1|22BCD3,74|120|23BDD4,1|122|1FBBD2",0,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 200
            random_click(72, 823,-3,3)
            TracePrint "进入小游戏2"
            Delay 3000
            FindMultiColor 143,595,392,746,"21CCFE","0|92|21CCFE,133|1|21CCFE,133|92|21CCFE",0,0.7,intX,intY
            If intX > -1 And intY > -1 Then
                Exit Do
            End If
        End If
    Loop
End Function
Function 进入小游戏3()
    FindMultiColor 143,595,392,746,"21CCFE","0|92|21CCFE,133|1|21CCFE,133|92|21CCFE",0,0.7,intX,intY
    If intX > -1 And intY > -1 Then
        random_click(202, 664,-3,3)
        TracePrint "进入小游戏3"
    Else 
        Delay 1000
        Call 进入小游戏3()
    End If
End Function
Function 进入小游戏4()
    Delay 1000
    FindColor 39,679,113,878,"21CDFF|1ECFFF|21CDFF|21CDFF",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then
        Delay 500
        random_click(intX, intY,-3,3)
        TracePrint "进入小游戏4",intX,intY
        Delay 1000
    Else 
        Delay 2000
        Call 进入小游戏4()
    End If
End Function
Function 进行游戏()
    For 6
        Do
            Delay 500
            FindMultiColor 370,622,527,756,"73EFFF","82|34|73F3FF,-2|82|C6FFFF,28|94|8CF7FF",0,0.7,intX,intY
            If intX > -1 And intY > -1 Then
                For 6
                    Delay 4000
                    random_click(230, 638,-2,2)
                    Exit Do
                Next
            End If
            
        Loop
    Next
    TracePrint "游戏结束"
End Function
Function 退出游戏()
    Do
        Delay 1000
        FindMultiColor 25,573,144,792,"19D3FF","41|13|1CD1FF,40|163|21CDFF,-1|148|1CD0FF",0,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY, -3, 3)
            TracePrint "退出游戏"
            Delay 1000
            Exit Do
        End If
    Loop
End Function
Function 休闲区领奖励()
    for 3
        FindMultiColor 389,154,428,239,"1FCBFC","16|-3|1FCBFC,15|53|1FCBFC,-1|54|1FCBFC",0,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click intX, intY, -3, 3
            TracePrint "休闲区领奖励"
            Delay 1000
            Call 全局_领奖点确定()
        End If
        Delay 1000
    Next
End Function

//皇冠领奖_动作
Function 皇冠领奖1()
    Do
        FindColor 498,374,537,422,"97DFFF|96DDFD|DAEFFB|CCECFA",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            random_click(intX, intY,-3,3)
            TracePrint "皇冠领奖1"
            Delay 2000
            Exit Do
        End If
    Loop
End Function
Function 皇冠领奖2()
    For 2
        FindMultiColor 281,698,475,921,"70FFFF","3|-130|81FAFF,-29|-141|93FFFF,-28|14|9EFFFF",0,0.8,intX,intY
        If intX > -1 And intY > -1 Then 
            random_click(300, 24,-3,3)
            TracePrint "皇冠领奖2"
            Exit For
        End If
        Delay 1000
    Next
End Function
Function 皇冠领奖3()
    random_click(390, 849,-3,3)
    TracePrint "皇冠领奖3"
    Delay 1500
End Function
Function 皇冠领奖4()
    FindColor 38,682,111,875,"1FCFFF|21CDFF|21CDFF|20CEFF",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then
        random_click(intX, intY,-3,3)
        TracePrint "皇冠领奖4"
        Delay 1500
    End If
End Function
Function 充值福利()
    random_click(185, 43,-3,3)
    Delay 1000
    FindColor 382,455,480,524,"CEC7B5|CEC7B5|CEC7B5|CEC7B5",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        TracePrint "累充不足12元"
    Else
        FindMultiColor 15, 270, 99, 431, "21CDFF", "34|9|21CDFF,33|106|21CDFF,1|95|22CEFF", 0, 0.8, intX, intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY,-3,3)
            TracePrint "充值福利15"
            Delay 1000
            Call 全局_领奖点确定()
        Else
            TracePrint "15已领取"
            Delay 1000
        End If
    End If
    Delay 1000
    
    FindColor 388,832,498,908,"CEC7B5|CEC7B7|CEC7B5|CEC7B5",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then
        TracePrint "累充不足30元"
        Delay 1000
    Else
        FindMultiColor 26,644,94,806,"21CDFF","34|9|21CDFF,33|106|21CDFF,1|95|22CEFF",0,0.8,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY,-3,3)
            TracePrint "充值福利30"
            Delay 1000
            Call 全局_领奖点确定()
        Else
            TracePrint "15已领取"
            Delay 1000
        End If
    End If
End Function


//个人竞速_动作
Function 进入对战房间()
    Do
        FindMultiColor 287,783,375,924,"FDFEFE","15|2|FDFEFE,2|97|FDFEFE,22|98|FDFEFE",0,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            random_click(intX, intY,-3,3)
            TracePrint "进入对战房间"
            Delay 2500
            Exit Do
        End If
        Delay 1000
    Loop
End Function
Function 下拉左侧()
    TouchDown 397,39,1
    TouchMove 194,42,1,300
    TouchUp 1
    TracePrint "下滑"
    Delay 2500
End Function
Function 点经典模式()
    random_click(452, 43,-3,3)
    Delay 2000
End Function
Function 匹配房间()
    Do
        FindMultiColor 6,742,76,946,"062C71","16|5|062C71,17|95|062C71,0|92|062D72",0,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            random_click(intX, intY,-3,3)
            TracePrint "匹配房间"
            Delay 2000
            Exit Do
        End If
        Delay 1000
    Loop
End Function
Function 个人竞速()
    Do
        Delay 1000
        FindMultiColor 93,98,429,292,"C66316","-3|124|C6661D,36|-7|C7671C,37|139|BC621D",0,0.8,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY,-3,3)
            TracePrint "个人竞速"
            Delay 4000
            Exit Do
        End If
    Loop
End Function
Function 跑图()
    TracePrint "开始小喷"
    For 70
        Delay 1500
        random_click(188, 722,-3,3)
    Next
    TracePrint "结束小喷"
End Function
Function 点击空白区域继续()
    Do
        Delay 3000
        If CmpColorEx("465|383|ADE3F7,462|450|9CDFF7,466|499|ADE3F3,466|562|B2E3F7",0.8) = 1 and CmpColorEx("49|866|FCFBFA,48|872|FCFBFB,43|871|F6F5EF,36|869|F5EFB3",0.9) = 1 Then
            Delay random(3000, 5000)
            Tap 35 + random(-30, 30), 425 + random(-375, 375)
            TracePrint "点击空白区域"
            Delay random(5000, 6000)
            FindColor 5,40,70,199,"FFC300|FFC300|FFC300|FFC600",1,0.9,intX,intY
            If intX > -1 And intY > -1 Then
                TracePrint "检测到继续成功"
                Exit Do
            End If
        End If
    Loop
End Function
Function 给第一名点赞()
    Delay 1000
    If CmpColorEx("456|885|3023A0,446|885|2F1CA9,453|917|3124A5,454|927|30239F",0.9) = 1 Then
        FindColor 371,811,440,884,"E4AD01|B88903|F5BB00|F7BC00",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 300
            random_click(intX, intY,-3,3)
            TracePrint "给第一名点赞"
        End If
    End If
    Delay 2000
End Function
Function 游戏返回()
    FindColor 5,40,70,199,"FFC300|FFC300|FFC300|FFC600",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then
        random_click(intX, intY,-3,3)
        TracePrint "游戏返回"
        Delay 20000
        Call ECU升级检测_处理()
        Call 全局_好友邀请点叉()
    Else
        Call 游戏返回()
    End If
End Function
//道具赛_动作
Function 组队道具()
    Do
        Delay 1000
        FindColor 86,684,436,878,"7539BB|593E8F|562F85|7437BA",1,0.8,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY,-3,3)
            TracePrint "组队道具"
            Delay 4000
            Exit Do
        End If
    Loop
End Function

//搭配大赛_动作
Function 收集()
    Delay 1000
    FindColor 3,456,53,570,"FDFDFC|986E67|FDFDFC|906965|FDFDFC|936A61|966C65|FDFDFC",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX,intY,-3,3)
        TracePrint "收集"
        Delay 2000
    Else 
        Delay 2000
        call 收集()
    End If
End Function
Function 图鉴()
    FindMultiColor 61,463,125,558,"FCFCFF","11|5|FCFCFF,11|15|FCFCFF,-6|15|FCFCFF",0,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY,-3,3)
        TracePrint "图鉴"
        Delay 3000
    Else 
        Delay 2000
        call 图鉴()
    End If
End Function
Function 搭配大赛()
    random_click(311,41,-5,5)
    TracePrint "搭配大赛"
    Delay 3000
End Function
Function 每日奖励()
    FindMultiColor 174,607,323,764,"39BA00","24|12|2CCE00,20|33|40FD08,-7|22|31DF00",0,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY,-3,3)
        TracePrint "每日奖励"
        Delay 3000
        Call 全局_领奖确定使用点确定()
        Call 全局_活动点叉_说明()
    End If
End Function
Function 我当评审()
    random_click(112,682,-5,5)
    Delay 5000
End Function
Function 点赞15次()
    For i=1 to 15
        Do
            Delay 3000
            FindColor 1,103,108,231,"94E7FF|59D6F6|68DBFC|9AEAFF",0,0.9,intX,intY
            If intX > -1 And intY > -1 Then 
                random_click(intX, intY,-3,3)
                TracePrint "点赞"&i&"次"
                Delay 3000
                Exit Do
            End If
        Loop
    Next
    i=0
End Function
Function 领奖励3次()
    For i=1 to 3
        Do
            Delay 2000
            FindColor 164,420,277,538,"87D61B|40BB13|52F714|68E918",0,0.9,intX,intY
            If intX > -1 And intY > -1 Then 
                random_click(intX, intY,-3,3)
                TracePrint "领奖励"&i&"次"
                Delay 1500
                call 全局_领奖确定使用点确定()
                Exit Do
            End If
        Loop
    Next
End Function

//浪漫邂逅
Function 邂逅页面()
    Call 下拉左侧()
    random_click(452, 43,-5,5)
    Delay 2000
    FindColor 24, 5, 90, 109, "EAE7C2|F0EED0|CEC666|E6E3AC", 1, 0.9, intX, intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY,-3,3)
        TracePrint "进入邂逅也页"
        Delay 2000
    Else
        call 邂逅页面()
    End If
End Function
Function 邂逅竞速()
    FindColor 78,287,437,483,"FFFFF7|FDF1E2|FCFAE9|FFFFFF",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY,-3,3)
        TracePrint "邂逅竞速"
        Delay 2000
    Else
        call 邂逅竞速()
    End If
End Function
Function 跑图邂逅()
    TracePrint "开始小喷"
    For 35
        For 2
            Delay 1500
            random_click(188, 722,-5,5)
        Next
        FindColor 241, 556, 353, 682, "FFFFFF|FFFFFF|8146F4|F7F2FE", 1, 0.9, intX, intY
        If intX > -1 And intY > -1 Then 
            random_click(intX, intY,-3,3)
        End If
    Next
    TracePrint "结束小喷"
    Delay 20000
End Function
Function 开始匹配_邂逅竞速()
    Do
        Delay 3000
        Call 全局_好友邀请点叉()
        FindColor 3, 797, 69, 953, "21CDFF|21CDFF|21CDFF|22CEFF", 1, 0.9, intX, intY
        If intX > -1 And intY > -1 Then 
            Delay 1000
            random_click(intX, intY,-3,3)
            TracePrint "开始匹配_邂逅竞速"
            Call 匹配成功检测()
            Exit Do
        End If
    Loop
End Function
Function 队友离开检测()
    FindColor 135, 287, 235, 466, "F7C800|FFC300|FFC300|FFC801", 1, 0.9, intX, intY
    If intX > -1 And intY > -1 Then
        random_click(intX,intY,-3,3)
        TracePrint "队友离开检测"
        Delay 500
    End If
End Function
Function ECU升级检测_处理()
    If CmpColorEx("279|600|B7E84B,267|613|7BAC20,88|417|ACE3F3,91|520|B5E2F3,392|391|5C8833,388|673|79CB3E",0.9) = 1 Then
        random_click(55,635,-5,5)
        TracePrint "ECU升级检测"
        Delay 300
    End If
End Function
//误判导致点击开始游戏

//自动领奖
Function 进入任务()
    FindColor 6,857,85,954,"21A6F7|21A6F7|4137DB|483BDD",2,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY,-3,3)
        TracePrint "进入任务"
        Delay 3000
        random_click(400, 47,-5,5)
        TracePrint "进入日常任务"
        Delay 3000
    End If
End Function
Function 领取每日任务奖励()
    Delay 1000
    FindColor 241,807,328,937,"21CCFE|21CCFE|21CCFE|21CCFE",4,1.0,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click intX, intY, -3, 3
        Delay 1000
        TracePrint "领取"
        Call 全局_领奖点确定()
        call 领取每日任务奖励()
    ElseIf CmpColorEx("278|825|FEC303,305|829|FEC303,302|911|FEC303,279|912|FEC303",0.9) = 1 Then
        TracePrint "领取完毕"
    End If

End Function
Function 领取活跃奖励()
    random_click(434,447,-1,1)
    Delay 1000
    Call 全局_领奖点确定()
    random_click(443,552,-1,1)
    Delay 1000
    Call 全局_领奖点确定()
    random_click(430,662,-1,1)
    Delay 1000
    Call 全局_领奖点确定()
    random_click(438,766,-1,1)
    Delay 1000
    Call 全局_领奖确定使用点确定()
    random_click(438,880,-1,1)
    Delay 1000
    Call 全局_领奖点确定()
    random_click(38,470,-1,1)
    Delay 1000
    Call 全局_领奖点确定()
    random_click(39,608,-5,5)
    Delay 1000
    Call 全局_领奖点确定()
    random_click(39,738,-1,1)
    Delay 1000
    Call 全局_领奖点确定()
End Function

//边境、排位
Function 赛事比赛()
    Do
        Delay 2000
        FindMultiColor 164,639,258,940,"F0B335","10|0|CE9B2B,7|71|DCA52F,-3|69|F5B537",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 200
            random_click(intX, intY,-3,3)
            TracePrint "赛事比赛"
            Delay 3000
            Exit Do
        End If
    Loop
End Function
Function 边境战争()
    Delay 1000
    random_click(217,48,-3,3)
    TracePrint "边境战争"
    Delay 3000
End Function
Function 边境竞速()
    Do
        Delay 3000
        FindColor 16,635,85,808,"062D72|062F73|073276|0C508F",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 200
            random_click(intX, intY,-3,3)
            TracePrint "边境竞速"
            Exit Do
        End If
    Loop
End Function
Function 边境道具()
    Do
        Delay 3000
        FindColor 3,795,100,955,"073175|062C71|093B7D|062C71",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 500
            random_click(intX, intY,-3,3)
            TracePrint "边境道具"
            Exit Do
        End If
    Loop
End Function
Function 边境20点券()
    Do
        Delay 3000
        FindColor 51,285,461,492,"C5661C|72440D|74440F|C67129",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 500
            random_click(intX, intY,-3,3)
            TracePrint "边境20点券"
            Delay 5000
            Exit Do
        End If
    Loop
End Function
Function 边境60点券()
    Do
        Delay 3000
        FindColor 76,499,458,695,"7D41C5|63328B|62328B|7B3ABE",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 500
            random_click(intX, intY,-3,3)
            TracePrint "边境60点券"
            Delay 5000
            Exit Do
        End If
    Loop
End Function
Function 开始匹配()
    Do
        Call 全局_好友邀请点叉()
        FindColor 4,562,74,720,"5FFFFF|3EFFFF|25EDFF|27F4FF",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY,-3,3)
            TracePrint "开始匹配"
            Call 匹配成功检测()
            Exit Do
        End If
    Loop
End Function
Function 匹配成功检测()
    Do
        Delay 3000
        If CmpColorEx("502|2|41BFF7,524|4|41C7FF,505|11|3BC3F6,523|10|3FC7FF",0.9) = 1 Then
            TracePrint "匹配成功"
            Delay 20000
            Exit Do
        ElseIf CmpColorEx("524|71|F8F4E6,522|513|BFFEFF,517|760|F2F2F2,522|800|FFDBA9,50|699|35FFFF,53|551|FFC300",0.9) = 1 Then
            TracePrint "匹配失败"
            Delay 1000
            Call 开始匹配()
            Exit Do
        Else 
            Call 全局_好友邀请点叉()
        End If
    Loop
End Function

//滑板
Function 上拉左侧()
    TouchDown 194,42,1
    TouchMove 397,39,1,300
    TouchUp 1
    TracePrint "上滑"
    Delay 3000
End Function
Function 检测极速滑板()
    Delay 1000
    If CmpColorEx("62|88|D9CDB2,60|88|EFEDCA,61|83|E9E3C6,60|83|EFEDCA",0.9) = 1 Then
        Delay 200
        random_click(112,43,-5,5)
        TracePrint "检测极速滑板"
        Delay 3000
    Else 
        random_click(459, 46,-5,5)
        Delay 2000
        Call 上拉左侧()
        检测极速滑板() 
    End If
End Function
//许愿池_动作
Function 进入寻宝()
    Delay 200
    random_click(457,790,-5,5)
    TracePrint "进入寻宝"
    Delay 3000
End Function
Function 点击许愿池1()
    Delay 200
    random_click(176,40,-3,3)
    TracePrint "点击许愿池1"
    Delay 3000
End Function
Function 点击许愿池2()
    Delay 200
    random_click(77,51,-3,3)
    TracePrint "点击许愿池2"
    Delay 3000
End Function
Function 许愿一次()
    Delay 200
    random_click(50,673,-5,5)
    TracePrint "愿池一次"
    Delay 6000
End Function
Function 许愿池点确定()
    FindColor 61,306,134,458,"FFC300|FFC300|FFC300|FFC300",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        Delay 200
        random_click(intX,intY,-5,5)
        TracePrint "愿池点确定"
    Else 
        FindColor 121,264,242,478,"F6C500|FDC400|FDC400|FDC400",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then 
            Delay 200
            random_click(intX,intY,-5,5)
            TracePrint "提示点忽略"
        End If
    End If
    Delay 2000
End Function
//全城追缉
Function 追缉页面()
    Call 下拉左侧()
    Delay 1000
    random_click 452, 43, -5, 5
    Delay 1000
    FindColor 24, 5, 90, 109, "EAE7C2|F0EED0|CEC666|E6E3AC", 1, 0.9, intX, intY
    If intX > -1 And intY > -1 Then 
        random_click(114,44,-5,5)
        TracePrint "进入追缉页面"
        Delay 2000
    Else
        call 追缉页面()
    End If
End Function
Function 开始匹配_追缉()
    Do
        Call 全局_好友邀请点叉()
        FindColor 7,515,70,669,"073377|062C71|062C71|062C71",1,0.9,intX,intY
        If intX > -1 And intY > -1 Then
            random_click(intX, intY,-5,5)
            TracePrint "开始匹配"
            Call 匹配成功检测()
            Exit Do
        End If
    Loop
End Function
Function 追缉结束检测()
    Do
        Delay 5000
        If CmpColorEx("55|70|FFC300,51|171|FFC300,41|105|FFFDFB,413|128|E2F9FF,457|900|3424A8",0.9) = 1 Then
            TracePrint "追缉游戏结束"
            Exit Do
        End If
    Loop
End Function

//排位赛
Function 排位_选组队道具()
    FindColor 11,806,76,944,"0A1B7F|070772|070974|070772",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY, -5, 5)
        TracePrint "排位_选组队道具"
        Delay random(3000, 5000)
    Else 
        Delay 3000
        Call 排位_选组队道具()
    End If
End Function
Function 排位_选个人竞速()
    FindColor 8,542,93,689,"070973|070772|090E76|070772",1,0.9,intX,intY
    If intX > -1 And intY > -1 Then 
        random_click(intX, intY, -5, 5)
        TracePrint "排位_选个人竞速"
        Delay random(3000, 5000)
    Else 
        Delay 3000
        Call 排位_选个人竞速()
    End If
End Function
Function 点击空任意位置继续_排位()
    Do
        Delay 2000
        If CmpColorEx("449|590|21CDFF,422|589|21CDFF,422|724|21CDFF,445|729|21CDFF",0.9) = 1 or CmpColorEx("225|152|67FEFF,210|212|72FFFF,213|291|8EFFFF,213|330|8BFFFF",0.9) = 1 or CmpColorEx("329|564|74FFFF,300|568|6CFFFF,300|798|6AFFFF",0.9) = 1 Then
            Delay random(1500, 3000)
            Tap 150 + random(-100, 100), 600 + random(-300, 300)
            TracePrint "点击空任意位置继续_排位"
            Delay random(3000, 6000)
            If CmpColorEx("465|383|ADE3F7,462|450|9CDFF7,466|499|ADE3F3,466|562|B2E3F7",0.9) = 1 and CmpColorEx("49|866|FCFBFA,48|872|FCFBFB,43|871|F6F5EF,36|869|F5EFB3",0.9) = 1 Then
                TracePrint "检测到继续成功"
                call 点击空白区域继续()
                Exit Do
            End If
        End If
    Loop
End Function
Function 开始_点叉
	开始_点叉=CmpColorEx("458|768|FFFFFF,440|787|FFFFFF,459|788|FFFFFF,440|770|FFFFFF,522|895|1F1408,470|50|373736",0.9)
End Function

//流程
Function main_正常登录()
    Call 打开app()
	进入游戏()
    Call 每日签到()
    For 6
        Call 全局_活动点叉()
    Next
    Call 全局_温馨提示框点取消()
    Call 全局_活动点叉_登录()
    Call 全局_好友邀请点叉()
End Function
Function main_休闲区()
    Call 进入休闲区()
    Call 进入小游戏1()
    Call 进入小游戏2()
    Call 进入小游戏3()
    Call 进入小游戏4()
    Call 进行游戏()
    Call 退出游戏()
    Delay 2000
    Call 全局_左上角返回()
    Call 等待(600)
    Call 全局_好友邀请点叉()
    Call 休闲区领奖励()
    Call 全局_左上角返回()
    Delay 25000
End Function
Function main_皇冠领奖()
    Call 皇冠领奖1()
    Call 皇冠领奖2()
    Call 皇冠领奖3()
    Call 皇冠领奖4()
    Call 充值福利()
    Call 全局_左上角返回()
End Function
Function main_个人竞速12局()
    Call 进入对战房间()
    Call 下拉左侧()
    Call 点经典模式()
    Call 匹配房间()
    Call 个人竞速()
    For bureau = 1 To 8
        Call 开始匹配()
        ShowMessage "第"&bureau&"局"
        TracePrint "第"&bureau&"局"
        Call 跑图()
        Call 点击空白区域继续()
        Call 给第一名点赞()
        Call 游戏返回()
        Call 队友离开检测()
    Next
    Call 全局_左上角返回()
    Call 全局_左上角返回()
End Function
Function main_搭配大赛点赞()
    Call 收集()
    Call 图鉴()
    Call 搭配大赛()
    Call 每日奖励()
    Call 我当评审()
    Call 点赞15次()
    Call 领奖励3次()
    Call 全局_左上角返回()
    Call 全局_左上角返回()
End Function
Function main_组队道具1局()
    Call 进入对战房间()
    Call 下拉左侧()
    random_click(460, 43, -5, 5)
    Delay 2000
    Call 匹配房间()
    Call 组队道具()
    Call 开始匹配()
    Call 跑图()
    Call 点击空白区域继续()
    Call 给第一名点赞()
    Call 游戏返回()

    Call 全局_好友邀请点叉()
    Call 全局_左上角返回()
    Call 全局_左上角返回()
End Function
Function main_浪漫邂逅()
	
    Call 进入对战房间()
    call 邂逅页面()
    Call 匹配房间()
    Call 邂逅竞速()
    Call 开始匹配_邂逅竞速()
    Call 跑图邂逅()
    Call 点击空白区域继续()
    Call 给第一名点赞()
    Call 游戏返回()
	
    Call 队友离开检测()
    Call 全局_左上角返回()
    Call 全局_提示框点确定()
    Call 全局_左上角返回()
End Function
Function main_自动领奖()
    Call 进入任务()
    Call 领取每日任务奖励()
    Call 领取活跃奖励()
    Call 全局_左上角返回()
    Delay 3000
End Function
Function main_许愿池任务()
    Call 进入寻宝()
    Call 上拉左侧()
    Call 点击许愿池1()
    Call 许愿一次()
    Call 许愿池点确定()
    call 全局_领奖确定使用点确定()
    Call 点击许愿池2()
    Call 许愿一次()
    Call 许愿池点确定()
    call 全局_领奖确定使用点确定()
    Call 全局_左上角返回()
End Function
Function main_全城追缉()
    Call 进入对战房间()
    call 追缉页面()
    Call 匹配房间()
    Call 开始匹配_追缉()
    Call 等待(150)
    Call 追缉结束检测()
    Call 给第一名点赞()
    Call 游戏返回()
    Call 全局_提示框点确定()
    Call 全局_左上角返回()
    Delay 2000
    Call 全局_左上角返回()
End Function





//main
Function UI一键日常任务()
    Call main_正常登录()
    Call main_皇冠领奖()
    Call main_许愿池任务()
    Call main_搭配大赛点赞()
    Call main_休闲区()
    Call main_浪漫邂逅()
    Call main_组队道具1局()
    Call main_全城追缉()
    Call main_个人竞速12局()
    Call main_自动领奖()
End Function
Function UI一键日常任务_登录除外()
    Call main_皇冠领奖()
    Call main_许愿池任务()
    Call main_搭配大赛点赞()
    Call main_休闲区()
    Call main_浪漫邂逅()
    Call main_组队道具1局()
    Call main_全城追缉()
    Call main_个人竞速12局()
    Call main_自动领奖()
End Function
Function UI个人竞速挂机()
    i=0
    Call 进入对战房间()
    Call 下拉左侧()
    Call 点经典模式()
    Call 匹配房间()
    Call 个人竞速()
    Do
        Call 全局_好友邀请点叉()
        Call 开始匹配()
        i=i+1
        ShowMessage "第"&i&"局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空白区域继续()
        Call 给第一名点赞()
        Call 游戏返回()

    Loop
End Function
Function UI组队道具挂机()
    i=0
    Call 进入对战房间()
    Call 下拉左侧()
    Call 点经典模式()
    Call 匹配房间()
    Call 组队道具()
    Do
        Call 全局_好友邀请点叉()
        Call 开始匹配()
        i=i+1
        ShowMessage "第"&i&"局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空白区域继续()
        Call 给第一名点赞()
        Call 游戏返回()
        Call 队友离开检测()
    Loop
End Function
Function UI休闲区小游戏挂机()
    i=0
    Call 进入休闲区()
    Call 进入小游戏1()
    Call 进入小游戏2()
    Call 进入小游戏3()
    Do
    	
        Call 进入小游戏4()
        i=i+1
        ShowMessage "第"&i&"局"
        TracePrint "第"&i&"局"
        Call 进行游戏()
        Call 退出游戏()
        Call 全局_好友邀请点叉()
    Loop
   
End Function
Function UI边境_竞速()
    i=0
    Call 赛事比赛()
    Call 边境战争()
    Call 边境竞速()
    Call 边境60点券()
    Do
        Call 全局_好友邀请点叉()
        Call 开始匹配()
        i=i+1
        ShowMessage "第"&i&"局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空白区域继续()
        Call 给第一名点赞()
        Call 游戏返回()

        Call 队友离开检测()
    Loop
End Function
Function UI边境_道具()
    i=0
    Call 赛事比赛()
    Call 边境战争()
    Call 边境道具()
    Call 边境60点券()
    Do
        Call 全局_好友邀请点叉()
        Call 开始匹配()
        i=i+1
        ShowMessage "第"&i&"局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空白区域继续()
        Call 给第一名点赞()
        Call 游戏返回()

        Call 队友离开检测()
    Loop
End Function
Function UI滑板()
    i = 0
    Call 进入对战房间()
    Call 检测极速滑板()
    Call 匹配房间()
    Do 
        Call 开始匹配()
        ShowMessage "第" & i & "局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空白区域继续()
        Call 给第一名点赞()
        Call 游戏返回()

        Call 队友离开检测()
    Loop 
End Function
Function UI排位_组队道具()
    i = 0
    Call 赛事比赛()
    Call 排位_选组队道具()
    Do 
        Call 开始匹配()
        ShowMessage "第" & i & "局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空任意位置继续_排位()
        Call 给第一名点赞()
        Call 游戏返回()

        Call 全局_好友邀请点叉()
    Loop 
End Function
Function UI排位_个人竞速()
    i = 0
    Call 赛事比赛()
    Call 排位_选个人竞速()
    Do 
        Call 开始匹配()
        ShowMessage "第" & i & "局"
        TracePrint "第"&i&"局"
        Call 跑图()
        Call 点击空任意位置继续_排位()
        Call 给第一名点赞()
        Call 游戏返回()

        Call 全局_好友邀请点叉()
    Loop 
End Function
Function UI_排位_道具掉分
	i = 0
    Do
    	Call 赛事比赛()
    	Call 排位_选个人竞速()
        Call 开始匹配()
        i=i+1
        ShowMessage "第" & i & "局"
        TracePrint "第"&i&"局"
    	Delay 1000
    	结束退出游戏 
    	
    	
    Loop
End Function
Function 结束退出游戏
	If CmpColorEx("385|426|37EDFD,391|537|3BF1FF,338|510|2CE1FF,424|527|37EDFD,114|91|E9D9C8,116|245|E4D4CB,93|818|62D5FF,122|881|99DDFF", 0.9) = 1 Then 
    	Delay 1500
    	random_click 513, 929, -2, 2
    	TracePrint "点击设置"
    	Delay 2000
    	FindColor 34,386,132,643,"FFC400|FFC300|FFC300|FFC500|FFFFFF|FDFCF9",1,0.9,intX,intY
		If intX > -1 And intY > -1 Then 
			random_click intX, intY, -2, 2
			TracePrint "点击退出"
			Delay 1300
			random_click 155,585, -2, 2
			Do
				If CmpColorEx("532|13|6C3912,529|251|1B12F4,521|537|A5F9FF,18|784|FFFFFF,453|734|FFFFFF,525|753|B67B37,516|794|FFDBAA",0.9) = 1 Then
					TracePrint "成功:推出游戏"
					Exit Do
				Else 
					Delay 500
				End If
			Loop
		Else 
			结束退出游戏()
		End If
	Else 
		Delay 500
		结束退出游戏()
	End If
End Function


//界面 
If 主任务 = 0 Then 
    If 全部执行 Then 
        Call UI一键日常任务()
    ElseIf 全部执行_登陆除外 Then
        call UI一键日常任务_登录除外()
    Else 
        If 登录 Then 
            Call main_正常登录()
        End If
        If 皇冠领奖 Then 
            Call main_皇冠领奖()
        End If
        If 许愿池任务 Then 
            Call main_许愿池任务()
        End If
        If 搭配大赛点赞 Then 
            Call main_搭配大赛点赞()
        End If
        If 休闲区 Then 
            Call main_休闲区()
        End If
        If 浪漫邂逅 Then 
            Call main_浪漫邂逅()
        End If
        If 组队道具1局 Then 
            Call main_组队道具1局()
        End If
        If 追缉任务 Then 
            Call main_全城追缉()
        End If
        If 个人竞速12局 Then 
            Call main_个人竞速12局()
        End If
        If 自动领奖 Then 
            Call main_自动领奖()
        End If
    End If
ElseIf 主任务 = 1 Then
    Call UI边境_竞速()
ElseIf 主任务 = 2 Then
    Call UI边境_道具()

ElseIf 主任务 = 3 Then
    Call UI排位_组队道具()
ElseIf 主任务 = 4 Then
    Call UI排位_个人竞速()

ElseIf 主任务 = 5 Then
    Call UI个人竞速挂机()
ElseIf 主任务 = 6 Then
    call UI组队道具挂机()

ElseIf 主任务 = 7 Then
    Call UI休闲区小游戏挂机()

ElseIf 主任务 = 8 Then
    Call UI滑板()
ElseIf 主任务 = 9 Then
    TracePrint "安慰小奶瓶:微信(未开发)"
ElseIf 主任务 = 10 Then
    TracePrint "安慰小奶瓶:支付宝(未开发)"
End If


If 运行模式完成后 = 0 Then 
    TracePrint "不做任何操作"
ElseIf 运行模式完成后 = 1 Then 
    Call UI边境_竞速()
ElseIf 运行模式完成后 = 2 Then 
    Call UI边境_道具()
ElseIf 运行模式完成后 = 3 Then 
    Call UI排位_个人竞速()
ElseIf 运行模式完成后 = 4 Then 
    Call UI排位_组队道具()
ElseIf 运行模式完成后 = 5 Then 
    Call UI个人竞速挂机()
ElseIf 运行模式完成后 = 6 Then 
    Call UI组队道具挂机()
ElseIf 运行模式完成后 = 7 Then 
    Call UI休闲区小游戏挂机()
ElseIf 运行模式完成后 = 8 Then 
    Call UI滑板()
ElseIf 运行模式完成后 = 9 Then
    Call shanhai.ShutDown()
ElseIf 运行模式完成后 = 10 Then 
    Call shanhai.Reboot()
ElseIf 运行模式完成后 = 11 Then 
    Call 结束游戏()
ElseIf 运行模式完成后 = 12 Then 
    UI_排位_道具掉分
End If
