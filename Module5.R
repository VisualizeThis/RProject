# Module 5

A <- matrix(1:100, nrow=6)  
B <- matrix(1:1000, nrow=6)
# error because data length is not a multiple of nrow
#change to be a multiple
A <- matrix(1:100, nrow=10) 
B <- matrix(1:1000, nrow=10)
A
B
solve(A)
solve(B)

#B is not a square matrix, change to a square matrix
vec1 <- c( 9, -2, 6)
vec2 <- c( 2, 2, 7 )
vec3 <- c( 1, 4, 2 )

#bind the vectors into 3X3 matrices
A <- matrix(rbind(vec1,vec2,vec3), nrow = 3)
A
B <- matrix(rbind(vec2,vec1,vec3), nrow = 3)
B
#transpose the matrix A
C <- t(A)
A;C
#Determinant of matrix
det(A)
det(B)
#inverse matrix
solve(A)
solve(B)
#matrix multiplication by a vector
y <- c(2,3,2)
F <- C%*%y
# result is a 3X1 matrix
F
