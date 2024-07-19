// OBJECTS

// BAR
CREATE (MorningBr:Bar {name:'Rapture Morning', wifi:false})
CREATE (AfternoonBr:Bar {name:'Rapture Afternoon', wifi:true})
CREATE (EveningBr:Bar {name:'Rapture Evening', wifi:true})

// MENU
CREATE (FirstMn:Menu {})
CREATE (SecondMn:Menu {})
CREATE (ThirdMn:Menu {})

// DRINK
CREATE (ManhattanDr:Drink {name:'Manhattan', percentage:33})
CREATE (OldFashionedDr:Drink {name:'Old Fashioned', percentage:40})
CREATE (VodkaMartiniDr:Drink {name:'Vodka Martini', percentage:38})
CREATE (BloodyMaryDr:Drink {name:'Bloody Mary', percentage:22})
CREATE (GinTonicDr:Drink {name:'Gin&Tonic', percentage:18})
CREATE (PrincessDr:Drink {name:'Princess', percentage:4})
CREATE (SangriaDr:Drink {name:'Sangria', percentage:8})

// TYPE
CREATE (LongTp:Type {name:'Long', volume:400})
CREATE (MiddleTp:Type {name:'Middle', volume:250})
CREATE (ShortTp:Type {name:'Short', volume:50})

// TERRACE
CREATE (FirstTr:Terrace {open:true, size:150})
CREATE (SecondTr:Terrace {open:true, size:100})
CREATE (ThirdTr:Terrace {open:false, size:50})

// ADDRESS
CREATE (FirstAd:Address {country:'Czech Republic', city:'Prague', street:'Manesova', houseNumber:64, postCode:'120 00'})
CREATE (SecondAd:Address {country:'Czech Republic', city:'Prague', street:'U Milosrdnych', houseNumber:851, postCode:'110 00'})
CREATE (ThirdAd:Address {country:'Czech Republic', city:'Prague', street:'V Kolkovne', houseNumber:920, postCode:'110 00'})

// EMPLOYEE
CREATE (JackEm:Employee {givenName:'Jack', familyName:'Delfino', phone:'+420 123 978 541', age:27, wage:150, title:"waiter"})
CREATE (FrankEm:Employee {givenName:'Frank', familyName:'Millstone', age:33, wage:350, title:"manager"})
CREATE (AsherEm:Employee {givenName:'Asher', familyName:'Pratt', phone:['+420 125 423 111', '+420 587 231 548'], age:26, wage:200, title:"bartender"})
CREATE (MichaelaEm:Employee {givenName:'Michaela', familyName:'Humpton', phone:'+420 875 222 365', age:24, wage:150, title:"hostess"})
CREATE (OliverEm:Employee {givenName:'Oliver', familyName:'Keating', phone:'+420 874 125 896', age:23, wage:170, title:"cleaner"})

// CLIENT
CREATE (AnnaliseCl:Client {givenName:'Annalise', familyName:'Keating', phone:'+420 785 469 854', age:43})
CREATE (LaurelCl:Client {givenName:'Laurel', familyName:'Castillo', phone:'+420 985 632 147', age:25})
CREATE (ConnorCl:Client {givenName:'Connor', familyName:'Walsh', phone:'+420 874 589 652', age:26})
CREATE (WesCl:Client {givenName:'Wes', familyName:'Gibbins', phone:'+420 876 325 896', age:20})
CREATE (RebeccaCl:Client {givenName:'Rebecca', familyName:'Sutter', phone:'+420 245 896 574', age:18})

// RELATIONS

// DRINK - TYPE
CREATE
    (ManhattanDr)-[:TYPED]->(LongTp),
    (OldFashionedDr)-[:TYPED]->(ShortTp),
    (VodkaMartiniDr)-[:TYPED]->(MiddleTp),
    (BloodyMaryDr)-[:TYPED]->(LongTp),
    (GinTonicDr)-[:TYPED]->(LongTp),
    (PrincessDr)-[:TYPED]->(ShortTp),
    (SangriaDr)-[:TYPED]->(MiddleTp)

// MENU - DRINK
CREATE
    (FirstMn)-[:CONTAINS]->(ManhattanDr),
    (FirstMn)-[:CONTAINS]->(OldFashionedDr),
    (SecondMn)-[:CONTAINS]->(VodkaMartiniDr),
    (SecondMn)-[:CONTAINS]->(BloodyMaryDr),
    (ThirdMn)-[:CONTAINS]->(GinTonicDr),
    (ThirdMn)-[:CONTAINS]->(PrincessDr),
    (ThirdMn)-[:CONTAINS]->(SangriaDr)

// BAR - ADDRESS, MENU, TERRACE
CREATE
    (MorningBr)-[:LOCATED {address: 'Manesova'}]->(FirstAd),
    (AfternoonBr)-[:LOCATED {address: 'U Milosrdnych'}]->(SecondAd),
    (EveningBr)-[:LOCATED {address: 'V Kolkovne'}]->(ThirdAd)

CREATE
    (MorningBr)-[:HAS]->(ThirdMn),
    (AfternoonBr)-[:HAS]->(SecondMn),
    (EveningBr)-[:HAS]->(FirstMn)

CREATE
    (MorningBr)-[:EQUIPED]->(ThirdTr),
    (AfternoonBr)-[:EQUIPED]->(FirstTr),
    (EveningBr)-[:EQUIPED]->(SecondTr)

// EMPLOYEE, CLIENT - BAR
CREATE
    (JackEm)-[:WORKS {position: 'waiter', shift: 'day'}]->(MorningBr),
    (FrankEm)-[:WORKS {position: 'manager', shift: 'day'}]->(AfternoonBr),
    (AsherEm)-[:WORKS {position: 'bartender', shift: 'day'}]->(EveningBr),
    (MichaelaEm)-[:WORKS {position: 'hostess', shift: 'night'}]->(MorningBr),
    (OliverEm)-[:WORKS {position: 'cleaner', shift: 'night'}]->(EveningBr)

CREATE
    (AnnaliseCl)-[:VISITS]->(MorningBr),
    (AnnaliseCl)-[:VISITS]->(AfternoonBr),
    (LaurelCl)-[:VISITS]->(MorningBr),
    (LaurelCl)-[:VISITS]->(AfternoonBr),
    (WesCl)-[:VISITS]->(MorningBr),
    (WesCl)-[:VISITS]->(AfternoonBr),
    (WesCl)-[:VISITS]->(EveningBr),
    (RebeccaCl)-[:VISITS]->(MorningBr)
    
