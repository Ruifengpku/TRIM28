import glob

exp = {}
sample = 'Gene'
n = 0

for f in glob.glob("*.gtf"):
	sample += "\t" + f[0:-4]
	n += 1
	for i in open(f):
		if i.startswith("#"):
			continue
		words = i.strip().split("\t")
		if words[2] == 'transcript':
			gene = words[-1].split('"')[5]
			expression = words[-1].split('"')[-2]
			#print expression
			if exp.has_key(gene):
				exp[gene] += "\t" + expression
			else:
				exp[gene] = expression

print sample

for i in exp:
	l = len(exp[i].split("\t"))
	out = ""
	e = [float(j) for j in exp[i].split("\t")]
	for k in range(0, l, l/n):
		out += "\t" + str(sum(e[k:k+(l/n)]))
	print i + out




