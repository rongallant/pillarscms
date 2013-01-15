<!-- CF_PageThru, Copyright © 1999 Roy P. Johnston, Jr.  Written by Roy P. Johnston, Jr. and Matt Perry
	More info:  http://www.johnstons.org/wdc/pub/cfusion/customtags/
--->

<CFSETTING ENABLECFOUTPUTONLY="Yes">
<!--- *** LEGAL NOTICE ***
	This tag and the code herein, including portions thereof, may not be modified,
	re-used, re-sold without the expressed written consent of Roy Johnston, Jr.
	This package, including files PageThru.cfm and CF_PageThru.html, is Freeware and may
	be freely distributed only as the original package, unmodified and intact.
--->

<!--- *** PACKAGE INFORMATION ***
	FILES: PageThru.cfm, CF_PageThru.html
	The most current release of this package can be downloaded at 
		http://www.johnstons.org/wdc/pub/cfusion/customtags/
	Send suggestions or comments to ihuj@yahoo.com.
	Submit bug reports or code modifications to ihuj@yahoo.com
	with the subject line "CF_PageThru".
--->

<!--- CF_DirInfo : Custom Tag for Cold Fusion 3.0
	Created June 2, 1999 - Modified 6/2/1999
	This custom tag returns a navigational aid that will allow a user to page through
	database query listing that is broken up into multiple pages.  The following is
	returned:	

	- A navigational bar with pervious page and next page buttons AND
		numeric page links that will allow a user to jump to a specific page.
 	- The start and end rows that should be displayed on the current page.

*** SYNATAX ***
<CF_PAGETHRU TOTALRECORDS="integer" CURRENTPAGE="integer" TEMPLATEURL="URL Path"
	ADDEDPATH="string" DISPLAYCOUNT="integer" PAGEGROUP="integer"
	IMAGEPATH="URL path" IMAGEHEIGHT="integer" IMAGEWIDTH="integer"
	HILIGHTCOLOR="hex code or color literal" PREVIOUSSTR="string"
	NEXTSTR="string" PREVIOUSGROUPSTR="string" NEXTGROUPSTR="string"
	LINKCLASS="string">

 - TOTALRECORDS (required) specifies the records returned by the query to be paged through.
 - CURRENTPAGE (required) the current page in the query that is to be displayed.
 - TEMPLATEURL (required) the URL path of the template that is paging though the query.
	This will usually be that same template that is calling CF_PageThru.
 - ADDEDPATH (optional) additonal URL parameters that will tacked on to the navigational URLs.
	The parameter list must start with an amperstand (&)
 - DISPLAYCOUNT (optional) specifies the maximum number of records to be displayed per page.
	The default is 25 records.
 - PAGEGROUP (optional) the maximum numnber of numeric page links to be displayed at one time
	in the page through navigation.  Set PAGEGROUP="0" to turn page grouping off.
	The default is 10.
 - IMAGEPATH (optional) the URL path of the images to be used in the navigation.  This
	includes buttons for Next/Previous and Next Group/Previous Group.
	The default is "" (empty path) which results in using the current template
	URL directory for images.  Set IMAGEPATH="NONE" to use hypertext buttons.
 - IMAGEHEIGHT (optional) the height of all image buttons.  The default is 10 pixels.
 - IMAGEWIDTH (optional) the width of all image buttons.  The default is 10 pixels.
 - HILITECOLOR (optional) the text color of the current page number in the page through
	navigation.  The default is "Red".
 - PREVIOUSSTR (optional) the hyperlink text of the previous button.  The default is "<".
	You must set IMAGEPATH="NONE" to use this option.
 - NEXTSTR (optional) the hyperlink text of the next button.  The default is ">".
	You must set IMAGEPATH="NONE" to use this option.
 - PREVIOUSGROUPSTR (optional) the hyperlink text of the previous group button.  The default is "<<".
	You must set IMAGEPATH="NONE" to use this option.
 - NEXTGROUPSTR (optional) the hyperlink text of the next group button.  The default is ">>".
	You must set IMAGEPATH="NONE" to use this option.
 - USETABLEHTML (optional) wrap html table code around output elements. Default is FALSE
 - LINKCLASS (optional) stylesheet class to embed in the table cells 
	
*** RETURNED VARS ***

PT_StartRow  - the first row of the paged query to be displayed on the current page.
PT_EndRow - the last row of the paged query to be displayed on the current page.
PT_PageThru - navigation.  Output this variable wherever you want the PageThru navigation
	to be displayed.
