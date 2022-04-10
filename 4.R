## Diketahui nilai x = 2 dan v = 10.
# 4.a Fungsi Probabilitas dari Distribusi Chi-Square
x = 2
v = 10
dchisq(x,v)

# 4.b Histogram dari Distribusi Chi-Square dengan 100 data random
datarandom = 100
chisquare = rchisq(datarandom, v)
hist(chisquare)

# 4.c Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square
rataan = v
varian = 2*v

paste("Rataan : ", rataan)
paste("Varian : ", varian)