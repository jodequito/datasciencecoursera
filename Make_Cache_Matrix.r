makeCacheMatrix <- function(x = matrix()) {
  s <- NULL 
  set <- function(y) {
    x <<- y ## x in the cache is y
    s <<- NULL ## s in the cache is null
  }
  get <- function() x
  setinverse <- function(solve) s <<- solve ## s in the cache is set
  getinverse <- function() s ## get s out of the cache
  list(set = set, get = get, ## make the list with get/set the inverse of the matrix including the data
       setinverse = setinverse,
       getinverse = getinverse)
}


cacheSolve <- function(x, ...) { ### takes an object of class makeCacheMatrix (list...)
  s <- x$getinverse()
  if(!is.null(s)) {
    message("getting cached data") ## if inverse of a matrix is cached, get this...
    return(s) ## ...and give it back to the program
  }
  data <- x$get() ## Data is now the matrix in the cache
  s <- solve(data, ...) ## inverse of the matrix is calculated...
  x$setinverse(s) ...## and written in the cache
  s
}