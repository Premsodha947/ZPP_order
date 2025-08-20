@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'zyield_qty'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity zyield_qty_cds as select from zyield_qty as a
     inner join zyield_value as b on ( b.manufacturingorder = a.manufacturingorder )

{
    key a.manufacturingorder as Manufacturingorder,
    a.yieldqty as Yieldqty,
    a.yield_unit as YieldUnit,
    a.confirmationno as Confirmationno,
    b.yieldvalue
}
