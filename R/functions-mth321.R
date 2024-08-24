library(tidyverse)

SlopeField = function(FUN,xi = -5,xs = 5,yi = -5,ys = 5, radius = 0.1, grid.by = 0.25, angle = 45, lwd = 1, 
                      main = "", ylab = "y", xlab = "t", cor = cor){
  # Source: https://stackoverflow.com/questions/47984874/how-to-create-a-slope-field-in-r
  # FUN   - given function ODE i.e:  
  # xi,xs - lower and upper bound - x - plot
  # yi,ys - lower and upper bound - y - plot
  
  # grid points
  seqx = seq(xi,xs,grid.by)
  seqy = seq(yi,ys,grid.by)
  
  # plot
  f = c(xi,xs) 
  h = c(yi,ys)
  plot(f,h,main=main, ylab = ylab, xlab = xlab, pch = ".",lty="blank")
  abline(v = 0, col="gray", lwd=1, lty=1)
  abline(h = 0, col="gray", lwd=1, lty=1)
  
  # arrows
  
  for(x in seqx){
    for(y in seqy){
      ym = y
      xm = x
      
      slope = unlist(FUN(x,y))
      cor = cor
      arrows(radius*cos(atan(slope)+pi)+xm,
             radius*sin(atan(slope)+pi)+ym,
             radius*cos(atan(slope))+xm,
             radius*sin(atan(slope))+ym, 
             length = 0.2*radius, col= cor,
             angle = angle, lwd = lwd)
    }
  }
}