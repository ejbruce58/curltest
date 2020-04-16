# curltest
Shell scripts and associated for cURL-based trip timing for remote image scoring.
Prerequisites

•	A contemporary, up-to-date Linux client system on RHEL (7.6+) or Ubuntu (18.04+) and with bash shell available.
•	A non-admin user account with a “home” directory for storage of shell scripts, input files and results.
•	ssh-based command line access.
•	If graphical output is desired, the freely-available gnuplot package.
•	If high-fidelity graphical output using an Xterm is needed, then access to an X Window desktop either directly or through VNC.

Tooling and Artifacts

•	filseqconntran.sh: bash shell script to output two fields, the relative launch time and the elapsed between cURL’s time of initial connect and the first bytes of returned data.
•	filseqtot.sh: bash shell script to output two fields, the relative launch time and the elapsed for cURL’s entire round trip.
•	pacegen.sh: bash shell script to output two fields, the relative (input) launch time and the delay to introduce since the last one.
•	images subdirectory: PNG files for model input; any order or quantity, as picking will be done by random.
•	imagepaths.txt file: catalog of images subdirectory, made via
find images -type f > imagepaths.txt

Procedure Examples

•	Prepare a test case for twenty input sources spaced at half-second intervals for an overall duration of five minutes:

./pacegen.sh 20 0.5 300 > testcase.in

•	Run the test:

./filseqconntran.sh testcase.in imagepaths.txt > testcase.out

•	Sort the output:

sort -n -s testcase.out > testcase.srt

•	Plot the sorted output:

gnuplot
gnuplot> set term png
gnuplot> set output ‘testcase.png’
gnuplot> set title ‘Testcase: 20 sources, 0.5 spacing, 5 minutes’
gnuplot> set xlabel ‘Elapsed (sec)’
gnuplot> set ylabel ‘cURL transfer-connect (sec)’
gnuplot> plot ‘testcase.srt’ with points pt 9
gnuplot> quit
