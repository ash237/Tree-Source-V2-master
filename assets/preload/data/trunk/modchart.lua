--yes i did use kade engine's modchart blah blah blah, my man until there isn't a proper tutorial i'm gonna use his and edit it >:(
local hudX = 0
local hudY = 0

local fourStartX = 0
local fiveStartX = 0
local sixStartX = 0
local sevenStartX = 0

local swaying = false
local move = false

local swayingForce = 0.5;
local waitForBeat = false
local waitForTween = false

function start(song) 
    hudX = getHuxX()
    hudY = getHudY()
end

local power = 0

local hudZoom = 0

local spinCrazy = false
local spin = false
local spinUpFast = false

local hit = false
local directionMulti = 1
local heightMulti = 1

local direction = 2

function resetTween()
	waitForTween = false
end

--SpINNN function update(elapsed)
--    local currentBeat = (songPos / 1000)*(bpm/60)
--    if curStep > 468 and curStep < 500 then
--        for i=4,7 do
--			setActorX(_G['defaultStrum'..i..'X'] + 32 * math.sin((currentBeat + i*0.25) * math.pi), i)
--        end
--        power = 0.01 * currentBeat
--        camHudAngle = camHudAngle + power
--    end
--end

    
--SpinLessyeaa    if curStep >= 596 and curStep < 651 then
--      camHudAngle = camHudAngle + 0.04
--    end

--SUPERSPINNINGBOI    if curStep >= 652 and curStep < 660 then
--        camHudAngle = camHudAngle + 25
--    end

    -- curStep >= 660 and curStep < 720
    -- curStep >= 789 and curStep < 847
    -- curStep >= 1556 and curStep < 1675
    -- curStep >= 1685 and curStep < 1794
    -- curStep >= 2324 and curStep < 2384
    -- curStep >= 2452 and curStep < 2512

    -- curStep >= 737 and curStep < 756
    -- curStep >= 770 and curStep < 784
    -- curStep >= 916 and curStep < 1168
    -- curStep >= 1300 and curStep < 1411
    -- curStep >= 1812 and curStep < 2052
    -- curStep >= 2402 and curStep < 2420
    -- curStep >= 2434 and curStep < 2452
    if spin then
        if getHudX() + 640 > 1280 and not hit then
            hit = not hit
            direction = 2 * directionMulti
        elseif hit then
            if getHudX() - 640 > -1280 and hit then
                direction = -2 * directionMulti
            else
                hit = not hit
                direction = 2 * directionMulti
            end
        end
        setHudPosition(getHudX() + direction, 32 * math.cos(currentBeat * math.pi) * heightMulti)
    end



-- camHudAngle = 32 * math.sin(currentBeat * math.pi)
-- if getHudX < 1920 then
--     setHudPosition(getHudX() + 40, 32 * math.cos(currentBeat * math.pi))
-- else
--     setHudPosition(0, 32 * math.cos(currentBeat * math.pi))
-- end

function beatHit(beat)
	waitForBeat = false
    if curStep >= 62 and beat % 1 == 0 and curStep < 318 then
        setHudZoom(0.7)
		setCamZoom(0.9)
        tweenHudZoom(0.7,0.2)
        tweenCamZoom(0.7,0.2)		
    end
end



function setDefault(id)
    _G['defaultStrum'..id..'X'] = getActorX(id)
end


function stepHit(step)
    if step == 1 then
        fourStartX = getActorX(4)
        fiveStartX = getActorX(5)
        sixStartX = getActorX(6)
        sevenStartX = getActorX(7)
    end
	
	if step >= 320 then
        swaying = true
		move = true
	end

	if step >= 447 then
        swaying = false
		move = false
	end

	if step >= 831 then
        swaying = true
		move = true
	end	

	if step >= 959 then
        swaying = false
		move = false
	end		
	
	if step == 464 then
		setCamZoom(1.2)
		cameraAngle = 10
		camHudAngle = 10
    end
	if step == 468 then
		setCamZoom(1.8)
		cameraAngle = 30
		camHudAngle = 30
    end
	if step == 472 then
		setCamZoom(2.3)
		cameraAngle = 50
		camHudAngle = 50
    end	
	if step == 476 then
		setCamZoom(1)
		cameraAngle = 0
		camHudAngle = 0
    end	
	
	if step == 528 then
		setCamZoom(1.2)
		cameraAngle = 10
		camHudAngle = 10
    end
	if step == 532 then
		setCamZoom(1.8)
		cameraAngle = 30
		camHudAngle = 30
    end
	if step == 536 then
		setCamZoom(2.3)
		cameraAngle = 50
		camHudAngle = 50
    end	
	if step == 540 then
		setCamZoom(1)
		cameraAngle = 0
		camHudAngle = 0
    end		
--LE ZOOM OUT
	if step == 576 then
		setCamZoom(0.6)
		setHudZoom(0.6)
    end	

	if step == 619 then
		setCamZoom(0.3)
		setHudZoom(0.3)
    end	
	if step == 639 then
		setCamZoom(1.0)
		setHudZoom(1.0)
    end		
