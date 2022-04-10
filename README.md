# Modul 1 Praktikum Probstat 2022

### Soal 1
Seorang penyurvei secara acak memilih orang-orang di jalan sampai dia bertemu dengan
seseorang yang menghadiri acara vaksinasi sebelumnya.
#### 1.a
Peluang penyurvei bertemu x = 3 orang yang tidak menghadiri acara vaksinasi sebelum keberhasilan pertama ketika p = 0,20 dari populasi menghadiri acara vaksinasi (distribusi Geometrik)
```sh
p = 0.20
n = 3
dgeom(x = n, prob = p)
```
output :
```sh
[1] 0.1024
```

#### 1.b
Mean Distribusi Geometrik dengan 10000 data random , prob = 0,20 dimana distribusi
geometrik acak tersebut X = 3
```sh
mean(rgeom(n = 10000, prob = p) == 3)
```
output :
```sh
[1] 0.1018
```

#### 1.c
Kesimpulan perbandingan Hasil poin a dan b
Dapat disimpulkan dan dibandingkan dengan melibat output kedua hasil distrubusi Geometrik tersebut bahwa tidak ada perbandingan yang signifikan diantara keduanya. Hasil perhitungan keduanya tidak terlalu jauh.

#### 1.d 
Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
```sh
library(dplyr)
library(ggplot2)
data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
        mutate(Failures = ifelse(x == n, n, "other")) %>%
    ggplot(aes(x = factor(x), y = prob, fill = Failures)) +
        geom_col() +
         geom_text(
            aes(label = round(prob,2), y = prob + 0.01),
            position = position_dodge(0.9),
            size = 3,
            vjust = 0
        ) +
        labs(title = "Histogram Distribusi Geometrik",
            subtitle = "Geometrik(.2)",
            x = "Peluang Kegagalan sebelum kesuksesan pertama (x)",
            y = "Probabilitas") 
```
Hasil Histogram Distribusi

