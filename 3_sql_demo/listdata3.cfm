<cfscript>
    objSqlStatement = createObject( "java", "com.hazelcast.sql.SqlStatement" 
                                  ).init( "SELECT * FROM myDistributedMap WHERE this LIKE '%Jo%'" );

    sql = application.hz1.getSql();
    result = sql.execute( objSqlStatement );
</cfscript>

<cfset it = result.iterator() />
<cfoutput>
    <h1>The Beatles, Filtered</h1>

    <cfloop condition="#it.hasNext()#">
        <cfset item = it.next() />

        <div>#item.getObject( 1 )#</div>
    </cfloop>
</cfoutput>
