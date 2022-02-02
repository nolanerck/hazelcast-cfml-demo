<cfscript>

    Config            = CreateObject( "java", "com.hazelcast.config.Config" );
    Hazelcast         = CreateObject( "java", "com.hazelcast.core.Hazelcast" );
    HazelcastInstance = CreateObject( "java", "com.hazelcast.core.HazelcastInstance" );
    Pipeline          = CreateObject( "java", "com.hazelcast.jet.pipeline.Pipeline" );
    Sinks             = CreateObject( "java", "com.hazelcast.jet.pipeline.Sinks" );
    TestSources       = CreateObject( "java", "com.hazelcast.jet.pipeline.test.TestSources" );

dump( Pipeline );
abort;

</cfscript>