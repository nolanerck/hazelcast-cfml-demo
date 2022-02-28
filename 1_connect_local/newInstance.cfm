<cfscript>

    config  = createObject( "java", "com.hazelcast.config.Config" ).init();
    hazelcast = createObject( "java", "com.hazelcast.core.Hazelcast" );

    hz1 = hazelcast.newHazelcastInstance( config );

    _map = hz1.getMap( "my-map" );

    _map.put( "1", "John" );
    _map.put( "2", "Paul" );
    _map.put( "3", "George" );

</cfscript>

<cfoutput>
    <div>Item 1: #_map.get( "1" )#</div>
    <div>Item 2: #_map.get( "2" )#</div>
    <div>Item 3: #_map.get( "3" )#</div>
</cfoutput>

<cfset _map.put( "1", "Ringo" ) />

<cfoutput>
    <div>Item 1: #_map.get( "1" )#</div>
    <div>Item 2: #_map.get( "2" )#</div>
    <div>Item 3: #_map.get( "3" )#</div>
</cfoutput>

