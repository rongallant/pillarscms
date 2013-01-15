<cfif len(qScroller.height)>
	<cfset my.form.height = qScroller.height />
<cfelse>
	<cfset my.form.height = 200 />
</cfif>

<cfif len(qScroller.width)>
	<cfset my.form.width = qScroller.width />
<cfelse>
	<cfset my.form.width = 150 />
</cfif>

<cfif len(qScroller.scrolltime)>
	<cfset my.form.scrolltime = qScroller.scrolltime />
<cfelse>
	<cfset my.form.scrolltime = 5 />
</cfif>

<cfif len(qScroller.stoptime)>
	<cfset my.form.stoptime = qScroller.stoptime />
<cfelse>
	<cfset my.form.stoptime = 3 />
</cfif>

<cfif len(qScroller.bgcolor)>
	<cfset my.form.bgcolor = qScroller.bgcolor />
<cfelse>
	<cfset my.form.bgcolor = "FFFFFF" />
</cfif>