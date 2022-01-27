<cfscript>

    config  = createObject( "java", "com.hazelcast.config.Config" ).init();
    hazelcast = createObject( "java", "com.hazelcast.core.Hazelcast" );

    // dump( config );
    // dump( hazelcast );

    application.hz1 = hazelcast.newHazelcastInstance( config );

    // dump( application.hz1 );

    _map = application.hz1.getMap( "my-distributed-map" );

    _map.put( "1", "John" );
    _map.put( "2", "Paul" );
    _map.put( "3", "George" );


    WriteOutput( _map.get( "1" ) );
    WriteOutput( _map.get( "2" ) );
    WriteOutput( _map.get( "3" ) );


    // hz1.shutdown();

</cfscript>