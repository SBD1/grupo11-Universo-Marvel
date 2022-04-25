e=$(pip list | grep pyfiglet)
r='pyfiglet'

if [[ "$e" != *"$r"* ]]; then
	pip install pyfiglet
fi

python3 Main.py
