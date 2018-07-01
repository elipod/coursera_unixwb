# checking input string
function fcheck {

  if [[ -n $(echo $1 | egrep -o "[^[:digit:]]") ]]
  then
    echo 1
  else
    echo 0
  fi

}


# counting files in the directory
l_num=$(ls -1ap | egrep -v "/$" | wc -l | egrep -o "[[:digit:]]+")

echo "Greetings!"
echo "Tell me, how many files are in the currecnt directory?"
echo -n "Your guess: "

read l_input
l_chk=$(fcheck $l_input)

while [[ $l_chk -eq 1 ]] || [[ $l_input -ne $l_num ]]
do

  if [[ $l_chk -eq 1 ]]
  then
    echo -n "Please enter a valid number: "
  elif [[ $l_input -lt $l_num ]]
  then
    echo -n "Your number is too low. Let's try again: "
  else
    echo -n "Your number is too high. Let's try again: "
  fi

  read l_input
  l_chk=$(fcheck $l_input)

done

echo -n "Congratulations! The folder contains $l_num file"
if [[ $l_num -eq 1 ]]; then
  echo "!"
else
  echo "s!"
fi