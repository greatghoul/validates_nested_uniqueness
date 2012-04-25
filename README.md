# ValidatesUniqueChildren
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

    gem 'validates_unique_children'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install validates_unique_children

## Usage

To extend on the example above, we would rewrite the Company class as follows:
```ruby
class Company
  has_many :employees
  # Pass an array of attributes that make up a unique object:
  validates :employees, :unique_children => [:ssn, :name]
end
```


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
