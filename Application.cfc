component{

    this.name = "hazelcast_demo";
    this.javaSettings = { loadPaths: [ expandPath( "./hazelcast/lib/hazelcast-5.0.2.jar" ), expandPath( "./hazelcast/lib/hazelcast-sql-5.0.2.jar" ) ] };

    public any function onRequestStart( string targetPath ) {
      setting enablecfoutputonly="true";
      return true;
    }
  
  }