component{

    this.name = "hazelcast_demo_1";
    this.javaSettings = { loadPaths: [ expandPath( "/hazelcast/lib/hazelcast-5.0.2.jar" ) ] };

    public any function onRequestStart( string targetPath ) {
      setting enablecfoutputonly="true";
      return true;
    }
  
  }