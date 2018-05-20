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
			echo file_name.csv
			echo
			echo Chosen File\: 
			read file
			echo
			echo "***********************************************"
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
			sort -n -t "," -k2,2 $file > store.csv 
			#awk -F "," '{p++;if(e>$2){wait=e-$2}else{wait=0}; totwait+=wait; if($2>e){gchart=gchart":";beg=beg":"e;numbers=numbers":"$2-e;e=$2;};gchart=gchart":"$1;beg=beg":"e;e+=$3; turn=e-$2; totturn+=turn; printf "%-14s %-14s %-11s %-14s %s\n", $1,$2,$3,wait,turn; numbers=numbers":"$3;}END{printf "\nTotal Turnaround Time | Average Turnaround Time | Average Waiting Time";printf "\n%-24s %-26s %s\n",e,totturn/p,totwait/p; printf "\n";split(gchart, chart, ":");split(numbers, num, ":");split(beg, b, ":");b[2]="0";for(c in chart){printf "%" num[c] "-s", chart[c]};printf "\n";for(n in num){printf "%" num[n] "-s", b[n]}}' $file
			#awk -F "," '{p++;if(e>$2){wait=e-$2}else{wait=0}; totwait+=wait; if($2>e){gantt=gantt":";start=start":"e;values=values":"$2-e;e=$2;};gantt=gantt":"$1;start=start":"e;e+=$3; turn=$2+wait; totturn+=turn; printf "Process Name: %-10s Arrival Time: %-10s CPU Burst: %-10s End Time: %-10s Waiting Time: %-10s Turnaround Time: %s\n", $1,$2,$3,e,wait,turn; values=values":"$3;}END{printf "\nEnd Time: %s\nAverage Waiting Time: %s\nAverage Turnaround Time: %s\n\n",e,totwait/p,totturn/p;split(gantt, gant, ":"); split(values, val, ":");split(start,st,":");st[2]="0";st[1]=e;for(g in gant){printf "|%"val[g]"-s", gant[g]}; printf "\n";for(v in val){ printf "|%"val[v]"-s", st[v]}}' ./prs.csv
			#echo Scheduled processes\:
			echo
			#p=process, e=end of process/all processes, wait=wait time, totw=total waiting time, turn=turnaround time, tott=total turnaround time, gchart= instantiate chart, process=processes, numbers=how long process takes,  
			awk -F "," '{
				process++;
				{if(end>$2)
					{wait=end-$2}
				else
					{wait=0};
					avewait+=wait;}
				if($2>end)
					{gchart=gchart":";
					beg=beg":"end;
					numbers=numbers":"$2-end;
					end=$2;};
					gchart=gchart":"$1;
					beg=beg":"end;
					end+=$3;
					turn=end-$2;
					aveturn+=turn;
					printf "%-14s %-14s %-11s %-14s %s\n", $1,$2,$3,wait,turn;
					numbers=numbers":"$3;
				}
				END{printf "\nTotal Turnaround Time | Average Turnaround Time | Average Waiting Time";
				printf "\n%-23s %-25s %s\n", end,aveturn/process,avewait/process;
				printf "\n";
				split(gchart, chart, ":");
				split(numbers, num, ":");
				split(beg, b, ":");
				b[2]="0";
				for(c in chart)
					{printf "%" num[c] "-s" "|", chart[c]};
					printf "\n";
				for(n in num)
					{printf "%" num[n] "-s" "|", b[n]}
					print end;
				}' ./store.csv
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
			echo "***********************************************"
			echo
			echo Shortest Job First Algorithm
			echo
			echo File input\:
			echo "Process Name | Arrival Time | CPU Burst | Priority" 
			awk -F "," '{printf ("%-14s %-14s %-11s %s\n", $1, $2, $3, $4)}' $file
			echo
			echo Sorted input\:
			echo "Process Name | Arrival Time | CPU Burst | Waiting Time | Turnaround Time" 
			sort -n -t "," -k3,3 $file > store.csv
			awk -F "," '{
				process++;
				{if(end>$3)
					{wait=$2}
				else
					{wait=0};
					avewait+=wait;}
				if($3>end)
					{gchart=gchart":";
					beg=beg":"end;
					numbers=numbers":"$2-end;
					end=$2;};
					gchart=gchart":"$1;
					beg=beg":"end;
					end+=$3;
					turn=end-$2;
					aveturn+=turn;
					printf "%-14s %-14s %-11s %-14s %s\n", $1,$2,$3,wait,turn;
					numbers=numbers":"$3;
				}
				END{printf "\nTotal Turnaround Time | Average Turnaround Time | Average Waiting Time";
				printf "\n%-23s %-25s %s\n", end,aveturn/process,avewait/process;
				printf "\n";
				split(gchart, chart, ":");
				split(numbers, num, ":");
				split(beg, b, ":");
				for(c in chart)
					{printf "%" num[c] "-s" "", chart[c]};
					printf "\n";
				for(n in num)
					{printf "%" num[n] "-s", b[n]}
					print end;
				}' ./store.csv
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