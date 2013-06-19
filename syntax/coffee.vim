syn match coffeeDollarVariable "\$"
syn match coffeeOperator "\v[?+!*%]{1}"
syn match coffeePunctutation "\v[{}\[\]()]"
syn match coffeeBuiltinFunction /\<\%(parseInt\|setInterval\|setTimeout\)\>/ display
syn match coffeeSpecialVariable /\<\%(window\|document\|console\|alert\)\>/ display
