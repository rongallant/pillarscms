<cfimport prefix="sec" taglib="../../../" />
<cfoutput>
<script type="text/javascript">
objForm = new qForm("myForm");

// name
	objForm.name.description = "Application Name";
	objForm.name.required = true;

// pageidlist
	objForm.pageidlist.description = "Pages";
	objForm.pageidlist.required = true;

<sec:security rights="700">
// I prompt the user to delete an entry
function deleteEntry() {
	var conf = confirm('Are you sure you want to delete (#JSStringFormat(qGroup.name)#)?');
	if(conf) {
		this.location.href = "#myself##xfa.delete#&groupid=#qGroup.groupid#";
	}
}
</sec:security>

// Add events to the buttons
<cfif attributes.fuseaction eq "#fusebox.thisCircuit#.new" or attributes.fuseaction eq "#fusebox.thisCircuit#.home" or attributes.fuseaction eq "#fusebox.thisCircuit#.">
	objForm.Add.addEvent("onclick", "setfuseaction('#fusebox.thisCircuit#.add');", false);
<cfelseif attributes.fuseaction eq "#fusebox.thisCircuit#.edit">
	objForm.Update.addEvent("onclick", "setfuseaction('#fusebox.thisCircuit#.update');", false);
	<sec:security rights="700">
		objForm.Delete.addEvent("onclick", "deleteEntry();", false);
	</sec:security>
</cfif>
</script>
</cfoutput>