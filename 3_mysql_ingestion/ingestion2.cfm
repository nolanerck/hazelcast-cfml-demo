<cfscript>

    Hazelcast = CreateObject( "java", "com.hazelcast.core.Hazelcast" );
    HazelcastInstance = CreateObject( "java", "com.hazelcast.core.HazelcastInstance" );
    JetService = CreateObject( "java", "com.hazelcast.jet.JetService" );
    Util = CreateObject( "java", "com.hazelcast.jet.Util" );
    Pipeline = CreateObject( "java", "com.hazelcast.jet.pipeline.Pipeline" );
    Sinks = CreateObject( "java", "com.hazelcast.jet.pipeline.Sinks" );
    Sources = CreateObject( "java", "com.hazelcast.jet.pipeline.Sources" );
    // DeleteDbFiles = CreateObject( "java", "org.h2.tools.DeleteDbFiles" );
    
    Files = CreateObject( "java", "java.nio.file.Files" );
    Connection = CreateObject( "java", "java.sql.Connection" );
    DriverManager = CreateObject( "java", "java.sql.DriverManager" );
    PreparedStatement = CreateObject( "java", "java.sql.PreparedStatement" );
    SQLException = CreateObject( "java", "java.sql.SQLException" );
    Statement = CreateObject( "java", "java.sql.Statement" );


    MAP_NAME = "userMap";
    TABLE_NAME = "tCustomers";

    // private static Pipeline buildPipeline(String connectionUrl) {
    //     Pipeline p = Pipeline.create();

    //     p.readFrom(Sources.jdbc(connectionUrl,
    //             "SELECT * FROM " + TABLE_NAME,
    //             resultSet -> new User(resultSet.getInt(1), resultSet.getString(2))))
    //      .map(user -> Util.entry(user.getId(), user))
    //      .writeTo(Sinks.map(MAP_NAME));
    //     return p;
    // }

    any function buildPipeline( String connectionUrl )
    {
        var p = Pipeline.create();

         p.readFrom(Sources.jdbc( arguments.connectionUrl,
                     "SELECT * FROM " + TABLE_NAME,
                     resultSet -> new User(resultSet.getInt(1), resultSet.getString(2))))
          .map(user => Util.entry(user.getId(), user))
          .writeTo(Sinks.map(MAP_NAME));
        return p;
    }

    string function connectionUrl() 
    {
        // return "jdbc:h2:" & dbDirectory & "/" + JdbcSource.class.getSimpleName();
        return "jdbc:mysql://localhost:3306/vandelayindustries?characterEncoding=UTF-8&serverTimezone=America/Los_Angeles&maxReconnects=3";
    }    

</cfscript>