/** ------------------------------------------------------------------------
    File        : AppServerConnectionParameters
    Purpose     : Connection parameter for the AutoEdge|TheFactory appserver
    Syntax      : 
    Description : 
    Author(s)   : pjudge
    Created     : Fri Jan 14 10:24:46 EST 2011
    Notes       : 
  ----------------------------------------------------------------------*/
{routinelevel.i}

using OpenEdge.CommonInfrastructure.AppServerConnectionParameters.

class AutoEdge.Factory.AppServerConnectionParameters inherits AppServerConnectionParameters: 

	constructor public AppServerConnectionParameters (  ):
		super ().
	end constructor.
	
	method override public longchar GetConnectionString(  ):
        return '-AppService AutoEdgeTheFactory '.
/*        return '-AppService AutoEdgeTheFactory -sessionModel session-free '.*/
	end method.
	
end class.