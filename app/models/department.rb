class Department < ActiveHash::Base
  self.data = [
    { id: 0, name: '--' },
    { id: 1, name: '法学部・法律学科' },
    { id: 2, name: '商学部・商学科' },
    { id: 3, name: '政治経済学部・政治学科' },
    { id: 4, name: '政治経済学部・経済学科' },
    { id: 5, name: '文学部・国文学科' },
    { id: 6, name: '文学部・哲学科' },
    { id: 7, name: '文学部・史学科' },
    { id: 8, name: '文学部・英文学科' },
    { id: 9, name: '文学部・心理学科' },
    { id: 10, name: '社会学部・社会学科' },
    { id: 11, name: '社会学部・現代文化学科' },
    { id: 12, name: '社会学部・社会心理学科' },
    { id: 13, name: '社会学部・社会福祉学科' },
    { id: 14, name: '経営学部・経営学科' },
    { id: 15, name: '経営学部・マーケティング学科' },
    { id: 16, name: '経営学部・会計学科' },
    { id: 17, name: '経営学部・公共経営学科' },
    { id: 18, name: '経営学部・市場戦略学科' },
    { id: 19, name: '情報学部・情報システム学科' },
    { id: 20, name: '情報学部・情報社会学科' },
    { id: 21, name: '情報学部・メディア情報学科' },
    { id: 22, name: '理工学部・情報システム工学科' },
    { id: 23, name: '理工学部・情報メディア学科' },
    { id: 24, name: '理工学部・ロボット工学科' }
  ]

  include ActiveHash::Associations
  has_many :users
end
