// Ask before replacing existing orders, then report how many were created
If (ds.Order.all().length>0)
	CONFIRM(Localized string("AlertRegenerateData"); Localized string("AlertButtonCreate"); Localized string("Button_Cancel"))
Else 
	OK:=1
End if 

If (OK=1)
	var $count : Integer:=GenerateData
	ALERT(Replace string(Localized string("StartScreen_DataReady"); "{n}"; String($count)))
End if 
