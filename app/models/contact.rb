class Contact < ApplicationRecord

enum type: { request: 0, forget: 1, login: 2, browsing: 3, production: 4, search: 5, nice: 6, trouble: 7, violation: 8, other: 9 }

end
