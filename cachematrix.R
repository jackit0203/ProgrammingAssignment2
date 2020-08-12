## The following 2 functions are used for creating a special matrix with cache and storing its inversed matrix in it.

## This function takes x as input and convert it into a 2 by 2 matrix by default. There are 4 sub-functions in it, including set,get,setsolve, and getsolve. They are
## just like the examples.
## Example on usage: matx <- makeCacheMatrix(c(1,2,3,4))

makeCacheMatrix <- function(x, nrow = 2, ncol = 2) {
  s <- NULL
  set <- function(x, nrow = 2, ncol = 2) {
    x <<- matrix(x, nrow=nrow, ncol=ncol)
    s <<- NULL
  }
  get <- function() matrix(x, nrow = 2, ncol = 2)
  setsolve <- function(solve) s <<- solve
  getsolve <- function() s
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}


## This function solve the matrix created by the above function (if yet no solution) and cache the inversed matrix into it.
## Example on usage: cacheSolve(matx)

cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(s)) {
    message("getting cached data")
    return(s)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
}



