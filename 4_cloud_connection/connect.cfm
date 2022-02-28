<cfscript>
    clientProperty = createObject( "java", "com.hazelcast.client.properties.ClientProperty" );
    STATISTICS_ENABLED = clientProperty.STATISTICS_ENABLED;
    HAZELCAST_CLOUD_DISCOVERY_TOKEN = clientProperty.HAZELCAST_CLOUD_DISCOVERY_TOKEN;

    config  = createObject( "java", "com.hazelcast.client.config.ClientConfig" ).init();
    
    config.setProperty( STATISTICS_ENABLED.getName(), "true" );
    config.setProperty( HAZELCAST_CLOUD_DISCOVERY_TOKEN.getName(), application.discoveryToken );
    config.setClusterName( application.clusterName );

    hazelcastClient = CreateObject( "java", "com.hazelcast.client.HazelcastClient" ).newHazelcastClient( config );

    // dump( hazelcastClient );
    
    writeOutput( "<div>Client connected.</div>" );

    _map = hazelcastClient.getMap( "musicians" );
    _map.put( "drummer", "Ringo" );
    _map.put( "bass", "Paul" );
    _map.put( "guitar", "George" );
    _map.put( "vocals", "John" );

    writeOutput( "<div>Map 'beatles' has been popualted.</div>" );

</cfscript>
