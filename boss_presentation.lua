char_x = 50
char_y = 50
move = 1
start_char = 12
char = start_char
food_x = 25
food_y = 25
food = 0
message = "score "
score = 0
win_color= 0
total = message .. score
gamemode = 0
new_status = ""


function new_food()
    food = rnd(17) + 16
    food = flr(food)
    food_x = rnd(100) + 10
    food_y = rnd(100) + 10
    movefood = time()
end


function increase_score(x)
	score = score + x
 	total = message .. score
end

function status(current_food)
    if (current_food == 19) then
        increase_score(100)
        move = .3
        new_status = "slow"
    elseif (current_food == 29) then
        increase_score(50)
        move = 3
        new_status = "rocket power"
    elseif (current_food == 32) then
        increase_score(30)
        char = 6
        start_char = 55
        new_status = "cowabunga dude"
    else
        move = 1
        new_status = ""
    end
end

function _init()
    last = time()
    new_food()
end

function _update()
	if (char_x > food_x - 5 and char_x <= food_x + 5) and (char_y >= food_y - 5 and char_y <= food_y + 5) then
        status(food)
        new_food()
        increase_score(10)
	end
	if (time() - movefood) > 1.5 then
        new_food()
	end
	if (btn(0)) then
        char_x = char_x - move
        char = start_char
	end
	if (btn(1)) then
        char_x = char_x + move
        char = start_char + 1
	end
	if (btn(2)) then
        char_y = char_y - move
        char = start_char
	end
	if (btn(3)) then
        char_y = char_y + move
        char = start_char + 1
	end
    win_color = win_color + 1
end

function _draw()
    if gamemode == 0 then
        if (char_x > 110) then
			char_x = 10
		elseif (char_x < 10) then
			char_x = 110
		end
		if win_color > 15 then
	 		win_color = 0
	 	end
		if (char_y > 110) then
			char_y = 10
		elseif (char_y < 10) then
            char_y = 110
		end
			cls()
			if (time() - last) > 20 then
				gamemode = 1
			end
			print(total, 1, 1, win_color)
			spr(food, food_x, food_y)
			spr(char, char_x, char_y)
			print(new_status, 70, 110)
	else
	  cls()
	  print("game over! total score: " .. score, 10, 40, win_color)
	end
end