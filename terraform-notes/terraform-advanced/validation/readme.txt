here in this project we are using the validation and also condition statement.

variable "Environment" {
    type = string

    default = "test"
    description = "Environment variable"
    validation {
      condition = contains (["prod" , "test"],var.Environment)
      error_message = "enter the correct environment"
    }
  
}

we use this validation in the variable block.
we used the condition statement in which it is mentioned as if the environment mentioned is not prod or test 
we will be using the default environment