PT_ErrorCode - Numeric error code.  If not zero, an error occured. 
PT_ErrorMsg - Error description.

--->


<!--- INITIALIZE VARAIBLES --->
<CFPARAM NAME="Attributes.TotalRecords" DEFAULT="0">
<CFPARAM NAME="Attributes.DisplayCount" DEFAULT="25">
<CFPARAM NAME="Attributes.PageGroup" DEFAULT="10">
<CFPARAM NAME="Attributes.CurrentPage" DEFAULT="1">
<CFPARAM NAME="Attributes.TemplateURL" DEFAULT="">
<CFPARAM NAME="Attributes.AddedPath" DEFAULT="">
<CFPARAM NAME="Attributes.ImagePath" DEFAULT="">
<CFPARAM NAME="Attributes.ImageHeight" DEFAULT="10">
<CFPARAM NAME="Attributes.ImageWidth" DEFAULT="10">
<CFPARAM NAME="Attributes.HiLiteColor" DEFAULT="Red">
<CFPARAM NAME="Attributes.PreviousStr" DEFAULT="&lt;">
<CFPARAM NAME="Attributes.PreviousGroupStr" DEFAULT="&lt;&lt;">
<CFPARAM NAME="Attributes.NextStr" DEFAULT="&gt;">
<CFPARAM NAME="Attributes.NextGroupStr" DEFAULT="&gt;&gt;">
<CFPARAM NAME="Attributes.LinkClass" DEFAULT="">
<CFPARAM NAME="Attributes.USETABLEHTML" DEFAULT=FALSE>
<CFSET ErrorCode = 0>
<CFSET PageStr = "">

<!--- ERROR CODES --->
<CFSET ErrorArray = ArrayNew(1)>
<CFSET ErrorArray[1] = "The 'TotalRecords' parameter must be a positive integer.">
<CFSET ErrorArray[2] = "The 'DisplayCount' parameter must be an integer greater than zero.">
<CFSET ErrorArray[3] = "The 'PageGroup' parameter must be a positive integer.">
<CFSET ErrorArray[4] = "The 'CurrentPage' parameter must be an integer greater than zero.">

<!--- CHECK IF PARAMETERS PASSED ARE PROPER --->
<CFIF NOT IsNumeric(Attributes.TotalRecords) OR Val(Attributes.TotalRecords) LT 0>
	<CFSET ErrorCode = 1>
</CFIF>
<CFIF NOT IsNumeric(Attributes.DisplayCount) OR Val(Attributes.DisplayCount) LT 1>
	<CFSET ErrorCode = 2>
</CFIF>
<CFIF NOT IsNumeric(Attributes.PageGroup) OR Val(Attributes.PageGroup) LT 0>
	<CFSET ErrorCode = 3>
</CFIF>
<CFIF NOT IsNumeric(Attributes.CurrentPage) OR Val(Attributes.CurrentPage) LT 1>
	<CFSET ErrorCode = 4>
</CFIF>


<!---	Calculate Page Starts and Stops	--->
<CFSET Start = (Attributes.CurrentPage - 1) * Attributes.DisplayCount + 1>
<CFSET End = Attributes.CurrentPage * Attributes.DisplayCount>
<CFSET End = IIf(End GT Attributes.TotalRecords, Attributes.TotalRecords, End)>

<CFSET MaxPages = Attributes.TotalRecords / Attributes.DisplayCount>
<CFIF Attributes.TotalRecords MOD Attributes.DisplayCount>
<CFSET MaxPages = IncrementValue(MaxPages)>
</CFIF>


<!---	Calculate the range of diaplyed pages	--->
<CFIF MaxPages GT Attributes.PageGroup AND Attributes.PageGroup>
	<CFIF (MaxPages - Attributes.CurrentPage) GT (Attributes.PageGroup - 1)>
		<CFSET FromPage = Attributes.CurrentPage>
		<CFSET ToPage = Attributes.CurrentPage + Attributes.PageGroup - 1>
	<CFELSE>
		<CFSET FromPage = MaxPages - (Attributes.PageGroup - 1)>
		<CFSET ToPage = MaxPages>
	</CFIF>
<CFELSE>
	<CFSET FromPage = 1>
	<CFSET ToPage = MaxPages>
</CFIF>


