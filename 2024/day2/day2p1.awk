# Advent of Code 2024 day 2 part 1 in awk
## Author: Chris Menard

function isSafe(level,     array,      i,     first,     second,      dir) {
	split(level,array)

	first = array[1]
	second = array[2]
	len = length(array)
	dir = first < second ? 1 : 0
	
	for (i=2; i <= len; i++) {
		if (!checkDir(first, second, dir) || !checkSpacing(first,second)) {
			return 0
		}

		first = second
		second = array[i+1]
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
	tot += isSafe($0)
}

END {
	print tot
}
