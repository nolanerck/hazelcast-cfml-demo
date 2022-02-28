<cfset _map = application.hz1.getMap( "my-map" ) />

<cfoutput>
    <h2>The Beatles: </h2>
    <div>#_map.get( "1" )#</div>
    <div>#_map.get( "2" )#</div>
    <div>#_map.get( "3" )#</div>
    <div>#_map.get( "4" )#</div>
</cfoutput>

<cfset _movieMap = application.hz1.getMap( "movies" ) />

<cfoutput>
    <h2>Some Fun Movies: </h2>
    <div>#_movieMap.get( "comedy" )#</div>
    <div>#_movieMap.get( "horror" )#</div>
    <div>#_movieMap.get( "musical" )#</div>
    <div>#_movieMap.get( "action" )#</div>
    <div>#_movieMap.get( "fantasy" )#</div>
</cfoutput>
