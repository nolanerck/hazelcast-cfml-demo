<cfscript>

    application.hazelcastClient.shutdown();

    writeoutput( "Hazelcast has stopped." );

</cfscript>