<!--- -->
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="dsp_ResultNav" language="ColdFusion">
	<responsibilities>
		I display a navigation tool for navigation threw result sets.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2003-01-08" />
		<note author="Ron Gallant" date="2003-01-08">
			Place these before the cfoutput/cfloop
			<cfparam name="attributes.startrow" default="1">
			<cfparam name="attributes.maxrows" default="10">
			<cfinclude template="dsp_ResultNav.cfm">
			Use this as the cfoutput for your query
			<cfoutput query="YourQuery" startrow="#attributes.startrow#" maxrows="#attributes.maxrows#"></cfoutput>
		</note>
	</properties>
	<io>
		<in>
			<string name="self" />
			<structure scope="attributes">
				<string name="startrow" />
				<string name="maxrows" />
				<string name="navTitle" />
				<string name="navXFA" />
				<string name="order" />
				<string name="" />
			</structure>
		</in>
		<out>
			<structure scope="formOrUrl">
				<string name="fuseaction" />
				<string name="startrow" />
			</structure>
		</out>
	</io>
</fusedoc>
--->

<!--- Default values --->
<cfparam name="attributes.startrow" default="1">
<cfparam name="attributes.maxrows" default="15">
<cfset attributes.endrow = attributes.startrow + attributes.maxrows - 1>


<!--- Replace this queryname --->
<!--- qFiles --->

<!--- Place this after the cfoutput/cfloop --->
<cfoutput>
<table cellpadding="2" cellspacing="0" border="0" width="100%">
	<tr>
		<td align="left" colspan="2">
			<!--- I build the querystring to be used in the nav links. Add any variables you need passed in the url. --->			
			<cfparam name="attString" default="">
			<cfif isDefined('attributes.order')><cfset attString = "&order=#attributes.order#"><cfelse><cfset attOrder=""></cfif>
			<cfif isDefined('attributes.filetype')><cfset attString = "#attString#&filetype=#attributes.filetype#"></cfif>		

			<!--- START results navigation--->			
			<!--- I am the last nav --->
			<cfif attributes.startrow gt 1>
				<cfif attributes.startrow-attributes.maxrows lte 1>
					<cfset attributes.back = 1>
				<cfelse>
					<cfset attributes.back = attributes.startrow-attributes.maxrows>
				</cfif>
				<a class="NavText" href="#self#?fuseaction=#attributes.fuseaction#&startrow=#attributes.back##attString#"><span class="NavText">&lt;&lt; Last #attributes.maxrows#</span></a>
			</cfif>

			<cfset attributes.next = attributes.startrow+attributes.maxrows>

			<!--- I display a dash between the navigation links if needed --->
			<cfif (attributes.startrow gt 1) and ( attributes.startrow+attributes.maxrows lte qFiles.recordcount)>-</cfif>

			<!--- I am the next nav --->
			<cfif attributes.startrow+attributes.maxrows lte qFiles.recordcount>
				<cfif attributes.next+attributes.maxrows gt qFiles.recordcount>
					<cfset nextcount = qFiles.recordcount-attributes.next+1>
				<cfelse>
					<cfset nextcount = attributes.maxrows>
				</cfif>
				<a class="NavText" href="#self#?fuseaction=#attributes.fuseaction#&startrow=#attributes.next##attString#"><span class="NavText">Next #nextcount# &gt;&gt;</span></a>
			</cfif>
		<!--- END results navigation --->
		</td>
		<td align="right" colspan="3">
			<!--- Display result set recordcount --->
			<cfif qFiles.recordcount gt 1>
				<div style="color:##006CDE;">There are <b>#qFiles.RecordCount#</b> entries</div>
			</cfif>
		</td>
	</tr>
</table>
</cfoutput>