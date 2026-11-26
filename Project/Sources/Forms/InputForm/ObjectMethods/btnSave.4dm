// Restore the theme borders, then mark each empty mandatory field
ApplyTheme(Form)

var $fields : Collection:=[\
{name: "Customer"; empty: Form.customer=""}; \
{name: "Status"; empty: Form.status=""}; \
{name: "Date"; empty: Form.date=!00-00-00!}; \
{name: "Address"; empty: Form.address=""}\
]
var $field : Object
var $valid : Boolean:=True

For each ($field; $fields)
	If ($field.empty)
		OBJECT SET BORDER STYLE(*; "input"+$field.name; Border Plain)
		OBJECT SET RGB COLORS(*; "input"+$field.name; ""; ""; ""; "#E5484D")
		$valid:=False
	End if 
	OBJECT SET VISIBLE(*; "Mandatory"+$field.name; $field.empty)
End for each 

If ($valid)
	Form.entity.date:=Form.date
	Form.entity.status:=Form.status
	Form.entity.customer:=Form.customer
	Form.entity.address:=Form.address
	Form.entity.notes:=Form.notes
	
	var $isNew : Boolean:=Form.entity.isNew()
	var $status : Object:=Form.entity.save()
	If ($status.success) && ($isNew)
		// The number uses the ID assigned by the first save
		Form.entity.orderNumber:="SO-"+String(20000+Form.entity.ID)
		$status:=Form.entity.save()
	End if 
	
	If ($status.success)
		ACCEPT
	Else 
		ALERT(Localized string("AlertSaveFailed"))
	End if 
End if 
