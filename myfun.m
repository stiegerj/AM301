function f = myfun(theta,r)

f = ((sqrt(2) / (81 * sqrt(pi))) * (6*r - r^2) * exp(-r/3) * cos(theta)) ^2;
