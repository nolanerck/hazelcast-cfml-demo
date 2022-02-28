<cfset _map = application.hz1.getMap( "my-map" ) />

<cfoutput>
    <div>Item 1: #_map.get( "1" )#</div>
    <div>Item 2: #_map.get( "2" )#</div>
    <div>Item 3: #_map.get( "3" )#</div>
    <div>Item 4: #_map.get( "4" )#</div>
</cfoutput>

