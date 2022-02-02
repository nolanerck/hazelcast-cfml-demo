<!--- https://docs.hazelcast.com/hazelcast/5.0/pipelines/stream-processing-embedded     --->

<cfscript>

    Config            = CreateObject( "java", "com.hazelcast.config.Config" );
    Hazelcast         = CreateObject( "java", "com.hazelcast.core.Hazelcast" );
    HazelcastInstance = CreateObject( "java", "com.hazelcast.core.HazelcastInstance" );
    Pipeline          = CreateObject( "java", "com.hazelcast.jet.pipeline.Pipeline" );
    Sinks             = CreateObject( "java", "com.hazelcast.jet.pipeline.Sinks" );
    TestSources       = CreateObject( "java", "com.hazelcast.jet.pipeline.test.TestSources" );

    // Initialize an empty pipeline.
    pipeline = Pipeline.create();


    pipeline.readFrom(TestSources.itemStream(10)) 
            .withoutTimestamps() 
            // .filter( function( event ) {
            //     return event.sequence() % 2 == 0;
            // })
            .setName("filter out odd numbers") 
            .writeTo(Sinks.logger()); 

    dump( pipeline );
    abort;

    hz = Hazelcast.bootstrappedInstance(); 

    hz.getJet().newJob(pipeline);    


</cfscript>
