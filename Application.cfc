component{

    this.name = "hazelcast_demo";

    // this.javaSettings = {
    //   loadPaths: directoryList(
    //     path = expandPath( "./hazelcast" ),
    //     recurse = true,
    //     type = 'file' )
    // };
  
    this.javaSettings = { loadPaths: expandPath( "./hazelcast/lib/hazelcast-5.0.2.jar" ) };

    public any function onRequestStart( string targetPath ) {
      setting enablecfoutputonly="true";
      return true;
    }
  
  }