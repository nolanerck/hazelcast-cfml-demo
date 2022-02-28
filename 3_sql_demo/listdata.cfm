<cfscript>
    objSqlStatement = createObject( "java", "com.hazelcast.sql.SqlStatement" 
                                  ).init( "CREATE OR REPLACE MAPPING myDistributedMap TYPE IMap OPTIONS ('keyFormat'='varchar','valueFormat'='varchar')" );

    sql = application.hz1.getSql();
    sql.execute( objSqlStatement );

    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('1', 'John')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('2', 'Paul')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('3', 'George')" ) );
    sql.execute( objSqlStatement.setSql( "SINK INTO myDistributedMap VALUES('4', 'Ringo')" ) );

    result = sql.execute( objSqlStatement.setSql( "SELECT * FROM myDistributedMap" ) );
</cfscript>


<cfset it = result.iterator() />
<cfoutput>
    <h1>The Beatles</h1>

    <cfloop condition="#it.hasNext()#">
        <cfset item = it.next() />

        <div>#item.getObject( 1 )#</div>
    </cfloop>
</cfoutput>
