var $order : cs.OrderEntity:=ds.Order.new()
$order.customer:=""
$order.status:=Localized string("Order_StatusNew")
$order.total:=Localized string("Order_TotalZero")
$order.date:=Current date
$order.address:=""
$order.notes:=""

OpenOrder(Form; $order)
