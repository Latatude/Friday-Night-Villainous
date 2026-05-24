-- Define the default key
local dodgeKey = 'space' -- Default key (spacebar)
local dodgeSuccessful = false -- To track whether the player dodged in time
local inDodgeWindow = false -- To check if the dodge window is active

-- Custom event for dodge mechanic
function onEvent(name, value1)
    if name == 'demScratch' then
        local dodgeWindow = tonumber(value1) or 0.5 -- Dodge window (in seconds)
        dodgeSuccessful = false -- Reset dodge success status
        inDodgeWindow = true -- Set dodge window active

        -- Play pre-scratch animation as a warning
        characterPlayAnim('gf', 'preScratch', true) 
        runTimer('preScratchLoop', 0.1, dodgeWindow * 10) -- Loop pre-scratch animation

        -- Set a timer to end the dodge window
        runTimer('endDodgeWindow', dodgeWindow)
    end
end

-- Player hits the dodge key
function onUpdate()
    if inDodgeWindow and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.' .. dodgeKey:upper()) then
        dodgeSuccessful = true -- Mark dodge as successful
        inDodgeWindow = false -- Disable further attempts

        -- Immediately play GF’s scratch animation
        characterPlayAnim('gf', 'scratch', true) 
        runTimer('playDodgeAnim', 0.1) -- Schedule BF's dodge animation to play after a slight delay
    end
end

-- Handle timer completions
function onTimerCompleted(tag)
    if tag == 'endDodgeWindow' then
        inDodgeWindow = false -- Disable dodge window once time is up

        -- If no successful dodge, play GF’s scratch animation
        if not dodgeSuccessful then
            characterPlayAnim('gf', 'scratch', true) -- Play scratch animation
            runTimer('playHurt', 0.1) -- Schedule health drain and hurt animation after 0.1 seconds
        end
    elseif tag == 'preScratchLoop' and inDodgeWindow then
        -- Continuously play GF's pre-scratch animation if we're still in the dodge window
        characterPlayAnim('gf', 'preScratch', true)
    elseif tag == 'playDodgeAnim' and dodgeSuccessful then
        -- Play BF's dodge animation after the same delay as the miss sequence
        triggerEvent("Play Animation", "dodge", "bf")
        characterPlayAnim('boyfriend', 'dodge', true)
    elseif tag == 'playHurt' then
        -- Drain health and play BF’s hurt animation simultaneously
        setProperty('health', getProperty('health') - 0.25) -- Drain health
        triggerEvent("Play Animation", "hurt", "bf") -- Play hurt animation
    end
end
