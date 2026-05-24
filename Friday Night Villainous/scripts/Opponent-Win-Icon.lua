function onCreatePost()
	makeLuaSprite('winningIconP', 'icons/win-'..getProperty('dad.curCharacter'), getProperty('iconP2.x'), getProperty('iconP2.y'))
	setObjectCamera('winningIconP', 'hud')
	addLuaSprite('winningIconP', true)
	setObjectOrder('winningIconP', getObjectOrder('iconP2') + 1)
	setProperty('winningIconP.flipX', false)
	setProperty('winningIconP.visible', false)
end

function onUpdatePost(elapsed)
			setProperty('winningIconP.x', getProperty('iconP2.x'))
			setProperty('winningIconP.angle', getProperty('iconP2.angle'))
			setProperty('winningIconP.y', getProperty('iconP2.y'))
			setProperty('winningIconP.scale.x', getProperty('iconP2.scale.x'))
			setProperty('winningIconP.scale.y', getProperty('iconP2.scale.y'))
			
			if getProperty('health') <= 0.375 then
				setProperty('iconP2.visible', false)
				setProperty('winningIconP.visible', true)
			else
				setProperty('iconP2.visible', true)
				setProperty('winningIconP.visible', false)
			end
end