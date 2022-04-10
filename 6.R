## Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8.

# 6.a Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), 
# hitung Z-Score Nya dan 
# plot data generate randomnya dalam bentuk grafik. 
# Petunjuk(gunakan fungsi plot()).
mean = 50
sd = 8
data = 100

set.seed(100)

plotrandom = rnorm(data, mean, sd)
x1 = floor(mean(plotrandom))
x2 = ceiling(mean(plotrandom))
temp = pnorm(x2, mean, sd, lower.tail = TRUE) - pnorm(x1, mean, sd, lower.tail = TRUE)
paste("Distribusi normal = ", temp)

z_x1 = (x1-mean)/sd
z_x2 = (x2-mean)/sd
paste("Z-Score X1 = ", z_x1)
paste("Z-Score X2 = ", z_x2)

par(mfrow = c(2,1))
plot(plotrandom, type = "l")

# 6.b Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
# NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
h = hist(rnorm(100, mean, sd), breaks = 50, main="5025201113_Alya Shofarizqi Inayah_E_DNhistogram", xlab = "Value", ylab = "Frequency")

# 6.c Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
varian = sd*sd
paste("varian = ", varian)