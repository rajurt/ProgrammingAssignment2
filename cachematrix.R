## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {  #Creating defaUlt matrix
  inv <- NULL
  set <- function(y) {                      # set matrix based on x
    x <<- y
    m <<- NULL
  }
  get <- function() x                       # get matrix
  setinv <- function(solve) inv <<- solve      # Set matrix
  getinv <- function() inv
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv)
}

x<-matrix(c(1,2,4,5,6,6,7,8,4),3,3)
z<-makeCacheMatrix(x)


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  m <- x$getinv()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinv(m)
  m
}

cacheSolve(z)
