# validates_nested_uniqueness
Allows you to add a uniqueness constraint on an attribute so that when the model 
is on the other side of a has_many relationship the uniqueness will be respected 
(in nested circumstances).  Rails built-in uniqueness works by issuing an SQL 
query so in memory objects are not validated properly.

The situation below, for example, will allow you to save a Company with two
duplicate employees.

```ruby
class Company
  has_many :employees
end

class Employee
  # THIS IS THE RAILS WAY, SEE BELOW FOR USAGE OF THIS GEM.
  validates :ssn, :uniqueness => { :scope => :company }
end
```

## Installation

Add this line to your application's Gemfile:

    gem 'validates_nested_uniqueness'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_nested_uniqueness

## Usage

To enable proper validation of unique nested objects, we use nested_uniqueness:
```ruby
class Employee

  # It's probably best to leave the Rails uniqueness validation as this will
  # work properly when the Employee is being updated directly.
  validates :ssn, :uniqueness => { :scope => :company }

  # Here, we want the social security number to be unique per company,
  # so we validate the ssn, passing it options for which class is the parent
  # and which association on the parent is to be uniquely validated.
  validates :ssn, :nested_uniqueness => { :scope => :company, :association => :employees }
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
