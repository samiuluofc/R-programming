## the <<- operator which can be used to assign a value to an object 
## in an environment (current) that is different from the current environment.

## functions do

## This function will create cache matrix. It provides the 
## the facility for set and get matrix values, as well as setinv and getinv.

makeCacheMatrix <- function(x = matrix()) {
      inv <- NULL
      set <- function(y) {
            x <<- y
            inv <<- NULL
      }
      get <- function() x
      setinv <- function(inv_cal) inv <<- inv_cal
      getinv <- function() inv
      list(set = set, get = get, setinv = setinv, getinv = getinv)
}



## Return a matrix that is the inverse of 'x'
cacheSolve <- function(x, ...) {
      
      inv <- x$getinv()
      if(!is.null(inv)) {
            message("getting cached Inverse Matrix")
            return(inv)
      }
      data <- x$get()
      inv <- solve(data, ...)
      x$setinv(inv)
      inv
}
