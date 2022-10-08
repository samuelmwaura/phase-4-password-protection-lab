class User < ApplicationRecord
    has_secure_password #This is a macro(a generator for other code.) built in rails that enables the use of  Bcrypt to hash passwords before saving them and compare them during logging in
    #It calls a before_save method internally before that compares a passed in password and a password confirm
    #It also generates an ibuilt method called authenticate that helps compare a passin password and that in db
    #Generally it is the one that makes our passwords secure
    #It facilitates using of the Bcrypt functionality to produces secure passwords
    #By using password_digest in our user  dbtable, it helps trigger authenticate, password and password_confirm instance methods in our users model
end
