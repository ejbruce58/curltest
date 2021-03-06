# curltest
Shell scripts and associated for cURL-based trip timing for remote image scoring.
Prerequisites

•	A contemporary, up-to-date Linux client system on RHEL (7.6+) or Ubuntu (18.04+) and with bash shell available.
•	A non-admin user account with a “home” directory for storage of shell scripts, input files and results.
•	ssh-based command line access.
•	If graphical output is desired, the freely-available gnuplot package.
•	If high-fidelity graphical output using an Xterm is needed, then access to an X Window desktop either directly or through VNC.

Tooling and Artifacts

•	postimage-proc.sh: bash shell script to output two fields, the relative launch time and that elapsed between cURL’s time of initial connect and the first bytes of returned data. (Requires CURLHDR and CURLURL enviroment variable setup before use; see 'Run the test' below.)
•	postimage-trip.sh: bash shell script to output two fields, the relative launch time and the elapsed for cURL’s entire round trip. (Requires CURLHDR and CURLURL enviroment variable setup before use; see 'Run the test' below.)
•	timeseries.sh: bash shell script to output two fields, the relative (input) launch time and the delay to introduce since the last one.
•	images subdirectory: PNG files for model input; any order or quantity, as picking will be done by random.
•	imagepaths.txt file: catalog of images subdirectory, made via
find images -type f > imagepaths.txt

Procedure Examples

•	Prepare a test case for twenty input sources spaced at half-second intervals for an overall duration of five minutes:

./timeseries.sh 20 0.5 300 > testcase.in

•	Run the test:

Initialize two environment variables with target-specific header and URL information to be used in conjunction with the scripts' cURL commands (nonsense examples shown):

export CURLHDR="Host: something.somewhere.com"
export CURLURL="https://10.20.30.40:12345/processme"

A CURLURL will always be needed, but if no supplemental header information applies, set CURLHDR to something harmless, as it can't be null:

export CURLHDR="."

So, once the above is done, a look at the variables should appear like this:

env | grep CURL should give:

CURLHDR=Host: something.somewhere.com or CURLHDR=.
CURLURL=https://10.20.30.40:12345/processme

Note that the quotes didn't come through, and that's fine and proper.

And now things should be ready to go. When targets change later, the exports can be redone appropriately.

Now invoke either the "processing time" or "round trip" shell script as shown:

./postimage-proc.sh testcase.in imagepaths.txt > testcase.out

		-- or --

./postimage-trip.sh testcase.in imagepaths.txt > testcase.out

•	Sort the output:

sort -n -s testcase.out > testcase.srt

•	Plot the sorted output:

gnuplot

gnuplot> set term png

gnuplot> set output ‘testcase.png’

gnuplot> set title ‘Testcase: 20 sources, 0.5 spacing, 5 minutes’

gnuplot> set xlabel ‘Elapsed (sec)’

gnuplot> set ylabel ‘cURL File Processing (sec)’

gnuplot> plot ‘testcase.srt’ with points pt 9

gnuplot> quit
