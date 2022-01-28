component
{
    this.name = "hazelcast_sql_ingestion_demo";
    this.javaSettings = { loadPaths: [ expandPath( "/hazelcast/lib/hazelcast-5.0.2.jar" ), expandPath( "/hazelcast/lib/hazelcast-sql-5.0.2.jar" ) ] };

    this.datasources["vandelay-dsn"] = {
        class: 'com.mysql.cj.jdbc.Driver'
      , bundleName: 'com.mysql.cj'
      , bundleVersion: '8.0.19'
      , connectionString: 'jdbc:mysql://localhost:3306/vandelayindustries?characterEncoding=UTF-8&serverTimezone=America/Los_Angeles&maxReconnects=3'
      , username: 'root'
      , password: "encrypted:59d0546cc2b4ab28e501167f8f24c181991c7f4cf9d7a7fcf74eec7edf536acf40eb2915e6000ca6"
      
      // optional settings
      , connectionLimit:100 // default:-1
      , liveTimeout:60 // default: -1; unit: minutes
      , alwaysSetTimeout:true // default: false
      , validate:false // default: false
  };    

    public any function onApplicationStart()
    {
      // init the Hazelcast Instance
      var helloWorldConfig = createObject( "java", "com.hazelcast.config.Config" ).init();
      var hazelcast        = createObject( "java", "com.hazelcast.core.Hazelcast" );

      helloWorldConfig.setClusterName( "hello-world" );

      var jetConfig = helloWorldConfig.getJetConfig();
      jetConfig.setEnabled( true );
  
      application.hazelcast = Hazelcast.newHazelcastInstance( helloWorldConfig );

      return true;
    }

    public any function onRequestStart( string targetPath ) 
    {

      if( structKeyExists( url, "reinit" ) )
      {
        if( url.reinit = 1 )
        {
          onApplicationStart();
        }
      }

      setting enablecfoutputonly="true";
      return true;
    }
  
}