<!---	Decide to use hypertext or graphic navigation	--->
<CFIF NOT CompareNoCase(UCase(Attributes.ImagePath), 'NONE')>
	<CFSET PGStr = Attributes.PreviousGroupStr>
	<CFSET PPStr = Attributes.PreviousStr>
	<CFSET NPStr = Attributes.NextStr>
	<CFSET NGStr = Attributes.NextGroupStr>
<CFELSE>
	<CFSET PGStr = "<img src=""#Attributes.ImagePath#lleft.gif"" width=""#Attributes.ImageWidth#"" height=""#Attributes.ImageHeight#"" border=0 align=""absmiddle"" value=""#Attributes.PreviousGroupStr#"">">
	<CFSET PPStr = "<img src=""#Attributes.ImagePath#left.gif"" width=""#Attributes.ImageWidth#"" height=""#Attributes.ImageHeight#"" border=0 align=""absmiddle"" value=""#Attributes.PreviousStr#"">">
	<CFSET NPStr = "<img src=""#Attributes.ImagePath#right.gif"" width=""#Attributes.ImageWidth#"" height=""#Attributes.ImageHeight#"" border=0 align=""absmiddle"" value=""#Attributes.NextStr#"">">
	<CFSET NGStr = "<img src=""#Attributes.ImagePath#rright.gif"" width=""#Attributes.ImageWidth#"" height=""#Attributes.ImageHeight#"" border=0 align=""absmiddle"" value=""#Attributes.NextGroupStr#"">">
</CFIF>

<CFIF attributes.USETABLEHTML>
	<table cellpadding=0 cellspacing=0 border=0 class="#attributes.LINKCLASS#"><tr><td>
</CFIF>

<CFIF MaxPages GTE 2>
	<!--- <CFSET PageStr = "<font size=""-1"">Page&nbsp;</font>"> --->
	<CFSET PageStr = "">
	<CFIF FromPage NEQ 1 AND Attributes.PageGroup>
		<CFIF (Attributes.CurrentPage - Attributes.PageGroup) GTE 1><CFSET Prev = Attributes.CurrentPage - Attributes.PageGroup><CFELSE><CFSET Prev = 1></CFIF>
		<CFSET PageStr = PageStr & " <A HREF=""#Attributes.TemplateURL#?CurrentPage=#Prev##Attributes.AddedPath#"">#PGStr#</A> ">
	</CFIF>
	<CFIF Attributes.CurrentPage NEQ 1><CFSET Prev = Attributes.CurrentPage - 1>
		<CFSET PageStr = PageStr & " <A HREF=""#Attributes.TemplateURL#?CurrentPage=#Prev##Attributes.AddedPath#"">#PPStr#</A> ">
	</CFIF>
	<CFLOOP INDEX="Count" FROM="#FromPage#" TO="#ToPage#">
		<CFIF Count IS Attributes.CurrentPage>
			<CFSET PageStr = PageStr & " <B><font color=""#Attributes.HiLiteColor#""> #Count#</font></B> ">
		<CFELSE>
			<CFSET PageStr = PageStr & " <A HREF=""#Attributes.TemplateURL#?CurrentPage=#Count##Attributes.AddedPath#""> #Count#</A> ">
		</CFIF>
	</CFLOOP>
	<CFIF Attributes.CurrentPage NEQ MaxPages>
		<CFSET Next = Attributes.CurrentPage + 1>
		<CFSET PageStr = PageStr & " <A HREF=""#Attributes.TemplateURL#?CurrentPage=#Next##Attributes.AddedPath#"">#NPStr#</A> ">
	</CFIF>
	<CFIF ToPage NEQ MaxPages AND Attributes.PageGroup><CFSET Next = ToPage + 1>
		<CFSET PageStr = PageStr & " <A HREF=""#Attributes.TemplateURL#?CurrentPage=#Next##Attributes.AddedPath#"">#NGStr#</A> ">
	</CFIF>
</CFIF>

<CFIF attributes.USETABLEHTML>
</td></tr></table>
</CFIF>

<!--- RETURN VARIABLES --->
<CFSET Caller.PT_StartRow = Start>
<CFSET Caller.PT_EndRow = End>
<CFSET Caller.PT_PageThru = PageStr>
<CFSET Caller.PT_ErrorCode = ErrorCode>
<CFIF ErrorCode IS 0>
	<CFSET Caller.PT_ErrorMsg = "OK.">
<CFELSE>
	<CFSET Caller.PT_ErrorMsg = ErrorArray[ErrorCode]>
</CFIF>

<CFSETTING ENABLECFOUTPUTONLY="No">
