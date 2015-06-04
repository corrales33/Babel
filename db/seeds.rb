u1 = User.create( name:'Jaime', nick:'Serra', password:'zizou', email:'jaime@gmail.com', rating: 0, city:'Zamora', age: 26, job:'student', languages_learnt:'English, Spanish', languages_without_learning:'Italian', hobbies:'football, music' )
u2 = User.create( name:'Mateo', nick:'Matthew', password:'caminero', email:'mms14@gmail.com', rating: 0, city:'Salamanca', age: 27, job:'teacher', languages_learnt:'French, Spanish, Italian', languages_without_learning:'English', hobbies:'football' )
u3 = User.create( name:'Sergio', nick:'Ser', password:'pipita', email:'ser@gmail.com', rating: 0, city:'Zamora', age: 32, job:'farmer', languages_learnt:'Italian', languages_without_learning:'Spanish', hobbies:'food' )
u4 = User.create( name:'Bea', nick:'Ociosa', password:'bilic', email:'beamm@gmail.com', rating: 0, city:'Gijón', age: 33, job:'baby-sitting', languages_learnt:'English, French', languages_without_learning:'Portuguese', hobbies:'cooking, music' )
u5 = User.create( name:'Valentín', nick:'Valen', password:'maderal', email:'elmaderal@gmail.com', rating: 0, city:'Zamora', age: 58, job:'mechanic', languages_learnt:'Spanish', languages_without_learning:'French, English', hobbies:'field, swim' )

p1 = Place.create( name:'Merendero Asturias', password:'abelardo', city:'Zamora', address:'Calle General Mola, 58', offers:'2x1 drinks until 23:00 p.m', opinions:'El mejor sitio en Zamora para mantener una charla y pasártelo bien' )

u1.meetings.create( participant:'Mateo', address:'Calle General Mola, 58', language:'Italian', date: Date.today+1.week )