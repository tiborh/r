## Rule of thumb: everything is treated as an object
bubba <- 1:3
class(bubba)                            # integer

class(bubba) <- append(class(bubba),"numeric")
class(bubba)                            # "integer" "numeric"
typeof(bubba)                           # "integer"

## UseMethod to add a method:

bubba <- list(first="one", second="two", third="third")
class(bubba) <- append(class(bubba),"Flamboyancy")

bubba
## $first
## [1] "one"

## $second
## [1] "two"

## $third
## [1] "third"

## attr(,"class")
## [1] "list"        "Flamboyancy"

GetFirst <- function(x) {
    UseMethod("GetFirst",x)
}

GetFirst.Flamboyancy <- function(x) {
   return(x$first)
}

GetFirst(bubba)                         # "one"

e <- environment()                      # <environment: R_GlobalEnv>

assign("bubba",3,e)

bubba                                   # 3

get("bubba",e)                          # 3

## creating an S3 Class

## straightforwardly:

NorthAmerican <- function(eatsBreakfast=TRUE,myFavorite="cereal") {
        me <- list(
                hasBreakfast = eatsBreakfast,
                favoriteBreakfast = myFavorite
       )

        ## Set the name for the class
        class(me) <- append(class(me),"NorthAmerican")
        return(me)
}

bubba <- NorthAmerican()
bubba
## $hasBreakfast
## [1] TRUE

## $favoriteBreakfast
## [1] "cereal"

## attr(,"class")
## [1] "list"          "NorthAmerican"

bubba$hasBreakfast                      # T

louise <- NorthAmerican(T,"fried eggs")
louise
$hasBreakfast
## [1] TRUE

## $favoriteBreakfast
## [1] "fried eggs"

## attr(,"class")
## [1] "list"          "NorthAmerican"

## Creating methods

setHasBreakfast <- function(elObjeto, newValue) {
    print("Calling the base setHasBreakfast function")
    UseMethod("setHasBreakfast",elObjeto)
    print("Note this is not executed!")
}

setHasBreakfast.default <- function(elObjeto, newValue) {
    print("You screwed up. I do not know how to handle this object.")
    return(elObjeto)
}


setHasBreakfast.NorthAmerican <- function(elObjeto, newValue) {
    print("In setHasBreakfast.NorthAmerican and setting the value")
    elObjeto$hasBreakfast <- newValue
    return(elObjeto)
}

bubba <- NorthAmerican()
bubba$hasBreakfast                      # [1] TRUE
bubba <- setHasBreakfast(bubba,FALSE)
## [1] "Calling the base setHasBreakfast function"
## [1] "In setHasBreakfast.NorthAmerican and setting the value"
bubba$hasBreakfast                      # [1] FALSE
bubba <- setHasBreakfast(bubba,"No type checking sucker!")
## [1] "Calling the base setHasBreakfast function"
## [1] "In setHasBreakfast.NorthAmerican and setting the value"
bubba$hasBreakfast
## [1] "No type checking sucker!"

## if function not found:

someNumbers <- 1:4
someNumbers <- setHasBreakfast(someNumbers,"what?")
## [1] "Calling the base setHasBreakfast function"
## [1] "You screwed up. I do not know how to handle this object."
## someNumbers has not changed

## defining some accessors too:

getHasBreakfast <- function(elObjeto) {
    print("Calling the base getHasBreakfast function")
    UseMethod("getHasBreakfast",elObjeto)
    print("Note this is not executed!")
}

getHasBreakfast.default <- function(elObjeto) {
    print("You screwed up. I do not know how to handle this object.")
    return(NULL)
}


getHasBreakfast.NorthAmerican <- function(elObjeto) {
    print("In getHasBreakfast.NorthAmerican and returning the value")
    return(elObjeto$hasBreakfast)
}

