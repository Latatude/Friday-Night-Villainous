import flixel.sound.FlxSound;

var zap:FlxSound = FlxG.sound.load(Paths.sound("zap"));
var shot:FlxSound = FlxG.sound.load(Paths.sound("shot"));

function doSequence(note:Note)
{
	if (note.isSustainNote)
		return;
	
	var animToPlay:String = "dodge";

	if (note.wasGoodHit)
	{
		animToPlay = "hurt";
		game.totalNotesHit -= note.ratingMod;
		zap.play(true);

		game.boyfriend.stunned = true;
		game.boyfriend.playAnim("hurt", true); // Play hurt animation
		game.boyfriend.specialAnim = true;

		new FlxTimer().start(Conductor.crochet / 250, (_) -> {
			game.boyfriend.stunned = false;
		});
	}

	game.songScore += 10;
	game.songMisses -= 1;
	game.totalPlayed -= 1;
	game.RecalculateRating(false);

	game.dad.playAnim("shoot", true);
	game.dad.specialAnim = true;

	if (!game.boyfriend.stunned)
	{
		game.boyfriend.playAnim(animToPlay, true);
		game.boyfriend.specialAnim = true;
	}	

	shot.play(true);
}

function noteMiss(note:Note)
{
	if (note.noteType == "stun")
		doSequence(note);
}

for (note in game.unspawnNotes)
{
	if (note.noteType == "stun")
	{
		if (note.rgbShader != null) {
			note.rgbShader.enabled = false;
		}

		note.texture = "mechanics/stun";
		note.noteSplashData.texture = "mechanics/stunSplash";

		note.animation.curAnim.looped = true;

		note.offset.set(note.offset.x * 2, note.offset.y * 2);

		note.hitCausesMiss = true;
		note.ratingDisabled = true;
		note.missHealth = 0;
	}
}