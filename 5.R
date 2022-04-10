##Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3).

# 5.a Fungsi Probabilitas dari Distribusi Exponensial
bil_acak = 3
dexp(bil_acak)

# 5.b Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, 3))
set.seed(1)
hist(rexp(100, 3))
set.seed(1)
hist(rexp(1000, 3))
set.seed(1)
hist(rexp(10000, 3))

# 5.c Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
rataan = bil_acak
varian = 2*bil_acak

paste("Rataan : ", rataan)
paste("Varian : ", varian)