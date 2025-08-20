CLASS zpp_yield_qty_update DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    CLASS-METHODS :
      create_client1
        IMPORTING manufacturingorder           TYPE string
                  yieldvalue                   TYPE string.

*   RETURNING VALUE(result12) TYPE string .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPP_YIELD_QTY_UPDATE IMPLEMENTATION.


  METHOD create_client1 .


*     DATA order TYPE string.
*      DATA yieldvalu TYPE string.
*
*      order = manufacturingorder .
*      yieldvalu = yieldvalue .
*  result12 = yieldvalu.

    DATA zbillnoWA TYPE zyield_value.
*    DATA qty TYPE string.
*   qty = class .
DELETE FROM zyield_qty WHERE manufacturingorder <> @manufacturingorder .
 zbillnoWA-manufacturingorder  = manufacturingorder.
 zbillnoWA-yieldvalue = yieldvalue .
  MODIFY zyield_value FROM @zbillnoWA .

  ENDMETHOD .
ENDCLASS.
