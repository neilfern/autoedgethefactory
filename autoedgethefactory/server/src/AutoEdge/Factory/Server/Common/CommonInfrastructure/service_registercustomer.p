/** ------------------------------------------------------------------------
    File        : AutoEdge/Factory/Server/Common/CommonInfrastructure/service_registercustomer.p
    Purpose     : 

    Syntax      :

    Description : 

    @author pjudge
    Created     : Wed Mar 09 13:55:44 EST 2011
    Notes       :
  ----------------------------------------------------------------------*/
{routinelevel.i}

using OpenEdge.CommonInfrastructure.Common.ISecurityManager.
using OpenEdge.CommonInfrastructure.Common.SecurityManager.
using OpenEdge.CommonInfrastructure.Common.IServiceManager.
using OpenEdge.CommonInfrastructure.Common.ServiceManager.
using OpenEdge.CommonInfrastructure.Common.IUserContext.

using OpenEdge.Core.System.ApplicationError.

using OpenEdge.Lang.String.
using OpenEdge.Lang.ABLSession.
using OpenEdge.Lang.Assert.
using Progress.Lang.Class.
using Progress.Lang.AppError.
using Progress.Lang.Error.

/** -- params, defs -- **/
define input parameter pcBrand as character no-undo.
define input parameter pcCustomerName as character no-undo.
define input parameter pcUserName as character no-undo.
define input parameter pcPassword as character no-undo.
define input parameter pcCustomerEmail as longchar no-undo.

define output parameter piCustNum as integer no-undo.
define output parameter pcSalesRep as character no-undo.

define variable oServiceMgr as IServiceManager no-undo.
define variable oSecMgr as ISecurityManager no-undo.
define variable oContext as IUserContext no-undo.
define variable cUserName as character no-undo.
define variable cUserDomain as character no-undo.
define variable cUserPassword as character no-undo.

/** Dummy return for modelling purposes (Savvion lets us make a test call to a WebService). */
if pcBrand eq 'Savvion::Test' then
do:
    assign pcSalesRep = 'pcSalesRep'
           piCustNum = -1.
    return.
end.

/** -- validate defs -- **/
Assert:ArgumentNotNullOrEmpty(pcBrand, 'Brand').
Assert:ArgumentNotNullOrEmpty(pcUserName, 'Customer User Name').
Assert:ArgumentNotNullOrEmpty(pcPassword, 'Customer Password').
Assert:ArgumentNotNullOrEmpty(pcCustomerName, 'Customer name').
Assert:ArgumentNotNullOrEmpty(pcCustomerEmail, 'Customer Email').

/** -- main -- **/
oServiceMgr = cast(ABLSession:Instance:SessionProperties:Get(ServiceManager:IServiceManagerType), IServiceManager).

oSecMgr = cast(oServiceMgr:StartService(SecurityManager:ISecurityManagerType), ISecurityManager).

/* log in and establish tenancy, user context */
assign cUserName = 'admin'
       cUserDomain = 'admin.' + pcBrand
       cUserPassword = encode('letmein').
oSecMgr:UserLogin(cUserName, cUserDomain, cUserPassword).

@todo(task="implement", action="do something useful here").


error-status:error = no.
return.

/** -- error handling -- **/
catch oApplError as ApplicationError:
    return error oApplError:ResolvedMessageText().
end catch.

catch oAppError as AppError:
    return error oAppError:ReturnValue. 
end catch.

catch oError as Error:
    return error oError:GetMessage(1).
end catch.
/** -- eof -- **/