bubba <- NorthAmerican()
bubba <- setHasBreakfast(bubba,"No type checking sucker!")
## [1] "Calling the base setHasBreakfast function"
## [1] "In setHasBreakfast.NorthAmerican and setting the value"
result <- getHasBreakfast(bubba)
## [1] "Calling the base getHasBreakfast function"
## [1] "In getHasBreakfast.NorthAmerican and returning the value"
result
## [1] "No type checking sucker!"

## Local Environment Approach (Less readable)

NordAmericain <- function(eatsBreakfast=TRUE,myFavorite="cereal") {
      ## Get the environment for this
      ## instance of the function.
      thisEnv <- environment()

      hasBreakfast <- eatsBreakfast
      favoriteBreakfast <- myFavorite

      ## Create the list used to represent an
      ## object for this class
      me <- list(
        ## Define the environment where this list is defined so
        ## that I can refer to it later.
          thisEnv = thisEnv,

        ## The Methods for this class normally go here but are discussed
        ## below. A simple placeholder is here to give you a teaser....
          getEnv = function() {
              return(get("thisEnv",thisEnv))
          }
      )

      ## Define the value of the list within the current environment.
      assign('this',me,envir=thisEnv)

      ## Set the name for the class
      class(me) <- append(class(me),"NordAmericain")
      return(me)
}

bubba <- NordAmericain()
bubba
## $thisEnv
## <environment: 0x3547f58>

## $getEnv
## function () 
## {
##     return(get("thisEnv", thisEnv))
## }
## <environment: 0x3547f58>

## attr(,"class")
## [1] "list"          "NordAmericain"

get("hasBreakfast",bubba$getEnv())      # T
get("favoriteBreakfast",bubba$getEnv()) # cereal

## simple copy will only copy reference, not the object:
bubba <- NordAmericain(myFavorite="oatmeal")
get("favoriteBreakfast",bubba$getEnv()) # [1] "oatmeal"
louise <- bubba
assign("favoriteBreakfast","toast",louise$getEnv())
get("favoriteBreakfast",louise$getEnv()) # [1] "toast"
get("favoriteBreakfast",bubba$getEnv())  # [1] "toast"
## copy method is needed to make perform deep copy

## supplementing the above with mutator and accessor methods:

NordAmericain <- function(eatsBreakfast=TRUE,myFavorite="cereal") {

    ## Get the environment for this
    ## instance of the function.
    thisEnv <- environment()

    hasBreakfast <- eatsBreakfast
    favoriteBreakfast <- myFavorite

    ## Create the list used to represent an
    ## object for this class
    me <- list(
        ## Define the environment where this list is defined so
        ## that I can refer to it later.
        thisEnv = thisEnv,

        ## Define the accessors for the data fields.
        getEnv = function() {
            return(get("thisEnv",thisEnv))
        },

        getHasBreakfast = function() {
            return(get("hasBreakfast",thisEnv))
        },

        setHasBreakfast = function(value) {
            return(assign("hasBreakfast",value,thisEnv))
        },


        getFavoriteBreakfast = function() {
            return(get("favoriteBreakfast",thisEnv))
        },

        setFavoriteBreakfast = function(value) {
            return(assign("favoriteBreakfast",value,thisEnv))
        }

    )

    ## Define the value of the list within the current environment.
    assign('this',me,envir=thisEnv)

    ## Set the name for the class
    class(me) <- append(class(me),"NordAmericain")
    return(me)
}

## access is more straightforward:
bubba <- NordAmericain(myFavorite="oatmeal")
bubba$getFavoriteBreakfast()            # [1] "oatmeal"
bubba$setFavoriteBreakfast("plain toast")
bubba$getFavoriteBreakfast()            # [1] "plain toast"

## taking care of deep copy:

makeCopy <- function(elObjeto) {
                print("Calling the base makeCopy function")
                UseMethod("makeCopy",elObjeto)
                print("Note this is not executed!")
}

makeCopy.default <- function(elObjeto) {
                print("You screwed up. I do not know how to handle this object.")
                return(elObjeto)
}


