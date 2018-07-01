all: guessinggame.sh
	echo "# guessinggame #" > README.md
	echo "" >> README.md
	date >> README.md
	echo "" >> README.md
	wc -l guessinggame.sh | egrep -o "[[:digit:]]+" >> README.md