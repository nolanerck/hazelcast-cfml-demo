<cfscript>

    helloWorldConfig = createObject( "java", "com.hazelcast.config.Config" ).init();
    hazelcast = createObject( "java", "com.hazelcast.core.Hazelcast" );
    objSqlStatement = createObject( "java", "com.hazelcast.sql.SqlStatement" ).init( "CREATE MAPPING myDistributedMap TYPE IMap OPTIONS ('keyFormat'='varchar','valueFormat'='varchar')" );

    dump( objSqlStatement );
//     abort;

    helloWorldConfig.setClusterName( "hello-world" );

    helloWorldConfig.getJetConfig();

    jetConfig = helloWorldConfig.getJetConfig();
    jetConfig.setEnabled( true );

    hz = Hazelcast.newHazelcastInstance( helloWorldConfig );

    sql = hz.getSql();
    dump (sql );
    // abort;

    // createMappingQuery = "CREATE MAPPING myDistributedMap TYPE IMap OPTIONS ('keyFormat'='varchar','valueFormat'='varchar')";
    // createMappingQuery = "";
    createMappingQuery = objSqlStatement;

    sql.execute( createMappingQuery );

</cfscript>

