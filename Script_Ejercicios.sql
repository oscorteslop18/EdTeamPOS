SELECT c."cls_id" IDCliente, c."cls_Name" NOmbreCliente, i."Inv_Id" Factura, i."Inv_Amount" MontoFactura
FROM public."Clients" c
INNER JOIN public."Invoice_Header" i on c.cls_id= i."Inv_id_Client"
WHERE CLS_ID =3;

SELECT p."Prd_id" IDProducto,p."Prd_Name" NombreProducto, i."Inv_Id" Factura, d."Inv_Quantity" Cantidad
FROM public."Clients" c
INNER JOIN public."Invoice_Header" i on c.cls_id= i."Inv_id_Client"
INNER JOIN public."Invoices_Detail" d on i."Inv_Id"= d."Inv_Id"
INNER JOIN public."Productos" p on p."Prd_id"= d."Inv_Id_Product"
WHERE p."Prd_id" =2;

SELECT c."cls_id" IDCliente, c."cls_Name" NOmbreCliente, i."Inv_Id" Factura, i."Inv_Amount" MontoFactura, i."Inv_BussinesDate",i."Inv_TranstDate"
FROM public."Clients" c
INNER JOIN public."Invoice_Header" i on c.cls_id= i."Inv_id_Client"
WHERE i."Inv_BussinesDate" BETWEEN '2016-01-01' AND '2016-02-28';

SELECT c."cls_id" IDCliente, c."cls_Name" NOmbreCliente, COUNT(i."Inv_Id") "#Facturas"
FROM public."Clients" c
INNER JOIN public."Invoice_Header" i on c.cls_id= i."Inv_id_Client"
GROUP BY c."cls_id"
ORDER BY c."cls_id";