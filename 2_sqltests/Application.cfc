component
{
    this.name = "hazelcast_sql_demo";
    this.javaSettings = { loadPaths: [ expandPath( "../hazelcast/lib/hazelcast-5.0.2.jar" ), expandPath( "../hazelcast/lib/hazelcast-sql-5.0.2.jar" ) ] };

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
