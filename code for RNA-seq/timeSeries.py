import sys

def timeSeries(expression, direction = 1 , fold = 1.2):
	'''direction : +1 --> up
				   -1 --> down
	'''
	res = {}

	for gene in expression:
		flag = 1
		base = float(expression[gene][0]) or 0.01
		for exp in expression[gene][1:]:
			exp = float(exp) or 0.01
			if direction == 1:
				if exp/base < fold:
					flag = 0
			else:
				if exp/base > 1/float(fold):
					flag = 0
			base = exp or 0.01

		if flag == 1:
			res[gene] = expression[gene]

	return res

def writeFile(fileName, dict):
	out = open(fileName, "w")
	for i in dict:
		total = 0
		for j in dict[i]:
			total += float(j)
		if total >= 10:
			out.write(i + "\t" + "\t".join(dict[i]) + "\n")

miRNA = {}

for i in open(sys.argv[1]):
	if i.startswith("Gene"):
		continue

	j = i.strip().split("\t")
	miRNA[j[0]] = j[1:]

up = timeSeries(miRNA, 1, 1.2)
down = timeSeries(miRNA, -1, 1.2)

writeFile("TPM.timeUP_1.2.xls", up)
writeFile("TPM.timeDOWN_1.2.xls", down)
	

