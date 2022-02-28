<cfscript>
    _map = application.hz1.getMap( "my-map" );

    _map.put( "1", "John" );
    _map.put( "2", "Paul" );
    _map.put( "3", "George" );
    _map.put( "4", "Ringo" );

</cfscript>

<cfoutput>
    <div>Item 1: #_map.get( "1" )#</div>
    <div>Item 2: #_map.get( "2" )#</div>
    <div>Item 3: #_map.get( "3" )#</div>
    <div>Item 4: #_map.get( "4" )#</div>
</cfoutput>

