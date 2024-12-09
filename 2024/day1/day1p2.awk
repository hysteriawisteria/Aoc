# Advent of Code 2024 day 1 part 2 in awk
## Author: Chris Menard
/[0-9]/ {
	col1[$1] += 1
	col2[$2] += 1
}

END {
	for (i in col1) {
		tot += i * col1[i] * col2[i]
	}

	print tot
}
