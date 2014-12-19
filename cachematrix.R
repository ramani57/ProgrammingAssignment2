## Creates the cache by setting and getting the matrix
## The matrix that is passes is set and retrieved by get.
## The function returns a list of R opbjects of get and set so that the calling function can access the methods
## from the list.
makeCacheMatrix <- function(x = matrix()){
        m<- NULL
        set <- function(y){
                x <<- y
                m <<- NULL
                message(" step 1")
                print(x)
        }

        get <- function(){
                return(x)
                message("step2")
        }
        setIMatrix <- function(IMatrix){
                m <<- IMatrix
        }
        getIMatrix <- function(){
                return (m)
        }

        return (list( set = set, get = get, setIMatrix = setIMatrix, getIMatrix = getIMatrix))
}

## Retrieves the matrix from cache and does Inverse.
cacheSolve <- function(x){
        data <- list()
        m <- x$getIMatrix()
        print(m)
        if (!is.null(m)){
                message("Cached Data Found")
                return(m)
        }else{
                message("No Cached Data Found")
                data <- x$get()
                m <- solve(data)
                x$setIMatrix(m)
                return(m)

        }
}