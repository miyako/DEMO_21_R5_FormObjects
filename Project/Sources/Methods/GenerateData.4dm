//%attributes = {}
// Rebuild the sample order desk dataset in the current UI language.
// Companies, addresses and amounts are fictitious.
#DECLARE() : Integer

ds.Order.all().drop()
SET DATABASE PARAMETER([Order]; Table sequence number; 0)

var $orders : Collection
var $data : Object
var $order : cs.OrderEntity

If (Get database localization(Current localization)="ja@")
	$orders:=[\
		{orderNumber: "SO-10482"; customer: "北風メディカル株式会社"; status: "出荷待ち"; total: "¥642,000"; date: Current date-1; address: "東京都港区海岸1-18"; notes: "17時までに配達"}; \
		{orderNumber: "SO-10483"; customer: "アルパイン・アウトドア"; status: "準備中"; total: "¥291,800"; date: Current date-1; address: "大阪府大阪市北区梅田2-72"; notes: "到着時に電話連絡"}; \
		{orderNumber: "SO-10484"; customer: "ブルーバード珈琲焙煎所"; status: "出荷準備完了"; total: "¥117,300"; date: Current date-2; address: "京都府京都市下京区駅前通4"; notes: "卸売用の請求書を同封"}; \
		{orderNumber: "SO-10485"; customer: "シダー＆ストーン"; status: "保留中"; total: "¥467,500"; date: Current date-2; address: "福岡県福岡市中央区樫通205"; notes: "先方の確認待ち"}; \
		{orderNumber: "SO-10486"; customer: "ハーバーハウスホテルズ"; status: "発送済み"; total: "¥967,500"; date: Current date-3; address: "神奈川県横浜市中区本町90"; notes: "2拠点に分割して配送"}\
		]
Else 
	$orders:=[\
		{orderNumber: "SO-10482"; customer: "Northwind Medical"; status: "Awaiting shipment"; total: "$4,280.00"; date: Current date-1; address: "18 Harbor Street"; notes: "Deliver before 5 PM"}; \
		{orderNumber: "SO-10483"; customer: "Alpine Outdoor Co."; status: "In preparation"; total: "$1,945.50"; date: Current date-1; address: "72 Market Avenue"; notes: "Call on arrival"}; \
		{orderNumber: "SO-10484"; customer: "Bluebird Coffee Roasters"; status: "Ready"; total: "$782.00"; date: Current date-2; address: "4 Station Road"; notes: "Include wholesale invoice"}; \
		{orderNumber: "SO-10485"; customer: "Cedar & Stone"; status: "On hold"; total: "$3,116.75"; date: Current date-2; address: "205 Oak Lane"; notes: "Waiting for confirmation"}; \
		{orderNumber: "SO-10486"; customer: "Harbor House Hotels"; status: "Shipped"; total: "$6,450.00"; date: Current date-3; address: "90 King Street"; notes: "Split delivery across two sites"}\
		]
End if 

For each ($data; $orders)
	$order:=ds.Order.new()
	$order.fromObject($data)
	$order.save()
End for each 

return $orders.length
