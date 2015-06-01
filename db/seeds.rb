u1 = UserRegistered.create( name:'Jaime', nick:'Serra', password:'zizou', email:'jaime@gmail.com', rating: 0, city:'Zamora', age: 26, job:'student', languages_learnt:'English, Spanish', languages_without_learning:'Italian', hobbies:'football, music', photo:'FRY.png' )
u2 = UserRegistered.create( name:'Mateo', nick:'Matthew', password:'caminero', email:'mms14@gmail.com', rating: 0, city:'Salamanca', age: 27, job:'teacher', languages_learnt:'French, Spanish, Italian', languages_without_learning:'English', hobbies:'football', photo:'BENDER.png' )

p1 = Place.create( name:'Merendero Asturias', password:'abelardo', city:'Zamora', address:'Calle General Mola, 58', offers:'2x1 drinks until 23:00 p.m', opinions:'El mejor sitio en Zamora para mantener una charla y pasártelo bien' )

u1.meetings.create( address:'Calle General Mola, 58', language:'Italian', date: Date.today+1.week )