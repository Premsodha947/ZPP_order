//@AbapCatalog.viewEnhancementCategory: [#NONE]
//@AccessControl.authorizationCheck: #NOT_REQUIRED
//@EndUserText.label: 'Cds for user authorised'
//@Metadata.ignorePropagatedAnnotations: true
//@ObjectModel.usageType:{
//    serviceQuality: #X,
//    sizeCategory: #S,
//    dataClass: #MIXED
//}
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Cds for user authorised'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define root view entity ZPP_USER_AUTH_CDS as select from zuser_auth_tab
{
    key userid   as Userid,
      username as Username,
      authflag as Authflag
}
