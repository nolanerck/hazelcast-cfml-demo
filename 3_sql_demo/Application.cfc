component
{
    this.name = "hazelcast_sql_demo";
    this.javaSettings = { loadPaths: [ expandPath( "/hazelcast/lib/hazelcast-5.0.2.jar" ), 
                                       expandPath( "/hazelcast/lib/hazelcast-sql-5.0.2.jar" ) ] };

    public any function onRequestStart( string targetPath ) {
      setting enablecfoutputonly="true";
      return true;
    }
  
    public any function onApplicationStart()
    {
      var config    = createObject( "java", "com.hazelcast.config.Config" ).init();
      var hazelcast = createObject( "java", "com.hazelcast.core.Hazelcast" );

      var jetConfig = config.getJetConfig();
      jetConfig.setEnabled( true );
  
      application.hz1 = hazelcast.newHazelcastInstance( config );

      return true;
    }
}
