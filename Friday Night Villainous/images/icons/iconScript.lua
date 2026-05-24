function onCreate()
    -- Define the path to the icon grid image
    local iconGridPath = 'icons/icon-maid-505-xtra.png' -- Make sure this path is correct
    
    -- Define the icon dimensions
    local iconWidth = 150
    local iconHeight = 150
    
    -- Set up icon positions in the image (x position)
    local winningIconX = 0
    local normalIconX = 150
    local losingIconX = 300
    
    -- Create and assign the winning icon
    makeAnimatedLuaSprite('icon-winning', iconGridPath, winningIconX, 0)
    addAnimationByPrefix('icon-winning', 'winning', 'icon-winning', 24, true)
    setObjectCamera('icon-winning', 'hud')
    
    -- Create and assign the normal icon
    makeAnimatedLuaSprite('icon-normal', iconGridPath, normalIconX, 0)
    addAnimationByPrefix('icon-normal', 'normal', 'icon-normal', 24, true)
    setObjectCamera('icon-normal', 'hud')
    
    -- Create and assign the losing icon
    makeAnimatedLuaSprite('icon-losing', iconGridPath, losingIconX, 0)
    addAnimationByPrefix('icon-losing', 'losing', 'icon-losing', 24, true)
    setObjectCamera('icon-losing', 'hud')
    
    -- Add icons to the game
    addLuaSprite('icon-winning', true)
    addLuaSprite('icon-normal', true)
    addLuaSprite('icon-losing', true)
    
    -- Hide all icons initially
    setProperty('icon-winning.visible', false)
    setProperty('icon-normal.visible', false)
    setProperty('icon-losing.visible', false)
end

function onUpdate()
    -- Update icon visibility based on health bar values (example logic)
    if getProperty('health') > 1.5 then
        setProperty('icon-winning.visible', true)
        setProperty('icon-normal.visible', false)
        setProperty('icon-losing.visible', false)
    elseif getProperty('health') < 0.5 then
        setProperty('icon-winning.visible', false)
        setProperty('icon-normal.visible', false)
        setProperty('icon-losing.visible', true)
    else
        setProperty('icon-winning.visible', false)
        setProperty('icon-normal.visible', true)
        setProperty('icon-losing.visible', false)
    end
end
