class Department < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '法学部・法律学科' },
    { id: 2, name: '商学部・商学科' },
    { id: 3, name: '政治経済学部・政治学科' },
    { id: 4, name: '政治経済学部・経済学科' },
    { id: 5, name: '政治経済学部・地域行政学科' }
  ]

  include ActiveHash::Associations
  has_many :users

end
