<cfscript>
	config 			   = createObject( "java", "com.hazelcast.client.config.ClientConfig" ).init();
	clientProperty     = createObject( "java", "com.hazelcast.client.properties.ClientProperty" );
	objHazelcastClient = createObject( "java", "com.hazelcast.client.HazelcastClient" );
	STATISTICS_ENABLED = clientProperty.STATISTICS_ENABLED;
	HAZELCAST_CLOUD_DISCOVERY_TOKEN = clientProperty.HAZELCAST_CLOUD_DISCOVERY_TOKEN;

	config.setProperty( STATISTICS_ENABLED.getName(), "true" );
	config.setProperty( HAZELCAST_CLOUD_DISCOVERY_TOKEN.getName(), 
						"Vvc74IMTjUThdDzpo9A0KlYmpjUiJ8ixBDmgoYIVOHU5cEdQPK" );
	config.setClusterName( "pr-2904" ); 

	config.getInstanceTrackingConfig()
	.setEnabled( true )
	.setFileName("./tracking.txt")
	.setFormatPattern("$HZ_INSTANCE_TRACKING\{product}:$HZ_INSTANCE_TRACKING\{version}");	

	dump( config );
//	abort;

	thread action="run" name="myThread" {
		application.hazelcastClient = objHazelcastClient.newHazelcastClient( config );
	}

//	thread action="join" name="myThread";

	writeoutput( "hazelcast is running." );


// 	haz.shutdown();



</cfscript>
