syn match coffeeDollarVariable "\$"
syn match coffeeOperator "\v[?+!*%]{1}"
syn match coffeePunctutation "\v[{}\[\]()]"
syn match coffeeBuiltinFunction /\<\%(parseInt\|setInterval\|clearInterval\|setTimeout\|clearTimeout\)\>/ display
syn match coffeeSpecialVariable /\<\%(window\|document\|console\)\>/ display
