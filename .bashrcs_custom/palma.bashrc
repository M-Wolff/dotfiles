#! /usr/bin/env bash

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific aliases and functions
HOSTNAME=`hostname`
if [ "$SSH_TTY" ]; then  # only execute following block on a shell connection (avoid breaking SFTP stuff)
#    if [ ${HOSTNAME} == "r07m01" ]; then  # only execute these commands on the head-node (vim and some modules not available on compute nodes)
        # Whatever only should run on login node
#   fi
    alias v="vim"
    alias nano="vim"
    #alias sq="squeue -O 'JobId:12 | ,Partition:.9 | ,Username:8 | ,Name:16 | ,State:.7 | ,TimeUsed:.11 | ,TimeLeft:.11 | ,MaxCPUs:.5 | ,MinMemory:.10 | ,tres-per-node:13 | ,Reason:8 | ,Nodelist:8 | ,Prioritylong'"
    alias sq="squeue -o '%.10i | %.9P | %.8u | %.8Q | %.33j | %.7T | %.11M | %.11L | %.5C | %.10m | %.13b | %.12R'"
fi



slurm_gpus() {
	nodes=$(scontrol show node | awk -v RS="" '
	{
	node=""; parts=""; state=""; gputype="";
	total=alloc=avail=0;
	mem_total=mem_alloc=mem_avail=0;
	cpu_total=cpu_alloc=cpu_avail=0;

	# Parse core attributes
	if (match($0,/NodeName=([^ \n]+)/,m)) node=m[1];
		if (match($0,/Partitions=([^ \n]+)/,m)) parts=m[1];
			if (match($0,/State=([^ \n]+)/,m)) state=m[1];
				if (state ~ /DOWN|DRAIN|FAIL|MAINT|RESERVED/) next;

	    # GPU info
	    if (match($0,/Gres=([^ \n]+)/,m)) {
		    gres=m[1];
		    if (match(gres,/gpu:([^: \n]+):?([0-9]*)/,g)) {
			    gputype=g[1];
			    total = (g[2]!="" ? g[2]+0 : 0);
		    }
    		}

	  # GPU allocation
	  if (match($0,/AllocTRES=[^ \n]*/,a)) {
		  alloc_tres=a[0];
		  if (match(alloc_tres,/gres\/gpu=([0-9]+)/,b)) alloc=b[1]+0;
		  else if (match(alloc_tres,/gpu=([0-9]+)/,b)) alloc=b[1]+0;
		  }

	  avail = total - alloc;
	  if (avail < 0) avail = 0;

		# Memory info
		if (match($0,/RealMemory=([0-9]+)/,m)) mem_total = m[1]+0;
			if (match($0,/AllocMem=([0-9]+)/,m)) mem_alloc = m[1]+0;
				mem_avail = mem_total - mem_alloc;
				if (mem_avail < 0) mem_avail = 0;
		mem_avail = mem_avail / 1000
		mem_total = mem_total / 1000

	    # CPU info
	    if (match($0,/CPUTot=([0-9]+)/,m)) cpu_total = m[1]+0;
		    if (match($0,/CPUAlloc=([0-9]+)/,m)) cpu_alloc = m[1]+0;
			    cpu_avail = cpu_total - cpu_alloc;
			    if (cpu_avail < 0) cpu_avail = 0;

	# Only keep nodes with GPUs
	if (total > 0 && gputype != "") {
		# fixed-width record for sorting and later printing
		printf "%-8s %-15s %-18s %-10s %5d %9d %9d %9d %9d %9d %9d\n", \
			gputype, parts, node, state, total, alloc, avail, mem_avail, mem_total, cpu_avail, cpu_total;
		}
}')

	# Sort by GPU type then available GPUs descending
	sorted=$(echo "$nodes" | sort -k2,2 -k7,7nr)

	    # Headers
	    printf "%-8s %-15s %-18s %-10s %5s %9s %9s %9s %9s %9s %9s\n" \
		    "GPU Type" "Partition" "Node" "State" "GPUs" "GPU Alloc" "GPU Avail" \
		    "MemAvail" "MemTotal" "CPUAvail" "CPUTotal"
	printf "%-8s %-15s %-18s %-10s %5s %9s %9s %9s %9s %9s %9s\n" \
		"--------" "---------" "----" "-----" "-----" "---------" "---------" \
		"---------" "---------" "---------" "---------"

	prev_partition=""
	while read -r line; do
		partition=$(echo "$line" | awk '{print $2}')
		if [[ "$prev_partition" != "" && "$prev_partition" != "$partition" ]]; then
			printf "%-8s %-15s %-18s %-10s %5s %9s %9s %9s %9s %9s %9s\n" \
				"--------" "---------" "------------------" "----------" "-----" "---------" "---------" \
				"---------" "---------" "---------" "---------"
		fi
		echo "$line"
		prev_partition="$partition"
	done <<< "$sorted"
}
