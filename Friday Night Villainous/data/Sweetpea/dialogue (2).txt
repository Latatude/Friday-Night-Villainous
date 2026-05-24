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
        startDialogue('dialogue2');
        postSong = false;
        return Function_Stop;
    end
    return Function_Continue;
end
