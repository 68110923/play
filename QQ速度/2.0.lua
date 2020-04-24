
Import "GK.lua"
Import "ShanHai.lua"

//分辨率7201280默认
Dim 判断_是否是皇冠用户,判断_登录_开始游戏_广告,判断_登录_开始游戏_正常,判断_游戏大厅_正常,判断_游戏大厅_签到,判断_全局_被邀请,判断_游戏大厅_常用广告,判断_游戏大厅_活动,判断_至尊皇冠_特权,判断_充值福利,判断_游戏大厅_绿色广告_被广告挡住,判断_游戏大厅_收集,判断_搭配大赛页面
Dim intX=0,intY=0
dim ResolutionX = GetScreenX(),ResolutionY = GetScreenY()
SetScreenScale ResolutionX, ResolutionY, 0
If ResolutionX & ResolutionY = "7201280" Then 
	分辨率_7201280_默认 
	TracePrint "分辨率为:7201280"
End If
	

//判断
Function 分辨率_7201280_默认
	判断_登录_开始游戏_广告="44|400|373300,39|407|373400,50|420|373200,83|708|083337,610|1026|FFFFFF,594|1173|36322F,648|1180|36322E,557|254|755421"
	判断_登录_开始游戏_正常="621|64|FAFAF9,604|171|1E83FC,575|245|F8F800,702|1194|8F5C21,704|1264|8A581F,197|899|FDF806,264|899|FDF806,116|618|062E73,39|407|FFF100,139|747|28EDFF"
	判断_游戏大厅_正常="694|1129|FFDBA9,687|1058|FFDBAA,695|1009|F2F2F2,688|1019|B27838,689|706|A1F6FF,697|527|93DEFF,27|501|FFFFFF"
	判断_游戏大厅_签到="531|974|20CDFF,547|986|20CDFF,573|1127|20CDFF,550|1156|20CDFF,574|1147|9DE7F8,550|974|9DE8F9,247|988|FEBF42,300|989|FEBF42,299|1136|FEBF42,611|341|D15B44"
	判断_全局_被邀请="541|615|FFFFFF,521|614|FFFFFF,540|657|FFFFFF,525|664|FFFFFF,545|965|FFFFFF,521|990|FFFFFF,546|990|FFFFFF,282|460|FFC300,276|696|21DCFF,190|525|505010"
	判断_游戏大厅_常用广告="666|106|232329,695|717|192329,14|1206|040426,64|1205|000008,23|774|232329,28|54|1F1509,657|1144|FFFFFF,633|1168|FFFFFF,633|1144|FFFFFF,658|1169|FFFFFF"
	判断_游戏大厅_活动="528|87|2CD1FA,443|85|28D6FB,446|284|2CD2FB,532|276|2CD2FB,483|280|55F9FF,556|298|FFEF81,556|453|FFEF81,613|430|6D3F0C,600|1163|FFFFFF,575|1187|FFFFFF"
	判断_是否是皇冠用户=array(686,84,718,249,"B1F7F7|2842DE|9FE7EA|2A4CEC")
	判断_充值福利="562|7|2CD2FB,496|6|29D4FB,494|143|2CD2FB,565|138|2CD2FB,524|131|45F9FF,393|145|51ECFF,421|145|51ECFF,625|199|63D7F9,367|327|123A82,598|422|123A82"
	判断_游戏大厅_绿色广告_被广告挡住="710|1088|031E29,517|1235|0A1624,73|1227|151729,28|411|232329,704|1122|231E1D,690|914|130A0B,694|906|231822,687|805|1A0D0D,690|703|162329,696|538|131E29"
	判断_游戏大厅_收集 = "107|531|FCFCFF,128|539|FCFCFF,120|636|FCFCFF,110|756|FFFFFF,38|723|FFFFFF,38|732|FFFFFF"
	判断_搭配大赛页面="528|133|66FAFF,540|16|000000,538|66|000000,166|784|21D6FF,149|950|062C71"

End Function




main_all


//main
Sub main_all
	main_登录
	main_皇冠领奖
	main_搭配点赞

End Sub
Sub main_登录
	RunApp "com.tencent.tmgp.speedmobile"
	msg "打开游戏"
	Do
		If 找色(判断_登录_开始游戏_广告) = 1 Then 
			FindColor 529,997,662,1119,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
			If intX > -1 And intY > -1 Then
				random_click intX,intY,-3,3
				msg "开始游戏前广告点叉"
			End If
		ElseIf 找色(判断_登录_开始游戏_正常) = 1 Then
			FindColor 13,442,222,858,"27EFFF|27F0FF|29F3FF|25E4FF|062E73|062E73|062E73",1,0.9,intX,intY
			If intX > -1 And intY > -1 Then
				random_click intX, intY, -3, 3
				msg "进入游戏"
			End If
		ElseIf 找色(判断_游戏大厅_正常) = 1 Then
			msg "已进入游戏大厅"
			Exit Do
		ElseIf 找色(判断_游戏大厅_签到) = 1 Then
			方案_签到 
		ElseIf 找色(判断_全局_被邀请) = 1 Then
			方案_被邀请 
		ElseIf 找色(判断_游戏大厅_常用广告) = 1 Then
			方案_游戏大厅_常用广告_点叉 
		ElseIf 找色(判断_游戏大厅_活动) = 1 Then
			方案_游戏大厅_常用广告_点叉 
		ElseIf 找色(判断_游戏大厅_绿色广告_被广告挡住) = 1 Then
			方案_游戏大厅_特殊广告_点绿叉
		End If
			
		Delay 4000
	Loop
