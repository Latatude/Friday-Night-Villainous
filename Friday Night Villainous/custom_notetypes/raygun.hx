import openfl.media.Sound;

var pew:Sound = Paths.sound("pew");

function doSequence(note:Note)
{
	if (note.isSustainNote || note.noteType != "raygun")
		return;

	FlxG.sound.play(pew);

	if (note.wasGoodHit)
	{
		game.boyfriend.playAnim("dodge", true);
		game.boyfriend.specialAnim = true;
	}

	game.dad.playAnim("shoot", true);
	game.dad.specialAnim = true;
}

for (note in game.unspawnNotes)
{
	if (note.noteType == "raygun")
	{
		note.rgbShader.enabled = false;
		note.texture = "mechanics/raygun";

		note.missHealth = 0.2;
	}
}

function goodNoteHit(note:Note)
	doSequence(note);

function noteMiss(note:Note)
{
	if (note.noteType != "raygun")
		return;

	doSequence(note);
	game.boyfriend.playAnim("hurt", true);
	game.boyfriend.specialAnim = true;
}