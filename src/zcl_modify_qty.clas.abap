CLASS zcl_modify_qty DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS :
      create_client
        IMPORTING manufacturingorder           TYPE string
                  goodsmovementtype            TYPE string
*                  yieldvalue
                  Quantity                     TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_MODIFY_QTY IMPLEMENTATION.


  METHOD create_client .

*  DATA(class) =  zpp_yield_qty_update=>create_client1( manufacturingorder = manufacturingorder yieldvalue = quantity ) .

  DATA zbillnoWA TYPE zyield_qty.
  DATA qty TYPE string.
*   qty = class .
if goodsmovementtype = '101' or Quantity = qty .  "( goodsmovementtype = '101' and Quantity = qty ).
DELETE FROM zyield_qty WHERE manufacturingorder <> @manufacturingorder .
 zbillnoWA-manufacturingorder  = manufacturingorder.
 zbillnoWA-goodsmovementtype = goodsmovementtype .
 zbillnoWA-yieldqty = Quantity .
 zbillnoWA-yieldvalue = qty .
  MODIFY zyield_qty FROM @zbillnoWA .
  ENDIF.
  ENDMETHOD .
ENDCLASS.
