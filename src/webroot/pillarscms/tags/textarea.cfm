<cfsetting enablecfoutputonly="true" />
<!--- -->
<?xml version="1.0" encoding="UTF-8"?>
<fusedoc fuse="textarea.cfm" language="ColdFusion">
	<responsibilities>
		I am a custom tag that displays a textarea with javascript maximum length validation.
	</responsibilities>
	<properties>
		<history author="Ron Gallant" email="ron@rongallant.com" type="create" date="2004-09-20" comments="added ID and ROW attributes" />
		<history author="Ron Gallant" email="ron@rongallant.com" type="create" date="2002-02-20" />
		<version number="1.1 Beta">
		<note author="Ron Gallant" date="2002-02-20">
			If you make any improvements to this tag, please send me a copy and add your name to the history above.
		</note>
		<note author="Ron Gallant" date="2002-02-20">
			To install: put the below tag in place of your textarea field. Include a unique field name and voila. To change the maximum amount of characters allowed in the textarea field, add the max length attributes and enter the new number.
			Minimum to work: <cf_textarea fieldname="">
			Maximum to work: <cf_textarea fieldname="" fieldvalue="" maxlength="" formstyle="" fontstyle="" moreattributes="">
			Example: <cf_textarea fieldname="Comments" fieldvalue="Type Here" maxlength="500" formstyle="background:silver;" fontstyle="font:bold;" moreattributes="tabindex='2'">
		</note>
	</properties>
	<io>
		<in>
			<structure scope="attributes" format="CFML">
				<string name="fieldname" optional="No" comments="I set a unique name for the textareafield" />
				<string name="fieldvalue" comments="I am the starting value of the field, may be a variable" />
				<string name="formstyle" default="width:100%; height:80px;" comments="I am the styles for the textarea" />
				<string name="fontstyle" comments="I am the styles for the text at the bottom" />
				<String name="counter" default="on" comments="is the counter on/off" />
				<String name="maxlength" default="255" comments="I set the maximum number of characters allowed" />
				<String name="attributes.moreattributes" comments="I allow you to add more attributes to the textarea field" />
			</structure>
		</in>
	</io>
</fusedoc>
--->

<cfif thistag.executionmode eq "end">

	<!--- default attributes --->
	<cfparam name="attributes.fieldname" default="" />
	<cfparam name="attributes.fieldvalue" default="" />
	<cfparam name="attributes.fontstyle" default="font:11px;" />
	<cfparam name="attributes.formstyle" default="width:100%; height:80px;" />
	<cfparam name="attributes.counter" default="on" />
	<cfparam name="attributes.maxlength" default="255" type="integer" />
	<cfparam name="attributes.rows" default="5" type="integer" />
	<cfparam name="attributes.moreattributes" default="" />
	
	<!--- error checking - check to see if there is a field name --->
	<cfif attributes.fieldname eq "">
		<p>You need to include a "fieldname".</p>
	<cfelse>
	
		<!--- javascript - I include the javascript on the page --->
		<cfif attributes.counter eq "on" and not (structKeyExists(request, 'txtAreaFieldScript') and request.txtAreaFieldScript)>
			<cfsavecontent variable="toHead">
				<cfoutput>
					<!-- Text area counter script. -->
					<script type="text/javascript">
						function textAreaCounter(fieldId, counterId, maxlimit) {
							var fieldObj = document.getElementById(fieldId);
							var counterObj = document.getElementById(counterId);
							if (fieldObj.value.length > maxlimit) {
								// if too long...trim it!
								fieldObj.value = fieldObj.value.substring(0, maxlimit);
							} else {
								// otherwise, update 'characters left' counter
								counterObj.innerHTML = maxlimit - fieldObj.value.length;
							}
							return false;
						}
						var oldLoad = window.onload;
						window.onload=function(){
							oldLoad;
							textAreaCounter('#attributes.fieldname#ID', '#attributes.fieldname#CounterID', #attributes.maxlength#);
						}
					</script>
				</cfoutput>
				<cfset request.txtAreaFieldScript = 1 />
			</cfsavecontent>
			<cfhtmlhead text="#toHead#" />
		</cfif>
	
		<!--- application variables --->
		<cfset request.CharLeft = #attributes.maxlength#-len(trim(#attributes.fieldvalue#)) />
	
		<!--- outputed field - I display the textarea field in the form --->
		<cfoutput>
		<textarea
			id="#attributes.fieldname#ID"
			name="#attributes.fieldname#"
			rows="#attributes.rows#"
			class="myTextarea"
			onkeydown="textAreaCounter('#attributes.fieldname#ID', '#attributes.fieldname#CounterID', #attributes.maxlength#);"
			onkeyup="textAreaCounter('#attributes.fieldname#ID', '#attributes.fieldname#CounterID', #attributes.maxlength#);">#attributes.fieldvalue#</textarea>
		<cfif attributes.counter eq "on">
			<div style="#attributes.fontstyle#">You have <span id="#attributes.fieldname#CounterID"></span> / #attributes.maxlength# characters left.</div>
		</cfif>
		</cfoutput>
	</cfif>

</cfif>
<cfsetting enablecfoutputonly="false" />