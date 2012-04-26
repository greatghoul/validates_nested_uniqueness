# validates_nested_uniqueness

This gem solves the problem of having a nested form that requires unique
children.  The built-in uniqueness validation in Rails performs an SQL
query to determine the uniqueness of an object.  So if you are working with
a new parent that has many new children, the uniqueness validation in Rails
will not validate properly.

The situation below, for example, will allow you to save a Company with two
duplicate employees.

```ruby
class Company
  has_many :employees
end

class Employee
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
  validates :ssn, :nested_uniqueness => { :klass => 'Company', :association => :employees }
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
