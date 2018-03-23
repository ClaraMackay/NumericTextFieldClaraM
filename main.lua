-- Title: NumericTextFields
-- Name: Your Name
-- Course: ICS2O/3C
-- This program displays a math question and asks the
-- user to answer in a numeric textfield. 
----------------------------------------------------------------------
-- displays a question ands sets the colour 
questionObject = display.newText("", display.contentWidth/4, display.contentHeight/2, "Georgia", 80)
questionObject:setTextColor(255/255, 255/255, 255/255)

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 16/255, 35/255, 104/255)

-----------------------------------------------------------------
--LOCAL VARIABLES
-----------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local numericField 
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-- create more local variables
local incorrectObject
local pointsObject
local points = 0
local formula
-----------------------------------------------------------------
--LOCAL FUNCTIONS
-----------------------------------------------------------------
local function AskQuestion()
end
	-- generate 2 random nuymbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)

	-- randomizes formulas from addition to multiplication to subtraction

	formula = math.random(0, 2)

if (fomula == 0) then

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object
	questionObject.text = randomNumber1 .. "+" .. randomNumber2 .. "="

	elseif (formula == 1) then

		-- calculates the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- creates question in text object 
		questionObject.text = randomNumber1 .. " x " .. randomNumber2 .. "="

			elseif (formula == 1) then

		-- calculates the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- creates question in text object 
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. "="

end


local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

function NumericFieldListener( event )
	-- User begins editing "numericField"
	if (event.phase == "began") then

		--clear text field
		event.target.text = ""

		elseif event.phase == "submitted" then

			-- when the answer is submitted (enter key is pressed) set user input to user's answer
			userAnswer = tonumber(event.target.text)

			-- if the users answer and the correct answer are the same:
			if (userAnswer == correctAnswer) then
				correctObject.isVisible = true

				--keeps track of the points 
				points = points + 1 
				pointsObject.text = "points = " .. points

				-- call the HideCorrect function after 4 seconds
				timer.performWithDelay(4000, HideCorrect)
			else 
				incorrectObject.isVisible = true 

				timer.performWithDelay(4000, HideCorrect)

			end
		end
end



--------------------------------------------------------------------------------
--OBJECT CREATION
--------------------------------------------------------------------------------

-- displays a question ands sets the colour 
questionObject = display.newText("", display.contentWidth/4, display.contentHeight/2, "Georgia", 80)
questionObject:setTextColor(255/255, 255/255, 255/255)

-- create the correct text object and make it invisible 
correctObject = display.newText("Correct!", display.contentWidth/2, display.contentHeight*2/3, "Georgia", 80)
correctObject:setTextColor(255/255, 255/255, 255/255)
correctObject.isVisible = false

-- create the correct text object and make it invisible 
incorrectObject = display.newText("Incorrect.", display.contentWidth/2, display.contentHeight*2/3, "Georgia", 80)
incorrectObject:setTextColor(255/255, 255/255, 255/255)
incorrectObject.isVisible = false

-- displays numeber of points 
pointsObject:setTextColor("points = 0.", display.contentWidth/2, display.contentHeight*2/3, "Georgia", 80)

-- create numeric field
numericField = native.newTextField(display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

-------------------------------------------------------------------------------
--FUNCTION CALLS
-------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()