--HelliZoomiOuti
	if step == 651 then
		setCamZoom(0.6)
		setHudZoom(0.6)
    end	

	if step == 670 then
		setCamZoom(0.3)
		setHudZoom(0.3)
    end	

	if step == 703 then
		setCamZoom(1.0)
		setHudZoom(1.0)
    end


	if step == 976 then
		setCamZoom(1.2)
		cameraAngle = 10
		camHudAngle = 10
    end
	if step == 980 then
		setCamZoom(1.8)
		cameraAngle = 30
		camHudAngle = 30
    end
	if step == 984 then
		setCamZoom(2.3)
		cameraAngle = 50
		camHudAngle = 50
    end	
	if step == 988 then
		setCamZoom(1)
		cameraAngle = 0
		camHudAngle = 0
    end		
	if step == 1040 then
		setCamZoom(1.2)
		cameraAngle = 10
		camHudAngle = 10
    end
	if step == 1044 then
		setCamZoom(1.8)
		cameraAngle = 30
		camHudAngle = 30
    end
	if step == 1048 then
		setCamZoom(2.3)
		cameraAngle = 50
		camHudAngle = 50
    end	
	if step == 1052 then
		setCamZoom(1)
		cameraAngle = 0
		camHudAngle = 0
    end
end




 function update (elapsed) 
	-- sway
    if spinCrazy then -- spinning crazy
        camHudAngle = 32 * math.sin(currentBeat * math.pi)
        if getHudX() < 320 then
            setHudPosition(getHudX() + 4, 32 * math.cos(currentBeat * math.pi))
        else
            setHudPosition(-640, 32 * math.cos(currentBeat * math.pi))
        end
    end
	
	if swaying and move then
		--print(currentBeat)
		local currentBeat = (swayingForce/1000)*(bpm/120)
		if curBeat % 4 == 0 and not waitForBeat and funnyEffect then
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

				tweenPosYAngle(0, getActorY(0) - 120 + 64 * math.sin(currentBeat * math.pi) ,360, 0.2, 'resetTween')
				tweenPosYAngle(1, getActorY(1) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosYAngle(2, getActorY(2) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosYAngle(3, getActorY(3) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
	
				tweenPosYAngle(4, getActorY(4) - 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosYAngle(5, getActorY(5) - 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosYAngle(6, getActorY(6) + 60 + 64 * math.sin(currentBeat * math.pi),360, 0.2)
				tweenPosYAngle(7, getActorY(7) + 120 + 64 * math.sin(currentBeat * math.pi),360, 0.2)

				_G['defaultStrum0Y'] = getActorY(0) - 120
				_G['defaultStrum1Y'] = getActorY(1) - 60
				_G['defaultStrum2Y'] = getActorY(2) + 60
				_G['defaultStrum3Y'] = getActorY(3) + 120

				_G['defaultStrum4Y'] = getActorY(4) - 120
				_G['defaultStrum5Y'] = getActorY(5) - 60
				_G['defaultStrum6Y'] = getActorY(6) + 60
				_G['defaultStrum7Y'] = getActorY(7) + 120		

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
				
				tweenPosYAngle(0, getActorY(0) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2, 'resetTween')
				tweenPosYAngle(1, getActorY(1) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosYAngle(2, getActorY(2) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosYAngle(3, getActorY(3) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
	
				tweenPosYAngle(4, getActorY(4) + 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosYAngle(5, getActorY(5) + 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosYAngle(6, getActorY(6) - 60 + 64 * math.sin(currentBeat * math.pi),0, 0.2)
				tweenPosYAngle(7, getActorY(7) - 120 + 64 * math.sin(currentBeat * math.pi),0, 0.2)

				_G['defaultStrum0Y'] = getActorY(0) + 120
				_G['defaultStrum1Y'] = getActorY(1) + 60
				_G['defaultStrum2Y'] = getActorY(2) - 60
				_G['defaultStrum3Y'] = getActorY(3) - 120

				_G['defaultStrum4Y'] = getActorY(4) + 120
				_G['defaultStrum5Y'] = getActorY(5) + 60
				_G['defaultStrum6Y'] = getActorY(6) - 60
				_G['defaultStrum7Y'] = getActorY(7) - 120				
			end
		elseif not waitForTween then
			swayingForce = swayingForce + 4;
			for i = 0, 7  do
				setActorX(_G['defaultStrum'..i..'X'] + 64 * math.sin(currentBeat * math.pi),i)
			end
		end
	end
end

--function playerOneSing(noteData, pos)
--    local data = math.abs(noteData)
--    if curStep >= 960 and curStep < 1024 then
--        if data == 0 then
--           setHudPosition(hudX - 100,hudY)
--       elseif data == 1 then
--            setHudPosition(hudX,hudY + 100)
--        elseif data == 2 then
--            setHudPosition(hudX,hudY + 100)
--        elseif data == 3 then
--            setHudPosition(hudX + 100,hudY)
--        end
--    end
--end