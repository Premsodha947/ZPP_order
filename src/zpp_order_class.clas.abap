CLASS zpp_order_class DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_badi_interface .
    INTERFACES if_badi_mmim_check_matdoc_item .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZPP_ORDER_CLASS IMPLEMENTATION.


  METHOD if_badi_mmim_check_matdoc_item~check_item.

   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""for 101 quantity = yield qty
DATA(lv_user) = cl_abap_context_info=>get_user_technical_name(  ).

    SELECT SINGLE authflag
     FROM zuser_auth_tab
     WHERE userid = @lv_user
     INTO @DATA(lv_usr_flag).

    IF lv_usr_flag <> 'X'.
    if item_matdoc-goodsmovementtype <> '321' .
 SELECT SINGLE * FROM zyield_value WHERE manufacturingorder = @item_matdoc-manufacturingorder   INTO @DATA(it1).
 SELECT SINGLE ManufacturingOrderCategory FROM I_ManufacturingOrder WITH PRIVILEGED ACCESS WHERE ManufacturingOrder = @item_matdoc-manufacturingorder INTO @DATA(manu).
 if manu = '10'.
 if item_matdoc-manufacturingorder is NOT INITIAL.

  if item_matdoc-goodsmovementtype = '101' .
 if  it1-yieldvalue <> item_matdoc-quantityinbaseunit.

 APPEND VALUE #( messagetype = 'E'
                    messagetext = 'Yield Qty is not match with Goods Receipt Qty' ) TO messages.
 ENDIF.
 ENDIF.
 ENDIF.
 ENDIF.

"""""""""""""""""""""""""""""""""for 101 quantity = yield qty

  """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
       SELECT SINGLE reservation, mfgorderplannedtotalqty, ManufacturingOrderCategory FROM i_manufacturingorder
    WITH PRIVILEGED ACCESS
    WHERE manufacturingorder  = @item_matdoc-manufacturingorder
        INTO @DATA(pp_cds).

 if pp_cds-ManufacturingOrderCategory = '10'.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  data value type string.
  SELECT SINGLE * FROM zyield_value WHERE manufacturingorder = @item_matdoc-manufacturingorder   INTO @DATA(it2).

   IF item_matdoc-goodsmovementtype <> '101'.
 SELECT SINGLE resvnitmrequiredqtyinentryunit FROM i_reservationdocumentitem
    WITH PRIVILEGED ACCESS
    WHERE reservation  = @pp_cds-reservation
    and product = @item_matdoc-material
    and goodsmovementtype = @item_matdoc-goodsmovementtype
    and plant = @item_matdoc-plant
    and storagelocation = @item_matdoc-storagelocation

    INTO @DATA(pp_order) .

   data qty type string.
  data mfgqty type string.
  qty = pp_order / pp_cds-mfgorderplannedtotalqty .

   mfgqty = qty * it2-yieldvalue .
  IF mfgqty <> item_matdoc-quantityinbaseunit .
  APPEND VALUE #( messagetype = 'E'
                    messagetext = 'Please check validate input' ) TO messages.

ENDIF.
endif.
ENDIF.
ENDIF.
ENDIF.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  ENDMETHOD.
ENDCLASS.