![soal1](https://user-images.githubusercontent.com/80805094/162611458-25cde478-2458-48ec-80d3-ec08ed789baa.jpeg)

#### 1.e
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik.
```sh
Rata = 1/p
varian = (1-p)/ p^2
paste("Rataan (μ) = ", Rata)
paste("varian (σ²) = ", varian)
```
output :
```sh
[1] "Rataan (µ) =  5"
[1] "varian (s²) =  20"
```

### Soal 2
Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2

#### 2.a
Peluang terdapat 4 pasien yang sembuh.
```sh
jumlahsampel = 20
pasiensembuh = 4
probSembuh = 0.2
probtdksembuh = 1 - probSembuh

dbinom(pasiensembuh, jumlahsampel, probSembuh)
```
output :
```sh
[1] 0.2181994
```

#### 2.b
Grafik histogram berdasarkan kasus
```sh
probabilitas <- dbinom(1:20, jumlahsampel, probSembuh)
grafik = data.frame(y=c(probabilitas), x=c(1:20))
barplot(grafik$y, names.arg=grafik$x, ylab="Probabilitas", xlab="Jumlah Pasien")
```
Grafik Histogram

![soal2](https://user-images.githubusercontent.com/80805094/162613550-49ee854c-b3fc-44ca-b81a-0a8ad2e36862.jpeg)

#### 2.c
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Binomial.
```sh
rataan = pasiensembuh*probSembuh
varian = pasiensembuh*probSembuh*probtdksembuh
paste("Rataan (μ) = ", rataan)
paste("Varian (σ²) = ", varian)
```
output :
```sh
[1] "Rataan (µ) =  0.8"
[1] "Varian (s²) =  0.64"
```

### Soal 3
Diketahui data dari sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

#### 3.a
Peluang 6 bayi akan lahir di rumah sakit ini besok
```sh
rata_historis = 4.5
peluangbayilahir = 6

dpois(peluangbayilahir, rata_historis)
```
output :
```sh
[1] 0.1281201
```

#### 3.b
Histogram kelahiran 6 bayi akan lahir di rumah sakit ini selama setahun (n = 365)
```sh
library(tidyverse) 
library(ggplot2)
set.seed(2)

bayilahir <- data.frame('data' = rpois(365, rata_historis))

bayilahir %>% ggplot() +
  geom_histogram(aes(x = data,
                     y = stat(count / sum(count)),
                     fill = data == 6),
                 binwidth = 1,
                 color = 'black',) +
  scale_x_continuous(breaks = 0:10) + 
  labs(x = 'Jumlah bayi lahir per periode',
       y = 'Peluang',
       title = 'Histogram kelahiran 6 bayi akan lahir selama setahun') +
  theme_bw()
 ```
 Hasil Histogram 
 
![soal3](https://user-images.githubusercontent.com/80805094/162619360-43eff23d-7394-4b71-adf7-7935f5cc6239.jpeg)

#### 3.c
Kesipulan perbandingan hasil poin a dan b
Didapatkan hasil dari poin a adalah 0.1281201 dan pada histogram poin b dapat dilihat bahwa 6 bayi lahir dalam setahun memiliki probabilitas yang sama. Maka dari itu, dapat disimpulkan bahwa bahwa nilai distribusi poisson tidak berubah.

#### 3.d
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
```sh
rataan = peluangbayilahir*peluang
paste ("Rataan = ", rataan)

varian = rataan^1/2
paste ("Varian = ", varian)
```
output :
```sh
[1] "Rataan =  0.768720863187505"
[1] "Varian =  0.384360431593752"
```

### Soal 4
Diketahui nilai x = 2 dan v = 10.

#### 4.a
Fungsi Probabilitas dari Distribusi Chi-Square
```sh
x = 2
v = 10
dchisq(x,v)
```
output :
```sh
[1] 0.007664155
```

#### 4.b
Histogram dari Distribusi Chi-Square dengan 100 data random
```sh
datarandom = 100
chisquare = rchisq(datarandom, v)
hist(chisquare)
```
Hasil Histogram Distribusi Chi-Square

![nomer4](https://user-images.githubusercontent.com/80805094/162620580-a657b61e-40ad-408a-9ae4-1ef0096a19e6.jpeg)

#### 4.c
Nilai Rataan (μ) dan Varian (σ²) dari DistribusiChi-Square
```sh
rataan = v
varian = 2*v

paste("Rataan : ", rataan)
paste("Varian : ", varian)
```
output :
```sh
[1] "Rataan :  10"
[1] "Varian :  20"
```

### Soal 5
Diketahui bilangan acak (random variable) berdistribusi exponential (λ = 3).
>petunjuk : 
- Gunakan set.seed(1) 
- Gunakan fungsi bawaan R

#### 5.a
Fungsi Probabilitas dari Distribusi Exponensial
```sh
bil_acak = 3
dexp(bil_acak)
```
output :
```sh
[1] 0.04978707
```

#### 5.b
Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random
```sh
par(mfrow = c(2,2))
set.seed(1)
hist(rexp(10, 3))
set.seed(1)
hist(rexp(100, 3))
set.seed(1)
hist(rexp(1000, 3))
set.seed(1)
hist(rexp(10000, 3))
```
Hasil Histogram

![soal5](https://user-images.githubusercontent.com/80805094/162621352-a6205b5b-8ea3-406e-80cb-331682402b6b.jpeg)


#### 5.c
Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Exponensial untuk n = 100 dan λ = 3
```sh
rataan = bil_acak
varian = 2*bil_acak

paste("Rataan : ", rataan)
paste("Varian : ", varian)
```
output :
```sh
[1] "Rataan :  10"
[1] "Varian :  20"
```

### Soal 6
Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8.

#### 6.a
Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
> Keterangan :
X1 = Dibawah rata-rata
X2 = Diatas rata-rata

> Contoh data :
11
1,2,4,2,6,3,10,11,5,3,6,8
rata-rata = 5.083333
X1 = 5
X2 = 6

```sh
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
```

output :
```sh
[1] "Distribusi normal P(X1 <= x <= X2) =  0.0497382248301129"
[1] "Z-Score X1 =  0"
[1] "Z-Score X2 =  0.125"
```
#### 6.b
Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
> Contoh :
312312312_Rola_Probstat_A_DNhistogram
```sh
h = hist(rnorm(100, 50, 8), breaks = 50, main="5025201113_Alya Shofarizqi Inayah_E_DNhistogram")
```
Hasil Histogram
![soal6](https://user-images.githubusercontent.com/80805094/162623088-4528c9d5-8928-489f-b800-3ea11d6e57e6.jpeg)

#### 6.c
Nilai Varian (σ²) dari hasil generate random nilai Distribusi Normal.
```sh
varian = sd*sd
paste("varian = ", varian)
```
output :
```sh
[1] "varian =  64"
```
