# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# percent_q_string is used in a tip below
percent_q_string = %Q(It's possible to create a String on multiple lines using %Q( ... ).

By defining the String in %Q, a String can span several lines.

This is just basic "newline" markers and won't convert to new lines in HTML, which needs the use
of <br /> or more appropriate markup.)


florian = User.create!(email: 'florian@extensionschool.ch', name: 'Florian')
sara    = User.create!(email: 'sara@extensionschool.ch',    name: 'Sara')
linda   = User.create!(email: 'linda@extensionschool.ch',   name: 'Linda')

tip1 = Tip.create!(title: 'Use #name on a class in Ruby',
                   body:  'Using Class.name returns a String representing the name of a class!  E.g. Integer.name returns "Integer" and ApplicationController.name returns "ApplicationController"',
                   user:  florian)
tip2 = Tip.create!(title: 'Getting a substring in Ruby',
                   body: 'Use String#[start,length] to return the substring of a String, e.g. "Hello, world"[7,5] => "world"',
                   user:  florian)
Tip.create!(title: 'Going backwards in an Array',
            body:  "It's possible to use negative numbers as backwards indexes in Arrays e.g. [1,2,3,4][-1] => 4",
            user:  florian)

Tip.create!(title: 'Using ERB in CSS and Sass files',
            body:  "Did you know that you can define CSS assets as ERB files, just like .html.erb and .js.erb views?  By using .scss.erb as the extension of a file, the asset pipeline will first process the file as ERB and evaluate Ruby expressions.  Then it will treat the file as Sass and compile it to CSS!",
            user:  sara)
Tip.create!(title: 'Substitute a value in a String',
            body:  "String#gsub can be used to replace any substring with another substring in a String, e.g. 'Learn about :language'.gsub(':language', 'JavaScript') => \"Learn about JavaScript\"",
            user:  sara)
Tip.create!(title: 'Multi-line Strings using %Q',
            body:  percent_q_string,
            user:  sara)
Tip.create!(title: 'Using underscores in numbers',
            body:  "It's pretty cool that underscores can be used to define numbers in Ruby, such as 16_453 or 12_345_678.  It can make big numbers much more readable!",
            user:  sara)
Tip.create!(title: 'Calculate a number to a power',
            body:  'Use ** to calculate the number to a particular power, e.g. 2**5 => 32', 
            user: sara)

Tip.create!(title: 'Using rails:secret',
            body:  'Use rails:secret to generate a long secret key for any purpose, not just for a value to use as SECRET_KEY_BASE.',
            user:  linda)
Tip.create!(title: 'Try using grep with log files',
            body:  'grep is a terminal program that can be used to search log files for a particular pattern.  It takes a search term as a regular expression and is therefore very powerful.  Learning about regular expressions is very useful for other tasks as well; they are often used in Rails model validations, route definitions and in JavaScript',
            user:  linda)
Tip.create!(title: 'Organize CSS rules in Sass files well',
            body:  "It's worth taking the time to organize CSS rules in various Sass files, keeping related rules together.  It helps someone new to a project know where to look for particular rules.",
            user:  linda)
Tip.create!(title: 'Just experiment!',
            body:  "The great thing about writing software is that it's easy to try things out and change them before submitting it for a production deployment.  I've found that taking a break and coming back to a difficult programming problem really helps too.",
            user:  linda)

Comment.create!(body: "This is a good tip.", 
                user: sara, 
                tip: tip1)
Comment.create!(body: "Yes thank you!", 
                user: linda, 
                tip: tip1)
Comment.create!(body: "This is a good tip.", 
                user: sara, 
                tip: tip2)
Comment.create!(body: "Yes thank you!", 
                user: linda, 
                tip: tip2)