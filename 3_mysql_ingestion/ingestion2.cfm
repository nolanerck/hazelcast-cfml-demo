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


    MAP_NAME   = "userMap";
    TABLE_NAME = "tCustomers";

    // funct = createobject( "java", "com.hazelcast.function.FunctionEx" );
    // dump( funct );

    // abort;
    // funct.compose(  );

    // dump( funct );
    // abort;



    // private static Pipeline buildPipeline(String connectionUrl) {
    //     Pipeline p = Pipeline.create();

    //     p.readFrom(Sources.jdbc(connectionUrl,
    //             "SELECT * FROM " + TABLE_NAME,
    //             resultSet -> new User(resultSet.getInt(1), resultSet.getString(2))))
    //      .map(user -> Util.entry(user.getId(), user))
    //      .writeTo(Sinks.map(MAP_NAME));
    //     return p;
    // }

    buildPipeline( connectionUrl() );


    doresults = (resultSet) => "Hello, #resultSet#.";

    any function buildPipeline( String connectionUrl )
    {
       dump( Sources );
       // abort;

        var p = Pipeline.create();

        dump( p );
        // abort;


        // var rslt = Sources.jdbc( arguments.connectionUrl, "SELECT * FROM #TABLE_NAME#", nullValue() );

        // var rslt = Sources.jdbc( arguments.connectionUrl, "SELECT * FROM #TABLE_NAME#", (resultSet) => "Hello, #resultSet#." );
        var rslt = queryExecute( "SELECT * FROM #TABLE_NAME#" );

dump( rslt );

        dump( rslt.toJson() );

        var jsonrslt = Sources.json( rslt.toJson() );

        dump( jsonrslt.toString() );

        abort;



        //  var rslt = p.readFrom( Sources.jdbc( arguments.connectionUrl,
        //              "SELECT * FROM " + TABLE_NAME ) );

        dump( rslt );
        abort;
                     // resultSet => new User(resultSet.getInt(1), resultSet.getString(2))));
        //   .map(user => Util.entry(user.getId(), user))
        //   .writeTo(Sinks.map(MAP_NAME));
        return p;
    }

    string function connectionUrl() 
    {
        // return "jdbc:h2:" & dbDirectory & "/" + JdbcSource.class.getSimpleName();
        return "jdbc:mysql://localhost:3306/vandelayindustries?characterEncoding=UTF-8&serverTimezone=America/Los_Angeles&maxReconnects=3";
    }    

</cfscript>