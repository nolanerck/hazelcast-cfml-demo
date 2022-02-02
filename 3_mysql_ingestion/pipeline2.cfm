<!--- https://docs.hazelcast.com/hazelcast/5.0/pipelines/stream-processing-embedded     --->

<cfscript>

    Config            = CreateObject( "java", "com.hazelcast.config.Config" );
    Hazelcast         = CreateObject( "java", "com.hazelcast.core.Hazelcast" );
    HazelcastInstance = CreateObject( "java", "com.hazelcast.core.HazelcastInstance" );
    Pipeline          = CreateObject( "java", "com.hazelcast.jet.pipeline.Pipeline" );
    Sinks             = CreateObject( "java", "com.hazelcast.jet.pipeline.Sinks" );
    TestSources       = CreateObject( "java", "com.hazelcast.jet.pipeline.test.TestSources" );

    // MySqlCdcSources   = createObject( "java", "com.hazelcast.jet.cdc.mysql" );

    // dump( MySqlCdcSources );
    // abort;

    // Initialize an empty pipeline.
    pipeline = Pipeline.create();

dump( pipeline );
abort;    

    pipeline.readFrom(
        MySqlCdcSources.mysql("customers")
                .setDatabaseAddress("127.0.0.1")
                .setDatabasePort(3306)
                .setDatabaseUser("root")
                .setDatabasePassword("mypassword123")
                .setClusterName("dbserver1")
                .setDatabaseWhitelist("vandelayindustries")
                .setTableWhitelist("vandelayindustries.tCustomers")
                .build())
        .withNativeTimestamps(0)
        .writeTo( Sinks.logger() );

</cfscript>