makeCopy.NordAmericain <- function(elObjeto) {
                print("In makeCopy.NordAmericain and making a copy")
                newObject <- NordAmericain(
                        eatsBreakfast=elObjeto$getHasBreakfast(),
                        myFavorite=elObjeto$getFavoriteBreakfast())
                return(newObject)
}

bubba <- NordAmericain(eatsBreakfast=FALSE,myFavorite="oatmeal")
louise <- makeCopy(bubba)
## [1] "Calling the base makeCopy function"
## [1] "In makeCopy.NordAmericain and making a copy"
louise$getFavoriteBreakfast()           # [1] "oatmeal"
louise$setFavoriteBreakfast("eggs")
louise$getFavoriteBreakfast()           # [1] "eggs"
bubba$getFavoriteBreakfast()            # [1] "oatmeal"

## Inheritance:

Mexican <- function(eatsBreakfast=TRUE,myFavorite="los huevos") {

        me <- NorthAmerican(eatsBreakfast,myFavorite)

        ## Add the name for the class
        class(me) <- append(class(me),"Mexican")
        return(me)
}


USAsian <- function(eatsBreakfast=TRUE,myFavorite="pork belly") {

        me <- NorthAmerican(eatsBreakfast,myFavorite)

        ## Add the name for the class
        class(me) <- append(class(me),"USAsian")
        return(me)
}

Canadian <- function(eatsBreakfast=TRUE,myFavorite="back bacon") {

        me <- NorthAmerican(eatsBreakfast,myFavorite)

        ## Add the name for the class
        class(me) <- append(class(me),"Canadian")
        return(me)
}

Anglophone <- function(eatsBreakfast=TRUE,myFavorite="pancakes") {

        me <- Canadian(eatsBreakfast,myFavorite)

        ## Add the name for the class
        class(me) <- append(class(me),"Anglophone")
        return(me)
}

Francophone <- function(eatsBreakfast=TRUE,myFavorite="crepes") {

        me <- Canadian(eatsBreakfast,myFavorite)

        ## Add the name for the class
        class(me) <- append(class(me),"Francophone")
        return(me)
}

francois <- Francophone()
francois
## $hasBreakfast
## [1] TRUE

## $favoriteBreakfast
## [1] "crepes"

## attr(,"class")
## [1] "list"          "NorthAmerican" "Canadian"      "Francophone"

## redefining some methods:

makeBreakfast <- function(theObject) {
    print("Calling the base makeBreakfast function")
    UseMethod("makeBreakfast",theObject)
}

makeBreakfast.default <- function(theObject) {
    print(noquote(paste("Well, this is awkward. Just make",
                        getFavoriteBreakfast(theObject))))
    return(theObject)
}

makeBreakfast.Mexican <- function(theObject) {
    print(noquote(paste("Estoy cocinando",
                        getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast",theObject)
    return(theObject)
}

makeBreakfast.USAsian <- function(theObject) {
    print(noquote(paste("Leave me alone I am making",
                        getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast",theObject)
    return(theObject)
}

makeBreakfast.Canadian <- function(theObject) {
    print(noquote(paste("Good morning, how would you like",
                        getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast",theObject)
    return(theObject)
}

makeBreakfast.Anglophone <- function(theObject) {
    print(noquote(paste("I hope it is okay that I am making",
                        getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast",theObject)
    return(theObject)
}

makeBreakfast.Francophone <- function(theObject) {
    print(noquote(paste("Je cuisine",
                        getFavoriteBreakfast(theObject))))
    NextMethod("makeBreakfast",theObject)
    return(theObject)
}

francois <- Francophone()
francois <- makeBreakfast(francois)

## should be:
## [1] "Calling the base makeBreakfast function"
## [1] Good morning, how would you like crepes
## [1] Je cuisine crepes
## [1] Well, this is awkward. Just make crepes

## but instead:
## [1] "Calling the base makeBreakfast function"
## Error in paste("Good morning, how would you like", getFavoriteBreakfast(theObject)) (from tutorial16_S3Classes.r!4391mpS#2) : 
##   could not find function "getFavoriteBreakfast"
