#Nama : Alya Shofarizqi Inayah
#NRP : 5025201113
#PROBSTAT E

#1.a. peluang penyurvei bertemu x = 3 orang yang tidak menghadiri 
#     acara vaksinasi sebelum keberhasilan pertama 
p = 0.20
n = 3
dgeom(x = n, prob = p)

#1.b  distribusi geometrik acak () == 3
mean(rgeom(n = 10000, prob = p) == 3)

#1.d Histogram Distribusi Geometrik
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

#1.e Nilai Rataan (μ) dan Varian (σ²)
Rata = 1/p
varian = (1-p)/ p^2
paste("Rataan (μ) = ", Rata)
paste("varian (σ²) = ", varian)