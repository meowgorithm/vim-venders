syn match coffeeDollarVariable "\$"
syn match coffeeOperator "\v[?+!*%]{1}"
syn match coffeePunctutation "\v[{}\[\]()]"
<<<<<<< HEAD
syn match coffeeBuiltinFunction /\<\%(parseInt\|setInterval\|clearInterval\|setTimeout\|clearTimeout\)\>/ display
syn match coffeeSpecialVariable /\<\%(window\|document\|console\)\>/ display
=======
syn match coffeeBuiltinFunction /\<\%(parseInt\|setInterval\|setTimeout\)\>/ display
syn match coffeeSpecialVariable /\<\%(window\|document\|console\|alert\)\>/ display
>>>>>>> 6645c7ae2e8bbc63538d6ccf88ea288734c38cb7