End Sub
Sub main_皇冠领奖
	If 找色_区域找色5参数(判断_是否是皇冠用户) = 1 Then 
		msg "用户为皇冠用户"
		Do
			If 找色(判断_游戏大厅_正常) = 1 Then 
				random_click 697, 530, -3, 3
				msg "点击皇冠"
				Delay 2000
				random_click 399,47, -3, 3
				msg "点击福利"
				Delay 2000
				方案_皇冠_福利领取 
			ElseIf 找色(判断_充值福利) = 1 Then
				random_click 253, 52, -3, 3
				Delay 2000
				方案_充值福利 
				Exit Do
			End If
		Loop
	Else 
		msg "非皇冠用户"
	End If
End Sub
Sub main_搭配点赞
	全局_返回大厅
	Do
		random_click 32, 688, -5, 5
		msg "点击收集"
		Delay 1500
		If 找色(判断_游戏大厅_收集) = 1 Then 
			random_click 116, 678, -5, 5
			msg "点击图鉴"
			Delay 3000
			Exit Do
		End If
	Loop
	Do
		random_click 410, 60, -5, -5
		msg "点击搭配大赛"
		Delay 2000
		If 找色(判断_搭配大赛页面) = 1 Then 
			random_click 337, 900, -5, -5
			msg "点击每日奖励"
			Delay 1500
			If CmpColorEx("532|135|0D3537,533|93|010303,607|469|FFFFFF,601|635|FFFFFF,603|802|FFFFFF,594|1057|FFFFFF,417|1116|36212A,668|810|30272F", 0.9) = 1 Then 
				FindColor 539,1006,660,1126,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
				If intX > -1 And intY > -1 Then 
					random_click intX, intY, -3, 3
					msg "点叉"
					Delay 1500
				End If
			Else
				全局_领取成功_确定使用_点确定 
			End If
		End If
		Exit Do
	Loop
	If 找色(判断_搭配大赛页面) = 1 Then 
		random_click 149, 912, -5, 5
		msg "点击我当评审"
		Delay 5000
	End If
	msg "点赞15次"
	For 15
		Do
			Delay 1500
			If CmpColorEx("706|389|FDCB71,694|587|FFE2A0,703|204|FDB9EC,705|1149|FFC6F8,77|207|79FFFF,79|229|82FFFF,54|212|74F5FF", 0.9) = 1 Then 
				Delay 1000
				random_click 68, 219, -5, 5
				Delay 2000
				Exit Do
			End If
		Loop
	Next
	msg "领奖励"
	For 3
		random_click 285, 640, -5, 5
		Delay 1500
		全局_领取成功_确定使用_点确定
	Next
	全局_返回大厅
End Sub







//方案函数
Function 方案_充值福利
	FindColor 495,586,634,725,"D0C8B8|D0C8B8",1,0.9,intX,intY
	If intX > -1 And intY > -1 Then 
		msg "白银卡未激活"
	Else 
		random_click 75,465, -3, 3
		msg "领取白银月卡"
		Delay 1000
		全局_领取成功_only确定_点确定 
		Delay 1000
	End If
	FindColor 469,1080,649,1218,"D0C8B8|D0C8B8",1,0.9,intX,intY
	If intX > -1 And intY > -1 Then
		msg "黄金卡未激活"
	Else
		random_click 75, 465, -3, 3
		msg "领取黄金卡"
		Delay 1000
		全局_领取成功_only确定_点确定 
		Delay 1000
	End If
	Delay 1000
	全局_返回大厅
End Function
Function 方案_皇冠_福利领取
	random_click 523, 1123, -3, 3
	Delay 1000
	全局_领取成功_only确定_点确定 
	random_click 294,1130, -3, 3
	Delay 1000
	全局_领取成功_only确定_点确定 
End Function

Function 方案_被邀请
	FindColor 476,916,582,1027,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
	If intX > -1 And intY > -1 Then 
		random_click intX, intY, -3, 3
		msg "完成：方案_被邀请"
	End If
