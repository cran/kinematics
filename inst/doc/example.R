## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  knitr::opts_chunk$set(fig.width=6, fig.height=5), 
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(kinematics)

## ----parabolic-create---------------------------------------------------------
mov <- data.frame(t = c(0, 1, 2, 3, 4), 
                  x = c(0, 1, 2, 3, 4), 
                  y = c(0, 1, 4, 9, 16))

## ----parabolic-plot-----------------------------------------------------------
plot(mov$x, mov$y, xlab = "x", ylab = "y")

## ----parabolic-display, echo=FALSE--------------------------------------------
mov

## ----append-------------------------------------------------------------------
mov_analyzed <- append_dynamics(mov)

## ----display, echo=FALSE------------------------------------------------------
mov_analyzed

## ----ggplot-------------------------------------------------------------------
library(ggplot2)
ggplot(data = mov_analyzed, 
       mapping = aes(x = x, y = y, col = curv_radius, size = aspeed)) +
       geom_point() +
       scale_color_gradient(low="blue", high="red")

## ----spiral create------------------------------------------------------------
# Generate the times
ts <- seq(0, 10, by = 0.05)

# Calculate the positions using a function
xs <- ts * cos(ts)
ys <- ts * sin(ts)

# Store as data frame
mov <- data.frame(t = ts, 
                  x = xs, 
                  y = ys)

## ----spiral-plot--------------------------------------------------------------
plot(mov$x, mov$y, xlab = "x", ylab = "y", asp = 1)

## ----spiral-analyzed----------------------------------------------------------
mov_analyzed <- append_dynamics(mov)

## ----spiral-ggplot------------------------------------------------------------
ggplot(data = mov_analyzed, 
       mapping = aes(x = x, y = y, col = curv_radius, size = aspeed)) +
       geom_point(alpha = 0.5) +
       coord_fixed() +
       scale_color_gradient(low="blue", high="red")

## ----load-data----------------------------------------------------------------
mov <- kinematics::example_mov
plot(mov$x, mov$y, xlab = "x", ylab = "y", asp = 1)


## ----analyze-data-------------------------------------------------------------
mov_analyzed <- append_dynamics(mov)

## ----plot-data----------------------------------------------------------------
ggplot(data = mov_analyzed, 
       mapping = aes(x = x, y = y, col = aaccel, size = aspeed)) +
       geom_point(alpha = 0.1) +
       coord_fixed() +
       scale_color_gradient(low="blue", high="red")

## ----hist-data----------------------------------------------------------------
hist(mov_analyzed$aaccel, 
     breaks = 500, 
     xlab = 'Accelerations', 
     main = 'Acceleration histogram')

