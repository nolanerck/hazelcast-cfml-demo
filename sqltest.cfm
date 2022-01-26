<cfscript>

    helloWorldConfig = createObject( "java", "com.hazelcast.config.Config" ).init();
    hazelcast = createObject( "java", "com.hazelcast.core.Hazelcast" );
    objSqlStatement = createObject( "java", "com.hazelcast.sql.SqlStatement" ).init( "CREATE MAPPING myDistributedMap TYPE IMap OPTIONS ('keyFormat'='varchar','valueFormat'='varchar')" );

//    dump( objSqlStatement );
//     abort;

    helloWorldConfig.setClusterName( "hello-world" );

    helloWorldConfig.getJetConfig();

    jetConfig = helloWorldConfig.getJetConfig();
    jetConfig.setEnabled( true );

    hz = Hazelcast.newHazelcastInstance( helloWorldConfig );

    sql = hz.getSql();
//    dump (sql );
    // abort;

    // createMappingQuery = "CREATE MAPPING myDistributedMap TYPE IMap OPTIONS ('keyFormat'='varchar','valueFormat'='varchar')";
    // createMappingQuery = "";
    createMappingQuery = objSqlStatement;

    sql.execute( createMappingQuery );

    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('1', 'John')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('2', 'Paul')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('3', 'George')" ) );

    result = sql.execute( objSqlStatement.setSql( "SELECT * FROM myDistributedMap" ) );

    //dump( result );

    it = result.iterator();

    // dump( it );

    //dump( it.next().toString() );

    while( it.hasNext() )
    {
        item = it.next();

        dump( item );
    }

</cfscript>