End Function
Function 方案_签到
	If 找色(判断_游戏大厅_签到) = 1 Then 
		FindMultiColor 13,442,222,858,"27FEFF","59|24|26F3FF,57|227|26F3FF,4|203|24E6FF,19|86|062C71,41|93|062C71,40|146|062C71,18|140|062C71",1,0.9,intX,intY
		If intX > -1 And intY > -1 Then 
			random_click intX, intY, -3, 3
			msg "领取"
			Delay 2000
			全局_领取成功_only确定_点确定 
			Delay 1000
		End If
	End If
	FindColor 582,1159,649,1222,"FBF4EC|1F0F0F|F59C84|1A0F0A|F79B86|1D150D|FBDED6|201010",1,0.9,intX,intY
	If intX > -1 And intY > -1 Then 
		random_click intX, intY, -3, 3
		msg "签到位置点叉"
	End If
	msg "完成：方案_签到"
End Function
Function 方案_游戏大厅_常用广告_点叉
	FindColor 583,1112,704,1239,"FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
	If intX > -1 And intY > -1 Then 
		random_click intX, intY, -3, 3
		msg "方案_游戏大厅_常用广告"
	End If
End Function
Function 方案_游戏大厅_特殊广告_点绿叉
	FindColor 496,1097,699,1262,"5B7111|DEE115|5B7312|EFEF12|59770D|E8E811|EFEF12|566B13|E8EC1C",1,1,intX,intY
	If intX > -1 And intY > -1 Then 
		random_click intX, intY, 0, 0
		msg "方案_游戏大厅_特殊广告_点绿叉"
	End If
End Function

//全局函数
Function 全局_左上角返回
	random_click 689, 64, -3, 3
	msg "全局_左上角返回"
	Delay 2000
End Function
Function 全局_返回大厅
	If 找色(判断_游戏大厅_正常) = 1 Then 
		msg "返回大厅成功"
	ElseIf 找色(判断_全局_被邀请) = 1 Then
		方案_被邀请 
	Else 
		全局_左上角返回
		全局_返回大厅
	End If
End Function
Function 全局_领取成功_only确定_点确定
	If CmpColorEx("184|553|FFC300,233|723|FFC300,542|590|FFFFFF,538|686|FFFFFF,209|613|FFFFFF,220|656|FFFFFF", 0.9) = 1 Then 
		FindColor 94,479,307,819,"FFC300|FFC300|FFC300|FFC300|FFEF00|FFFFFF|FFFFFF|FFFFFF|FFFFFF|FFFFFF",1,0.9,intX,intY
		If intX > -1 And intY > -1 Then 
			random_click intX, intY, -3, 3
			msg "全局_领取成功_only确定_点确定"
		Else 
			msg "未找到：确定按钮"
		End If
	Else 
		msg "未找到：全局_领取成功_only确定_点确定"
	End If
End Function
Function 全局_领取成功_确定使用_点确定
	If CmpColorEx("542|589|FFFFFF,523|589|FFFFFF,537|694|FFFFFF,523|694|FFFFFF,234|461|FFC300,185|441|FFC300,211|542|FFFFFF,231|693|23E2FF,234|835|23EBFF,220|711|062C71",0.9) = 1 Then 
		FindColor 166,427,256,634,"FFC400|FFC300|FFC600|FFFFFF|FFFFFF|FEFEFC|FFFFFF",1,0.9,intX,intY
		If intX > -1 And intY > -1 Then 
			random_click intX, intY, -5, 5
			msg "全局_领取成功_确定使用_点确定"
			Delay 1000
		Else 
			msg "未找到：确定按钮"
		End If
	Else 
		msg "未找到：全局_领取成功_确定使用_点确定"
	End If
End Function

//扩展函数
Function msg(str)
	If intX>0 and intY>0 Then 
		TracePrint str,intX,intY
	Else
		TracePrint str
	End If
//	ShowMessage str
End Function
Function addimage
	KeepCapture:Delay 80
End Function

Function random(参数1, 参数2)
    random=int(GK.R(参数1, 参数2))
End Function
Function random_click(参数1, 参数2, 参数3, 参数4)
	Delay 100
    Tap(参数1+ random(参数3, 参数4), 参数2+ random(参数3, 参数4))
End Function
Function 找色(找色参数)
	找色 = CmpColorEx(找色参数, 0.9)
End Function 
Function 找色_区域找色5参数(列表)
	FindColor 列表[1],列表[2],列表[3],列表[4],列表[5],1,0.9,intX,intY
	If intX > -1 And intY > -1 Then
		找色_区域找色5参数 = 1
	Else 
		找色_区域找色5参数 = 0
	End If
End Function
Function 找色_多点找色6参数(列表)
	FindMultiColor 列表[1],列表[2],列表[3],列表[4],列表[5],列表[6],1,0.8,intX,intY
	If intX > -1 And intY > -1 Then
		找色_多点找色6参数 = 1
	Else 
		找色_多点找色6参数 = 0
	End If
End Function
