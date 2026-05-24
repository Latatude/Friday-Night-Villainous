import openfl.media.Sound;

var pew:Sound = Paths.sound("pew");

function onEvent(eventName:String, value1:String, value2:String)
{
    if (eventName != "raygun")
        return;

    FlxG.sound.play(pew);

    game.boyfriend.playAnim("dodge", true);
    game.boyfriend.specialAnim = true;

    game.dad.playAnim("shoot", true);
    game.dad.specialAnim = true;
}