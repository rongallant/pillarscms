<!---
<?xml version="1.0" encoding="UTF-8" ?>
<fusedoc fuse="act_CreateDateTime" language="ColdFusion">
	<responsibilities>
		I set the CreateDate time var from a given date and time.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2004-04-24" />
	</properties>
</fusedoc>
--->

<cfscript>
	// Create StartDateTime
	d = ListFirst(attributes.StartDateTime," ");
	t = ListLast(attributes.StartDateTime," ");
	StartDateTime = CreateDateTime(DatePart('yyyy',d),DatePart('m',d),DatePart('d',d),hour(t),minute(t),0);
</cfscript>