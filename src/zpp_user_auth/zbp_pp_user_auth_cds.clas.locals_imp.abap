CLASS lhc_zpp_user_auth_cds DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR zpp_user_auth_cds RESULT result.

ENDCLASS.

CLASS lhc_zpp_user_auth_cds IMPLEMENTATION.

  METHOD get_instance_authorizations.
  ENDMETHOD.

ENDCLASS.
