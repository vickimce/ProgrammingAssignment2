## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

# Creates a special matrix object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {

  # Setting an inverse as null
  inv <- NULL
  
  
  # Sets up the matrix
  set <- function(matrix){
    m <<- matrix
    inv <<- NULL
  }
  
  # Gets the matrix
  get <- fucntion(){
    # Returns the Matrix
    m
  }
  
  # Sets the inverse of the matrix
  InverseSet <- function(Inverse){
    inv <<- Inverse
  }
  
  # Gets the inverse of matrix
  InverseGet <- function(){
    # Returns the inverse of the matrix
    inv
  }
  
  # List of the Method
  list(set = set, get = get, 
       InverseSet= InverseSet, 
       InverseGet= InverseGet)
  
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