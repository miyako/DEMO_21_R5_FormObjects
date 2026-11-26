var $status : Object
If (Form.selectedOrder#Null)
	CONFIRM(Replace string(Localized string("AlertDeleteOrder"); "{n}"; Form.selectedOrder.orderNumber); Localized string("AlertButtonDelete"); Localized string("Button_Cancel"))
	If (OK=1)
		$status:=Form.selectedOrder.drop(dk force drop if stamp changed)
		Form.orders:=ds.Order.all()
	End if 
End if 
