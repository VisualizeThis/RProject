devtools::check()


y <-get.CDC.data()
z <-filter.CDC.data(y,2015,'Florida')
x <- plot.CDC.data(z)
x
