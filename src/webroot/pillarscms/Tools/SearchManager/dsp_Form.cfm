<cfimport prefix="sec" taglib="../../">
<cfoutput>
<form name="myForm" action="#self#" method="POST">
<table cellpadding="2" cellspacing="2" border="0">
	<tr>
		<td class="myFieldTitle"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="150"/></td>
		<td class="myFieldTitle" width="100%"><img src="#my.design.folder##my.theme.folder#images/spacer.gif" height="1" width="1"/></td>
	</tr>
	<tr>
		<td class="myFieldTitle">Collection name:</td>
		<td>
			#lcase(application.applicationname)#
			<input type="hidden" name="CollectionName" value="#lcase(application.applicationname)#"/>
		</td>
	</tr>
	<tr>
		<td class="myFieldTitle">What do you want to do with the collection?</td>
		<td>

		<sec:security rights="200">
			<input type="radio" name="fuseaction" id="falist" value="#xfa.List#" checked/><label for="falist">Details</label>
			- List the details of this apps search engine<br/>
		</sec:security>

		<sec:security rights="500">
			<input type="radio" name="fuseaction" id="faupdate" value="#xfa.Update#"/><label for="faupdate">Update</label>
			- Update the contents of the search engine.<br/>
		</sec:security>

		<sec:security rights="700">
			<input type="radio" name="fuseaction" id="fadelete" value="#xfa.Delete#"/><label for="fadelete">Delete</label>
			- Delete the search engine.<br/>
		</sec:security>

		<sec:security rights="600">
			<input type="radio" name="fuseaction" id="facreate" value="#xfa.Create#"/><label for="facreate">Create</label>
			- Create the search engine once deleted.<br/>
		</sec:security>

		</td>
	</tr>
	<tr>
		<td colspan="2" align="right" class="myFieldTitle">
			<input type="button" name="submitForm" value="Submit" class="myButton"/>
		</td>
	</tr>
</table>
</form>
</cfoutput>