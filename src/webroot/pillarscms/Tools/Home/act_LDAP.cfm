<!--- 
I return the following variables from ldap
AUTHUSER userid  
EMAIL ron@rongallant.com  
FNAME Ron 
LNAME Gallant  
// --->

<!--- Security Check --->
<cflock scope="Session" timeout="10">
	<cfparam name="session.userid" default="" />
	<cfset tmp = session.my.oUserInfo.getUserInfo(session.userid, my.db.dsn, my.db.TablePrefix) />
	<cfset StructAppend(my.user, session.my.oUserInfo.getUser()) />
</cflock> 
