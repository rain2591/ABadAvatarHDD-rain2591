-- Our main game list filter registration method
function RegisterGenreFilters()

	-- Create our global table
	local genreFilters = {}
	
	-- Add a filter method
	genreFilters["Other"] = FilterCategoryGenresOther
	genreFilters["Action & Adventure"] = FilterCategoryGenresActionAdventure
	genreFilters["Family"] = FilterCategoryGenresFamily
	genreFilters["Fighting"] = FilterCategoryGenresFighting
	genreFilters["Music"] = FilterCategoryGenresMusic
	genreFilters["Platformer"] = FilterCategoryGenresPlatformer
	genreFilters["Racing & Flying"] = FilterCategoryGenresRacingFlying
	genreFilters["Role Playing"] = FilterCategoryGenresRolePlaying
	genreFilters["Shooter"] = FilterCategoryGenresShooter
	genreFilters["Strategy & Simulation"] = FilterCategoryGenresStrategySimulation
	genreFilters["Sports & Recreation"] = FilterCategoryGenresSportsRecreation
	genreFilters["Card & Board"] = FilterCategoryGenresCardBoard
	genreFilters["Classics"] = FilterCategoryGenresClassics
	genreFilters["Puzzle & Trivia"] = FilterCategoryGenresPuzzleTrivia
	
	-- All done
	return genreFilters

end


function FilterCategoryGenresActionAdventure(Content)
   return bit32.btest( Content.Genre, ContentGenre.ActionAdventure )
end

function FilterCategoryGenresPlatformer(Content)
   return bit32.btest( Content.Genre, ContentGenre.Platformer )
end

function FilterCategoryGenresSportsRecreation(Content)
   return bit32.btest( Content.Genre, ContentGenre.SportsRecreation )
end

function FilterCategoryGenresShooter(Content)
   return bit32.btest( Content.Genre, ContentGenre.Shooter )
end

function FilterCategoryGenresFamily(Content)
   return bit32.btest( Content.Genre, ContentGenre.Family )
end

function FilterCategoryGenresFighting(Content) 
   return bit32.btest( Content.Genre, ContentGenre.Fighting )
end

function FilterCategoryGenresMusic(Content)
   return bit32.btest( Content.Genre, ContentGenre.Music )
end

function FilterCategoryGenresRacingFlying(Content)
   return bit32.btest( Content.Genre, ContentGenre.RacingFlying )
end

function FilterCategoryGenresStrategySimulation(Content)
   return bit32.btest( Content.Genre, ContentGenre.StrategySimulation )
end

function FilterCategoryGenresRolePlaying(Content)
   return bit32.btest( Content.Genre, ContentGenre.RolePlaying )
end

function FilterCategoryGenresCardBoard(Content)
   return bit32.btest( Content.Genre, ContentGenre.CardBoard )
end

function FilterCategoryGenresClassics(Content)
   return bit32.btest( Content.Genre, ContentGenre.Classics )
end

function FilterCategoryGenresPuzzleTrivia(Content)
   return bit32.btest( Content.Genre, ContentGenre.PuzzleTrivia )
end

function FilterCategoryGenresOther(Content)
   return bit32.btest( Content.Genre, ContentGenre.Other )
end