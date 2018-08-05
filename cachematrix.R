## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

# Setting an inverse as null 
invMatrix <- NULL


# Sets up the matrix of values
setMatrix <- function(y) {
  x <<- y
  invMatrix <<- NULL
}

# Gets the matrix
getMatrix <- function() {
  # Returns the Matrix
  x       
}


# Sets the inverse of the matrix
setInverse <- function(inverse) {
  invMatrix <<- inverse 
}

# Gets the inverse of matrix
getInverse <- function() {
  # Returns the inverse of the matrix
  invMatrix          
}

# Gets the value of the invertible matrix as a list
list(setMatrix = setMatrix, 
     getMatrix = getMatrix,
     setInverse = setInverse, 
     getInverse = getInverse)
}


## Write a short comment describing this function

#Computes the inverse of the special matric  returned by the function makeCacheMatrix
# If the inverse has been already been calculated, the matrix hasn't changed
# otherwise the cachesolve funtion should retrive the inverse from cache

cacheSolve <- function(x, ...) {
  
  ## Return a matrix whcih has an inverse of 'x'
  m <- x$InverseGet()
  
  ## If Inverse is already set then it just return the inverse
  if( !is.null(m) ) {
    message("getting cached data")
    return(m)
  }
  
  ## Gets the matrix
  data <- x$get()
  
  ## Calculates the inverse using matrix multiplication
  m <- solve(data) %*% data
  
  ## Sets the inverse as an object
  x$InverseSet(m)
  
  ## Returns the matrix
  m
}