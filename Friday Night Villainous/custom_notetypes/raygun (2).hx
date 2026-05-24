import openfl.media.Sound;

var pew:Sound = Paths.sound("pew");

function doSequence(note:Note)
{
	FlxG.sound.play(pew);
	game.dad.playAnim("shoot", true);
	game.dad.specialAnim = true;

	if (note.wasGoodHit)
	{
		game.health -= 0.22;
		return;
	}

	game.boyfriend.playAnim("dodge", true);
	game.boyfriend.specialAnim = true;

	game.songScore += 10;
	game.songMisses--;
	game.totalPlayed--;
	
	game.RecalculateRating(true);
}

for (note in game.unspawnNotes)
{
	if (note.noteType == "raygun")
	{
		note.rgbShader.enabled = false;
		note.texture = "mechanics/raygun";

		note.lowPriority = true;
		note.hitCausesMiss = true;
		note.missHealth = 0;
	}
}

function noteMiss(note:Note)
	if (!note.isSustainNote && note.noteType == "raygun")
		doSequence(note);