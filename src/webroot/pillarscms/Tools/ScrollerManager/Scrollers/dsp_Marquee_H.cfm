<!--- -->
<?xml version="1.0" encoding="UTF-8"?>
<fusedoc fuse="Marquee_H.cfm" language="ColdFusion">
	<responsibilities>
		Cross browser marquee script. I display a horizontal marquee.
	</responsibilities>
	<properties>
		<history email="ron@rongallant.com" type="create" date="2002-02-22" />
	</properties>
	<io>
		<in>
			<string name="attributes.Width" format="CFML" />
			<string name="attributes.Height" format="CFML" />
			<string name="attributes.Speed" format="CFML" />
			<string name="attributes.Contents" format="CFML" />
		</in>
	</io>
</fusedoc>
--->

<cfparam name="attributes.font" default="Arial">
<cfparam name="attributes.Width" default="330">
<cfparam name="attributes.Height" default="20">
<cfparam name="attributes.Speed" default="4">
<cfparam name="attributes.style" default="">
<cfparam name="attributes.Contents" default="Your Text Goes Here">



<cf_fbx_savecontent variable="MessageList">
	<cfoutput query="GetMessage">
	
	<cfif GetMessage.txtstyle eq "bold">
		<cfset attributes.style = " font-weight:bold;">
	<cfelseif GetMessage.txtstyle eq "italic">
		<cfset attributes.style = " font-style:italic;">
	</cfif>

	
	<span style="font-family:#attributes.font#; font-size:#GetMessage.txtsize#px; color:#GetMessage.txtcolor#;#attributes.style#"><cfif GetMessage.url neq ""><a href="#GetMessage.url#" target="#GetMessage.target#"></cfif>#GetMessage.Message#<cfif GetMessage.url neq ""></a></cfif><cfif GetMessage.CurrentRow neq GetMessage.RecordCount>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</cfif></span></cfoutput>
</cf_fbx_savecontent>

<cfoutput>
<script language="JavaScript1.2">
<!--
//Specify the marquee's width (in pixels)
	var marqueewidth=#attributes.Width#

//Specify the marquee's height (in pixels, pertains only to NS)
	var marqueeheight=#attributes.Height#

//Specify the marquee's scroll speed (larger is faster)
	var speed=#attributes.Speed#

//Specify the marquee contents
	var marqueecontents='#trim(variables.MessageList)#'

if (document.all)
document.write('<marquee scrollAmount='+speed+' style="width:'+marqueewidth+'">'+marqueecontents+'</marquee>')

function regenerate(){
	window.location.reload()
}

function regenerate2(){
	if (document.layers){
		setTimeout("window.onresize=regenerate",450)
		intializemarquee()
	}
}

function intializemarquee(){
	document.cmarquee01.document.cmarquee02.document.write('<nobr>'+marqueecontents+'</nobr>')
	document.cmarquee01.document.cmarquee02.document.close()
	thelength=document.cmarquee01.document.cmarquee02.document.width
	scrollit()
}

function scrollit(){
	if (document.cmarquee01.document.cmarquee02.left>=thelength*(-1)){
		document.cmarquee01.document.cmarquee02.left-=speed
		setTimeout("scrollit()",100)
	}
	else{
		document.cmarquee01.document.cmarquee02.left=marqueewidth
		scrollit()
	}
}

window.onload=regenerate2
// -->
</script>
</cfoutput>

<ilayer width=&{marqueewidth}; height=&{marqueeheight}; name="cmarquee01">
	<layer name="cmarquee02"></layer>
</ilayer>

