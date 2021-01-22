class Age < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '60歳未満' },
    { id: 3, name: '60歳以上65歳未満'},
    { id: 4, name: '65歳以上'}
  ]

  include ActiveHash::Associations
  has_many :conditions
  
end
