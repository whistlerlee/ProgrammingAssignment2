## Put comments here that give an overall description of what your
## functions do

## makeCacheMatrix returns object where cached-inverse is located and
## set of method managing cached-inverse is defined.

makeCacheMatrix <- function(x = matrix()) {
	inv <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setinv <- function(invNew) inv <<- invNew
        getinv <- function() inv
        list(set = set, get = get, setinv = setinv, getinv = getinv)
}


## cacheSolve returns inverse of x which is either cached or
## newly calculated if cached value is not found.

cacheSolve <- function(x, ...) {
        if(!is.null(x$getinv())) {
                message("getting cached data")
                return(x$getinv())
        }
        x$setinv(solve(x$get(), ...))
	x$getinv()
}
