<cfscript>

    helloWorldConfig = createObject( "java", "com.hazelcast.config.Config" ).init();
    hazelcast = createObject( "java", "com.hazelcast.core.Hazelcast" );
    objSqlStatement = createObject( "java", "com.hazelcast.sql.SqlStatement" ).init( "CREATE OR REPLACE MAPPING myDistributedMap TYPE IMap OPTIONS ('keyFormat'='varchar','valueFormat'='varchar')" );

    helloWorldConfig.setClusterName( "hello-world" );

    jetConfig = helloWorldConfig.getJetConfig();
    jetConfig.setEnabled( true );

    hz = Hazelcast.newHazelcastInstance( helloWorldConfig );

    sql = hz.getSql();

    dump( sql );
    abort;

    createMappingQuery = objSqlStatement;
    sql.execute( createMappingQuery );

    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('1', 'John')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('2', 'Paul')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('3', 'George')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('4', 'Ringo')" ) );

    result = sql.execute( objSqlStatement.setSql( "SELECT * FROM myDistributedMap" ) );

    it = result.iterator();

    while( it.hasNext() )
    {
        item = it.next();
        writeoutput( item.getObject( 1 ) );
    }

</cfscript>

