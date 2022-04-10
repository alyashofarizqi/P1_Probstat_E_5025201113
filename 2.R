# 2.a Peluang terdapat 4 pasien yang sembuh.
jumlahsampel = 20
pasiensembuh = 4
probSembuh = 0.2
probtdksembuh = 1 - probSembuh

dbinom(pasiensembuh, jumlahsampel, probSembuh)

# 2.b Grafik histogram berdasarkan kasus
probabilitas <- dbinom(1:20, jumlahsampel, probSembuh)
grafik = data.frame(y=c(probabilitas), x=c(1:20))
barplot(grafik$y, names.arg=grafik$x, ylab="Probabilitas", xlab="Jumlah Pasien")

# 2.c Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
rataan = pasiensembuh*probSembuh
varian = pasiensembuh*probSembuh*probtdksembuh
paste("Rataan (μ) = ", rataan)
paste("Varian (σ²) = ", varian)