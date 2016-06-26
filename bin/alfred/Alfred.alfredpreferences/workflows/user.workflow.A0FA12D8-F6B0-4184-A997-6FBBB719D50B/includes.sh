#includes for TimeZones scripts

#Working Directories
TZWD="$HOME/Library/Caches/com.runningwithcrayons.Alfred-2/Workflow Data/carlosnz.timezones"
TZPREFS="$HOME/Library/Application Support/Alfred 2/Workflow Data/carlosnz.timezones"

#Enable aliases for this script
shopt -s expand_aliases

#Case-insensitive matching
shopt -s nocasematch

#define aliases
alias growlnotify='/usr/local/bin/growlnotify TimeZones --image icon.png -m '

#First run check
if [ ! -e "$TZPREFS/config-1-5" ]; then
	old_timezone_file=$(cat "$TZPREFS/config")
	mv -f "$old_timezone_file" "$HOME/Desktop/timezones_OLD.txt"
	if [ -e "$HOME/Desktop/timezones_OLD.txt" ]; then
		growlnotify "Welcome to TimeZones v1.6."$'\n'"Your old timezones.txt file has been moved to the Desktop." -s
	fi
	mkdir "$TZPREFS"
	cp default_timezones.txt "$TZPREFS/timezones.txt"
	rm "$TZPREFS"/config*
	echo "$TZPREFS/timezones.txt" > "$TZPREFS/config-1-5"
fi

#Load path to the user's timezones.txt file.
timezone_file=$(cat "$TZPREFS/config-1-5")

#Does the file actually exist?
if [ ! -e "$timezone_file" ]; then
	#If not, recreate it from defaults
	cp default_timezones.txt "$TZPREFS/timezones.txt"
	echo "$TZPREFS/timezones.txt" > "$TZPREFS/config-1-5"
	timezone_file=$(cat "$TZPREFS/config-1-5")
fi