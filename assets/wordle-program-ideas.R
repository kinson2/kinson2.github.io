# The `letters` is a built-in character vector of
## length 26 such that each element is a letter 
### of the alphabet. 
#letters
# Words may be found in the package called "words", 
## containing the data frame named `words`.
words_data <- words::words
five_letter_words <- words_data[words_data$word_length == 5, 1]
target <- five_letter_words[sample(length(five_letter_words))][1]
target_letters <- strsplit(target, "")
target_letters_positions <- 
  c(which(letters %in% target_letters[[1]][1]),
    which(letters %in% target_letters[[1]][2]),
    which(letters %in% target_letters[[1]][3]),
    which(letters %in% target_letters[[1]][4]),
    which(letters %in% target_letters[[1]][5]))
wordle_hint <- function(){
  hint1 <- hint2 <- hint3 <- NULL
  if(any(table(target_letters[[1]])>1)) hint1 <- "contains repeating letters."
  if(sum(target_letters[[1]]%in%c("a","e","i","o","u"))>2) hint2 <- "contains more vowels than consonants."
  if(sum(target_letters[[1]]%in%c("a","e","i","o","u"))<=2) hint3 <- "contains more consonants than vowels."
  hint0 <- paste(hint1, hint2, hint3)
  return(hint0)
}
wordle1 <- function(input_word){
  input_letters <- strsplit(input_word, "")
  input_letters_positions <- 
  c(which(letters %in% input_letters[[1]][1]),
    which(letters %in% input_letters[[1]][2]),
    which(letters %in% input_letters[[1]][3]),
    which(letters %in% input_letters[[1]][4]),
    which(letters %in% input_letters[[1]][5]))
  attempt0 <- "This is your first attempt."
  if(!input_word %in% words_data$word){
    response0 <- "must be a real word!"
    correct_letters0 <- NA_character_
    correct_positions0 <- NA_real_
  } else
  if(nchar(input_word)!=5){
    response0 <- "must be five letters in length!"
    correct_letters0 <- NA_character_
    correct_positions0 <- NA_real_
  } else
  if(!any(input_letters_positions%in%target_letters_positions)){
    response0 <- "wrong!"
    correct_letters0 <- NA_character_
    correct_positions0 <- NA_real_
    grey_letters0 <- unlist(input_letters)
    } else
  if(any(input_letters_positions%in%target_letters_positions)){
    response0 <- "close!"
    correct_letters0 <- paste(input_letters[[1]][input_letters_positions%in%target_letters_positions], collapse = " ")
    correct_positions0 <- (1:5)[input_letters[[1]]==target_letters[[1]]]
    grey_letters0 <- paste(input_letters[[1]][!input_letters_positions%in%target_letters_positions], collapse = " ")
  } else
  if(all(input_letters_positions%in%target_letters_positions)){
    response0 <- "Genius!"
    correct_letters0 <- paste(input_letters[[1]], collapse = " ")
    correct_positions0 <- (1:5)[input_letters[[1]]==target_letters[[1]]]
    grey_letters0 <- NA_character_
  }
  list(attempt = attempt0, response = response0, correct_letters = correct_letters0, correct_positions = correct_positions0, grey_letters = grey_letters0)
}
wordle01 <- wordle1("irate")
wordle2 <- function(input_word){
  input_letters <- strsplit(input_word, "")
  input_letters_positions <- 
  c(which(letters %in% input_letters[[1]][1]),
    which(letters %in% input_letters[[1]][2]),
    which(letters %in% input_letters[[1]][3]),
    which(letters %in% input_letters[[1]][4]),
    which(letters %in% input_letters[[1]][5]))
   attempt0 <- "This is your second attempt."
  if(!input_word %in% words_data$word){
    response0 <- "must be a real word!"
    correct_letters0 <- NA_character_
    correct_positions0 <- NA_real_
  } else
  if(nchar(input_word)!=5){
    response0 <- "must be five letters in length!"
    correct_letters0 <- NA_character_
    correct_positions0 <- NA_real_
  } else
  if(!any(input_letters_positions%in%target_letters_positions)){
    response0 <- "wrong!"
    correct_letters0 <- NA_character_
    correct_positions0 <- NA_real_
    grey_letters0 <- paste(unlist(input_letters), wordel01$grey_letters)
    } else
  if(any(input_letters_positions%in%target_letters_positions)){
    response0 <- "close!"
    correct_letters0 <- paste(input_letters[[1]][input_letters_positions%in%target_letters_positions], collapse = " ")
    correct_positions0 <- ifelse(length((1:5)[input_letters[[1]]==target_letters[[1]]])==0, NA_real_, (1:5)[input_letters[[1]]==target_letters[[1]]])
    grey_letters0 <- paste(paste(input_letters[[1]][!input_letters_positions%in%target_letters_positions], collapse = " "), wordel01$grey_letters)
  } else
  if(all(input_letters_positions%in%target_letters_positions)){
    response0 <- "Magnificent!"
    correct_letters0 <- paste(input_letters[[1]], collapse = " ")
    correct_npositions0 <- ifelse(length((1:5)[input_letters[[1]]==target_letters[[1]]])==0, NA_real_, (1:5)[input_letters[[1]]==target_letters[[1]]])
    grey_letters0 <- NA_character_
  }
  list(response = response0, correct_letters = correct_letters0, correct_positions = correct_positions0, grey_letters = grey_letters0)
}


wordle1("irate")
wordle01
wordle2("sicky")
prob031 <- wordle1("magician")
prob032 <- wordle2("magic")
prob031
target
prob032

#attempt number as output. if last attempt, and 
##input_word is not equal to target, then show
###target. Must keep target unchanged until 
####last attempt used.

#add vector of letters that are not eligible
##to be used.

#wordle function that takes 4 starter words
##as input. Then returns whether the input_word
###is correct, position, letters, responses, etc.