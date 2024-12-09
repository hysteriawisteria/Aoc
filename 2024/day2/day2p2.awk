# Advent of Code 2024 day 2 part 1 in awk
## Author: Chris Menard

function isSafe(array,      i,     start,     first,     second,      dir,     val) {
	
	len = length(array)
	if (1 in array) {
		first = array[1]+0
		start = 2
	} else {
		first = array[2]+0
		start = 3
		len++
	}

	if (!(start in array)) {
		start++
		len++
	}
	second = array[start]+0

	dir = first < second ? 1 : 0
	
	for (i=start; i <= len; i++) {
		if (!checkDir(first, second, dir) || !checkSpacing(first,second)) {
			return 0
		}

		first = second
		if (!((i+1) in array)) {
			i++
			len++
		}
		second = array[i+1]+0
	}

	return 1
}

function checkDir(pos1, pos2, dir) {
	if ((pos1 < pos2 && dir == 1) || (pos1 > pos2 && dir == 0)) {
		return 1
	} else {
		return 0
	}
}

function checkSpacing(pos1, pos2) {
	if (abs(pos1 - pos2) >= 1 && abs(pos1 - pos2) <= 3) {
		return 1
	} else {
		return 0
	}
}

function abs(num) {
	return num > 0 ? num : -num
}

/[0-9]/ {
	split($0,array)
	if (isSafe(array)) {
		tot += 1
	} else {
		for (j=1; j<=length(array); j++) {
			val = array[j]
			delete array[j]

			if (isSafe(array)) {
				print $0,j
				tot += 1
				break;
			}
			array[j] = val
		}
	}
}

END {
	print tot
}
