# Advent of Code 2024 day 1 part 1 in awk
## Author: Chris Menard

function min(array,      i,     m) {
	for (i in array) {
		if (m == "" || i < m) {
			m = i
		}
	}
	if (array[m] == 1) {
		delete array[m]
	} else {
		array[m] -= 1
	}

	return m
}

function abs(a) {
	return (a > 0) ? a : -a
}

/[0-9]/ {
	col1[$1] += 1
	col2[$2] += 1
}

END {
	while (length(col1) > 0) {
		tot += abs(min(col1) - min(col2))
	}

	print tot
}
