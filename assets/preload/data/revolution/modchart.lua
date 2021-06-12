local poggers = false
local swaying = false
local move = false
local funnyEffect = false

local swayingForce = 3;
local waitForBeat = false
local waitForTween = false


local white = nil

function start (song)

	white = makeSprite('White','white', false)

	setActorX(0,'white')

	setActorY(170,'white')

	setActorAlpha(0,'white')

	setActorScale(1.6,'white')
end

function setDefault(id)
	move = true
	swayingForce = 0
	_G['defaultStrum'..id..'X'] = getActorX(id)
	_G['defaultStrum'..id..'Y'] = getActorY(id)
	_G['defaultStrum'..id..'Z'] = getActorAngle(id)	
	print('angle 0')
	setActorAngle(0,id)
end


function unpop()
	tweenFadeOut(white,0,0.15)
end

function pop()
	tweenFadeIn(white,1,0.25,'unpop')
end

function fadeOutAndGo() 
    for i=0,3 do
		tweenFadeIn(i,0,0.6)
    end
end

function fadeInAndGo()
	move = false
    for i=0,3 do
		tweenFadeIn(i,1,0.6)
    end
end

function resetTween()
	waitForTween = false
end

 function update (elapsed) 
 
   if curStep > 1 and curStep < 50 then
			for i=4,7 do
				setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
			end
			power = 0.01 * currentBeat
			camHudAngle = camHudAngle + power
	end	
	
  if curStep > 511 and curStep < 800 then
		funnyEffect = true
		move = true
		swaying = true
		separate = true
	end	
  if curStep == 800 then
		funnyEffect = false
		move = false
		swaying = false
		separate = false
	end			
  if curStep == 960 then
        cameraAngle = 0
		camHudAngle = 0
	end		
  if curStep == 1024 then
		showOnlyStrums = true
		move = true
		swaying = true
	end	
  if curStep == 1014 or curStep == 1664 then
		pop()
	end		
	
  if curStep == 1408 then
		showOnlyStrums = true
		move = false
		swaying = false
	end	
  if curStep == 1918 then
		fadeOutAndGo()
		swaying = true
		move = true
		separate = true
	end
  if curStep == 2176 then
		showOnlyStrums = false
		fadeInAndGo()
	end	
	-- 1014

    if spinCrazy then -- spinning crazy
        camHudAngle = 32 * math.sin(currentBeat * math.pi)
        if getHudX() < 320 then
            setHudPosition(getHudX() + 4, 32 * math.cos(currentBeat * math.pi))
        else
            setHudPosition(-640, 32 * math.cos(currentBeat * math.pi))
        end
    end
	
	if swaying and move and not separate then
	
		--print(currentBeat)
		local currentBeat = (swayingForce/1000)*(bpm/85)
		if curBeat % 0.3 == 0 and not waitForBeat and funnyEffect then
			waitForBeat = true
			waitForTween = true
			poggers = not poggers
			if poggers then
				tweenPosXAngle(0, getActorX(0) - 120 + 64 * math.sin(currentBeat * math.pi) ,360, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(2, getActorX(2) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(3, getActorX(3) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
	
				tweenPosXAngle(4, getActorX(4) - 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(5, getActorX(5) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(6, getActorX(6) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(7, getActorX(7) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)

				_G['defaultStrum0X'] = getActorX(0) - 120
				_G['defaultStrum1X'] = getActorX(1) - 60
				_G['defaultStrum2X'] = getActorX(2) + 60
				_G['defaultStrum3X'] = getActorX(3) + 120

				_G['defaultStrum4X'] = getActorX(4) - 120
				_G['defaultStrum5X'] = getActorX(5) - 60
				_G['defaultStrum6X'] = getActorX(6) + 60
				_G['defaultStrum7X'] = getActorX(7) + 120

	

			else
				tweenPosXAngle(0, getActorX(0) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(2, getActorX(2) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(3, getActorX(3) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
	
				tweenPosXAngle(4, getActorX(4) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(5, getActorX(5) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(6, getActorX(6) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(7, getActorX(7) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)

				_G['defaultStrum0X'] = getActorX(0) + 120
				_G['defaultStrum1X'] = getActorX(1) + 60
				_G['defaultStrum2X'] = getActorX(2) - 60
				_G['defaultStrum3X'] = getActorX(3) - 120

				_G['defaultStrum4X'] = getActorX(4) + 120
				_G['defaultStrum5X'] = getActorX(5) + 60
				_G['defaultStrum6X'] = getActorX(6) - 60
				_G['defaultStrum7X'] = getActorX(7) - 120
				
		
			end
		elseif not waitForTween then
			swayingForce = swayingForce + 6;
			for i = 0, 7  do
				setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin(currentBeat * math.pi),i)
			end
		end
	end
	
	if swaying and move and separate then
	
		--print(currentBeat)
		local currentBeat = (swayingForce/1000)*(bpm/85)
		if curBeat % 2 == 0 and not waitForBeat and funnyEffect then
			waitForBeat = true
			waitForTween = true
			poggers = not poggers
			if poggers then
				tweenPosXAngle(0, getActorX(0) - 120 + 64 * math.sin(currentBeat * math.pi) ,360, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(2, getActorX(2) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(3, getActorX(3) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
	
				tweenPosXAngle(4, getActorX(4) - 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(5, getActorX(5) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(6, getActorX(6) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosXAngle(7, getActorX(7) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)

				_G['defaultStrum0X'] = getActorX(0) - 120
				_G['defaultStrum1X'] = getActorX(1) - 60
				_G['defaultStrum2X'] = getActorX(2) + 60
				_G['defaultStrum3X'] = getActorX(3) + 120

				_G['defaultStrum4X'] = getActorX(4) - 120
				_G['defaultStrum5X'] = getActorX(5) - 60
				_G['defaultStrum6X'] = getActorX(6) + 60
				_G['defaultStrum7X'] = getActorX(7) + 120

	

			else
				tweenPosXAngle(0, getActorX(0) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2, 'resetTween')
				tweenPosXAngle(1, getActorX(1) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(2, getActorX(2) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(3, getActorX(3) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
	
				tweenPosXAngle(4, getActorX(4) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(5, getActorX(5) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(6, getActorX(6) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosXAngle(7, getActorX(7) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)

				_G['defaultStrum0X'] = getActorX(0) + 120
				_G['defaultStrum1X'] = getActorX(1) + 60
				_G['defaultStrum2X'] = getActorX(2) - 60
				_G['defaultStrum3X'] = getActorX(3) - 120

				_G['defaultStrum4X'] = getActorX(4) + 120
				_G['defaultStrum5X'] = getActorX(5) + 60
				_G['defaultStrum6X'] = getActorX(6) - 60
				_G['defaultStrum7X'] = getActorX(7) - 120
		
				
		
			end
		elseif not waitForTween and not funnyEffect then
			swayingForce = swayingForce + 4;
			for i = 4, 7  do
				setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin(currentBeat * math.pi),i)
				setActorY(_G['defaultStrum'..i..'Y'] + 32 * math.sin(currentBeat * math.pi),i)				
				camHudAngle = 12 * math.sin(currentBeat * math.pi)
			end
		end
	end
	
end

function beatHit(beat)
	waitForBeat = false

--    if curStep >= 0 and beat % 2 == 0 and curStep < 128 then
--        setHudZoom(0.7)
--		setCamZoom(0.9)
--        tweenHudZoom(0.7,0.2)
--        tweenCamZoom(0.7,0.2)		
--    end	

    if curStep >= 256 and beat % 0.2 == 0 and curStep < 511 then
        setHudZoom(0.8)
        setCamZoom(0.8)		
        tweenHudZoom(0.8,0.1)	
        tweenCamZoom(0.8,0.1)			
    end
	
    if curStep >= 1408 and beat % 0.2 == 0 and curStep < 1536 then
        setHudZoom(0.8)
        setCamZoom(0.8)		
        tweenHudZoom(0.8,0.1)	
        tweenCamZoom(0.8,0.1)			
    end
	
    if curStep >= 1667 and beat % 1 == 0 and curStep < 1918 then
        setCamZoom(0.8)		
        tweenCamZoom(0.8,0.1)			
    end	
end

	
function playerOneSing(noteData, pos)
    local data = math.abs(noteData)
    if curStep >= 768 and curStep < 960 then
        if data == 0 then
           	cameraAngle = 10
			camHudAngle = 10
       elseif data == 1 then
           	cameraAngle = 0
			camHudAngle = 0
        elseif data == 2 then
           	cameraAngle = -10
			camHudAngle = -10
        elseif data == 3 then
           	cameraAngle = 0
			camHudAngle = 0
        end
    end
end
print("mod chart here gaming\n")