require 'spec_helper'

describe 'validates_nested_uniqueness' do
  
  class ParentObject < ActiveRecord::Base
    has_many :children
  end
  
  class Child < ActiveRecord::Base
    belongs_to :parent
    validates :name, :nested_uniqueness => {  :scope => :parent_object, 
                                              :association => :children,
                                              :message => 'duplicates!' }
  end
  
  it 'does not add errors to unique records' do
    parent = ParentObject.new
    ['kyle', 'jamie'].each { |name| parent.children.build( :name => name ) }
    2.times { |n| parent.children[n].should be_valid }
  end
  
  it 'adds errors to records that are not unique' do
    parent = ParentObject.new
    2.times { parent.children.build(:name => 'kyle') }
    parent.children.each { |c| c.should be_invalid }
  end
  
  it 'does not add errors if there is no parent' do
    orphans = 2.times.collect { Child.new(:name => 'kyle') }
    orphans.each { |o| o.should be_valid }
  end
  
  it 'honors custom messages' do
    parent = ParentObject.new
    2.times { parent.children.build(:name => 'kyle') }
    parent.children[0].should be_invalid
    parent.children[0].errors[:name].should include('duplicates!')
  end
  
end
