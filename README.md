# FizzBuzz Client
Console utility to consume the FizzBuzz API.

  * Install dependencies with `bundle install`
  * Run the tests with`bundle exec rspec`
  * To see the list of available commands `./cli`
  
#Commands

Available commands: 

```
  cli console         # Runs the console with Pry
  cli favourite       # Allows to store your favourite number on the collection, requires a number
  cli fizz_buzz_for   # It returns the fizzbuzz value for a number. Requires a number
  cli numbers         # List of numbers and their fizzbuzz value. By default this list has 100 items. Another number of items can be passed as an argument
  cli rubocop         # Runs rubocop
  cli test            # Runs the tests all the application
```

Example:

```
> bundle exec ./cli fizz_buzz_for 10

10 is Buzz
```

#Configuration

You can configure the application to point to the server running in another location modifying the file 'application.yml'
on the config folder.

Example of configuration:

```yaml
fizz_buzz_server:
  url: http://localhost:4000
```
