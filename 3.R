# 3.a Peluang 6 bayi akan lahir di rumah sakit ini besok
rata_historis = 4.5
peluangbayilahir = 6

peluang = dpois(peluangbayilahir, rata_historis)
paste (peluang)

# 3.b Histogram kelahiran 6 bayi akan lahir di rumah sakit ini 
#     selama setahun (n = 365)
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
  theme_bw()o

# 3.d Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Poisson.
rataan = peluangbayilahir*peluang
paste ("Rataan = ", rataan)

varian = rataan^1/2
paste ("Varian = ", varian)