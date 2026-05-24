preSong = true;
postSong = true;

function onStartCountdown()
    if preSong and isStoryMode and not seenCutscene then
        startDialogue('dialogue1');
        preSong = false;
        return Function_Stop;
    end
    return Function_Continue;
end

function onEndSong()
    if postSong and isStoryMode then
        setProperty('healthBar.visible', false);
        setProperty('iconP1.visible', false);
        setProperty('iconP2.alpha', 0);
        setProperty('scoreTxt.visible', false);
        setProperty('strumLineNotes.visible', false);
        startDialogue('dialogue2');
        postSong = false;
        return Function_Stop;
    end
    return Function_Continue;
end