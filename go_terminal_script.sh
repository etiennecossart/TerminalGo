wanna_play() #test
{
	echo "Type a response...(y/n)"
	echo ""
	read player_wanna_play
	check_if_wanna_play
}

check_if_wanna_play()
{
	if [[ ${player_wanna_play} == "y" ]]; then
		echo "Great!"
		board_size
	elif [[ ${player_wanna_play} == "n" ]]; then
		echo "Okay..... bye then"
		exit 0
	else
		echo "Hmm didn't get that, Try again!"
			wanna_play
	fi
}

board_size()
{
	echo "How big of a board do you want to play with? (Type a number: 10-19)"
	read board_size_input
	board_size_check

}

board_size_check()
{
	if [ ${board_size_input} -ge 10 ] &&  [ ${board_size_input} -le 19 ]; then
		echo "Board Size: ${board_size_input}"

		print_board ${board_size_input}
	else
		echo "Hmm didn't get that, Try again!"
		board_size
	fi
}

print_board()
{
	col_letters=("A", "B","C", "D", "E", "F", "G","H","I","J","K","L","M","N","O","R","S","T")
	size=$@
	echo "Drawing ${size}x${size} board now..."
	printf "   "
	for ((i = 0; i <= ${size}; i++));
	do
		col=${col_letters[$i]}
		printf '%s\n' " ${col} "
	done
	echo ""
	for ((i = 1; i <= ${size}; i++));
	do
		printf "==="
	done
	echo ""
	for ((i = 1; i <= ${size}; i++));
	do
		printf "||"
		for ((j = 1; j <= ${size}; j++));
		do
			 printf " # "
		done
		printf " || ${i}"
		echo ""
	done
	echo ""
	for ((i = 1; i <= ${size}; i++));
	do
		printf "==="
	done
	echo ""
}


echo "Hi there, wanna play Go? "
echo ""
wanna_play