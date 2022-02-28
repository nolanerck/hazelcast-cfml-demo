<cfset _movieMap = application.hz1.getMap( "movies" ) />

<cfoutput>
    <div>Movie 1: #_movieMap.get( "comedy" )#</div>
    <div>Movie 2: #_movieMap.get( "horror" )#</div>
    <div>Movie 3: #_movieMap.get( "musical" )#</div>
    <div>Movie 4: #_movieMap.get( "action" )#</div>
    <div>Movie 5: #_movieMap.get( "fantasy" )#</div>
</cfoutput>


