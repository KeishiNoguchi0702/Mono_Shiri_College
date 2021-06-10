class Position < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '学生' },
    { id: 2, name: '教授' },
    { id: 3, name: '事務' }
  ]

  include ActiveHash::Associations
  has_many :users

end
