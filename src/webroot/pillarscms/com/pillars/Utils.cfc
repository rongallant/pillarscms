<cfcomponent displayname="Utility" output="false">

	<cffunction name="location">
		<cfargument name="url" type="String" required="true" />
		<cfargument name="addtoken" required="false" default="false" />
		<cflocation url="#arguments.url#" addtoken="#arguments.addtoken#" />
	</cffunction>

	<cffunction name="dump" output="true">
		<cfargument name="var" type="Any" required="true" />
		<cfargument name="label" type="string" required="false" default="" />
		<cfargument name="expand" required="false" default="true" />
		<cfdump var="#arguments.var#" label="#arguments.label#" expand="#arguments.expand#" />
	</cffunction>

	<cffunction name="abort">
		<cfabort />
	</cffunction>

	<cffunction name="formatPhoneNumber" returntype="Any" access="public" description="Returns a formated phone number.">
		<cfargument name="phone" type="string" required="true" />
		<cfargument name="format" type="string" required="false" hint="default:clean" />
		<!--- formatPhoneNumber(904-555-1234, "dashes");
		// formats:
		// dashes - 904-555-1234
		// parenthesis - (904) 555-1234
		// dots - 904.555.1234
		// clean - 9045551234 --->
		<cfscript>
			var local = StructNew();
			local.phone = rereplace(arguments.phone, '\D*', '', 'all');
			if (len(local.phone) eq 10) {
				if (structKeyExists(arguments, 'format')) local.format = arguments.format;
				else local.format = "clean";
				local.areaCode = Left(local.phone, 3);
				local.firstThree = Mid(local.phone, 4, 3);
				local.lastFour = Right(local.phone, 4);
				if (local.format eq "dashes")
					local.result = "#local.areaCode#-#local.firstThree#-#local.lastFour#";
				else if (local.format eq "parenthesis")
					local.result = "(#local.areaCode#) #local.firstThree#-#local.lastFour#";
				else if (local.format eq "dots")
					local.result = "#local.areaCode#.#local.firstThree#.#local.lastFour#";
				else if (local.format eq "clean") // clean
					local.result = local.phone;
			} else local.result = "";
		</cfscript>
		<cfreturn local.result />
	</cffunction>

</cfcomponent>