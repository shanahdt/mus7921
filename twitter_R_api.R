###This is the general idea of how a script will be run for RECREL operation.
###I have all of the variables figured out, except the [mag.x].
###Once [mag.x] is finished, the script can be easily completed.
###I'm using sets x and y for testing. Interval vectors of 222220 and 444441.
###The final answer should be 6.4 degrees.
recrel <- function(a,b,c,d,e,f,g,h,i,j,k,l){
x <- matrix(c(a,b,c,d,e,f, nrow = 1, ncol = 6))
y <- matrix(c(g,h,i,j,k,l), nrow = 1, ncol = 6)
xny <- ((x[1,]*y[,1])+(x[2,]*y[,2])+(x[3,]*y[,3])+(x[4,]*y[,4])+(x[5,]*y[,5])+(x[6,]*y[,6]))
xny
###mag.x  	###Can't figure this one out
mag.x <- sqrt(sum(x^2))
mag.y <- sqrt(sum(y^2))

#norm.x <- x/4.472136
radians <- acos((xny)/((mag.x)*(mag.y)))
degrees <- (radians * 180)/pi
degrees
}
###Should be the same as...
#RECREL <- acos(norm.x)*(norm.y)

###Answer can be expressed in degrees or radians.

