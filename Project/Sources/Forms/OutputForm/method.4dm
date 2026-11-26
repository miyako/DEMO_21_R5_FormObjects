Case of 
	: (Form event code=On Load)
		If (ds.Order.all().length=0)
			GenerateData
		End if 
		Form.orders:=ds.Order.all()
		Form.selectedOrder:=Form.orders[0]
		
		Form.fields:="list@"
		Form.theme:="blue"
		ApplyTheme(Form)
		
		Form.isCollapsed:=True
		
	: (Form event code=On Double Clicked)
		If (Form.selectedOrder#Null)
			OpenOrder(Form; Form.selectedOrder)
		End if 
End case 
