#!/bin/sh

#################################
#Program Info: Main Menu Shell 
#Programmer: Sabine Jeanjaquet
#Date Created: May 18, 2018
#Last Modified: May 18, 2018
################################

#Main Menu
#variables
#schedulers=("1" "3" "3" "4")
#select sched in "${schedulers[@]}"


#code to execuse main Menu
while true
do
echo "***********************************************"
echo ————————————
echo PROGRAM MENU
echo ————————————
echo
echo 1. First Come First Serve Algorithm
echo 2. Shortest Job First Algorithm
echo 3. Round Robin Algorithm
echo 4. Exit 
echo
echo Please enter the number of your choice\:
read sched
echo
echo "***********************************************"
	case $sched in
		#fcfs
		1)
			#enter file name
			echo Please enter your csv file name.
			echo
			echo Example\:
			echo ./file_name.csv
			echo
			echo Chosen File\: 
			read file
			echo
			echo"***********************************************"
			echo
			echo First Come First Serve Algorithm
			echo
			echo File input\:
			echo "Process Name | Arrival Time | CPU Burst | Priority" 
			#FCFS CODE
			#cat $file | sed 's/\t/,/g' | column -s ',' -t #displays the contents of the csv file
			awk -F "," '{printf ("%-14s %-14s %-11s %s\n", $1, $2, $3, $4)}' $file
			#awk -F "\"*,\"*" '{printf $1 "| $2 "|" $3 "|" $4}' $file 
			echo
			echo Sorted input\:
			echo "Process Name | Arrival Time | CPU Burst | Waiting Time | Turnaround Time" 
			awk -F "," '{
				process++;
				if(end > $2)
					wait=end-$2
				else
					wait=0;
					avewait+=wait;
				if( $2 > end)
					{
						gchart=gchart":";
						beg=beg":"end;
						inside=inside":"end;
						end=$2;};
						gchart=gchart":"$1;
						beg=beg":"end;
						end+=$3;
						turn=end-$2;
						aveturn+=turn;
						printf "%-14s %-14s %-11s %-14s %s\n", $1,$2,$3,wait,turn;
						inside=inside":"$3;
					}
				END{printf "\nTotal Turnaround Time Time: %s\nAverage Waiting Time: %s\nAverage Turnaround Time: %s\n\n", end, avewait/process, aveturn/process;
					split(gchart, gchar, ":");
					split(inside, insid, ":");
					split (beg, b, ":");
					b[2]="0";
					for (value in gchar)
						{printf "%" insid[value]"-s" "|", gchar[value]};
						printf "\n";
					for(val in insid)
						{printf "%"insid[val]"-s" "|", b[val]}
						print end; 
				}' $file
			#echo Scheduled processes\:
			#sort -n -t "," -k2,2 -k3,3 $file | sed 's/\t/,/g' | column -s ',' -t
			echo
			#awk -F "," '{i++;if(x>$2){w=x-$2}else{w=0}; tw+=w; if($2>x){gantt=gantt":";start=start":"x;values=values":"$2-x;x=$2;};gantt=gantt":"$1;start=start":"x;x+=$3; t=x-$2; tt+=t; printf "Process Name: %-10s Arrival Time: %-10s CPU Burst: %-10s End Time: %-10s Waiting Time: %-10s Turnaround Time: %s\n", $1,$2,$3,x,w,t; values=values":"$3;}END{printf "\nEnd Time: %s\nAverage Waiting Time: %s\nAverage Turnaround Time: %s\n\n",x,tw/i,tt/i;split(gantt, gant, ":"); split(values, val, ":");split(start,st,":");st[2]="0";st[-1]=x;for(g in gant){printf "|%"val[g]"-s", gant[g]}; printf "\n";for(v in val){ printf "|%"val[v]"-s", st[v]}}' $file
			echo
			;;
		#sjf
		2)
			#code 2
			echo Please enter your csv file name.
			echo
			echo Example\:
			echo ./file_name.csv
			echo
			echo Chosen File\: 
			read file
			echo
			echo"***********************************************"
			echo
			echo Shortest Job First Algorithm
			echo
			echo File input\:
			echo "Process Name | Arrival Time | CPU Burst | Priority" 
			awk -F "," '{printf ("%-14s %-14s %-11s %s\n", $1, $2, $3, $4)}' $file
			echo
			echo Sorted input\:
			echo "Process Name | Arrival Time | CPU Burst | Waiting Time | Turnaround Time" 
			awk -F "," '{
				process++;
				if(end > $3)
					wait=end-$3
				else
					wait=0;
					avewait+=wait;
				if( $3 > end)
					{
						gchart=gchart":";
						beg=beg":"end;
						inside=inside":"end;
						end=$3;};
						gchart=gchart":"$1;
						beg=beg":"end;
						end+=$3;
						turn=end-$2;
						aveturn+=turn;
						printf "%-14s %-14s %-11s %-14s %s\n", $1,$2,$3,wait,turn;
						inside=inside":"$3;
					}
				END{printf "\nTotal Turnaround Time Time: %s\nAverage Waiting Time: %s\nAverage Turnaround Time: %s\n\n", end, avewait/process, aveturn/process;
					split(gchart, gchar, ":");
					split(inside, insid, ":");
					split (beg, b, ":");
					b[2]="0";
					for (value in gchar)
						{printf "%" insid[value]"-s" "|", gchar[value]};
						printf "\n";
					for(val in insid)
						{printf "%"insid[val]"-s" "|", b[val]}
						print end; 
				}' $file
			;;
		#rr
		3) 
			#code 3
			echo rr code
			break
			;;
		#exit shell script
		4)
			break
			;;
		*)
			echo 'Invalid input.'
			echo 'Choose another option.'
			;;
	esac
done		