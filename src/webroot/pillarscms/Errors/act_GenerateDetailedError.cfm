<cfparam name="ErrorMessageFull" default="" />
<cfsavecontent variable="errormessage">
	<!--- I generate the thrown error --->
	<cfinclude template="dsp_DefaultError.cfm" />
</cfsavecontent>
<cfif isDefined('request.my.app.mode') and ListContains("1,2,3",request.my.app.mode)>
	<!--- I am the debugging error --->
	<cfparam name="request.errorcount" default="1" type="numeric" />
	<cfsavecontent variable="ErrorMessageFull">
		<cfoutput>
			<form name="ErrorMessage" style="margin:0;">
				<input type="Button" name="ErrorShow" id="ErrorShow" value="See Error #request.errorcount#" onclick="expandIt(Error#request.errorcount#);" />
				<div id="Error#request.errorcount#" class="errorlayer">
					<input type="Button" name="ErrorHide" id="ErrorHide" value="Hide Error #request.errorcount#" onclick="v(Error#request.errorcount#);" />
					#errormessage#
				</div>
			</form>
		</cfoutput>
	</cfsavecontent>
	<cfset request.errorcount = request.errorcount + 1 />
<cfelse>
	<!--- I am the production error --->
	<cfinclude template="act_EmailError.cfm" />
	<cfif not isDefined('request.errorDisplayed')>
		<cfset request.errorDisplayed = 1 />
		<cfinclude template="dsp_UserErrorMessage.cfm" />
		<cfset my.page.heading = "#fusebox.cfcatch.type# Error" />
		<cfset my.page.subheading = "" />
		<cfset my.page.title = my.page.heading />
	</cfif>
</cfif>