class Category < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '介護付き有料老人ホーム'},
    { id: 3, name: '住宅型有料老人ホーム'},
    { id: 4, name: 'サービス付き高齢者向け住宅'},
    { id: 5, name: 'グループホーム'},
    { id: 6, name: 'ケアハウス'},
    { id: 7, name: '特別養護老人ホーム'},
    { id: 8, name: '介護老人保健施設'},
    { id: 9, name: '介護療養型医療施設'}
  ]

  include ActiveHash::Associations
  has_many :conditions
  
end
