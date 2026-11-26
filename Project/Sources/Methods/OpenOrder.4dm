//%attributes = {"invisible":true}
// Open an order in the detail form, then refresh the list form.
// $state  : Form of OutputForm (orders, selectedOrder, theme)
// $entity : the order to edit; a new, unsaved entity is only saved by Save
#DECLARE($state : Object; $entity : cs.OrderEntity)

var $detail : Object:={entity: $entity; theme: $state.theme}
var $window : Integer:=Open form window("InputForm"; Movable form dialog box; Horizontally centered; Vertically centered)
DIALOG("InputForm"; $detail)
CLOSE WINDOW($window)

$state.orders:=ds.Order.all()
If (Not($entity.isNew()))
	$state.selectedOrder:=ds.Order.get($entity.ID)
End if 

// Keep the theme chosen in the detail form
$state.theme:=$detail.theme
ApplyTheme($state)
