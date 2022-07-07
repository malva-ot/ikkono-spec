Ahmed  is A
Bank   is B
Notary is N
 
**PURPOSE**
A public notary will take greater care to protect their keys than a private user will


B is only fiduciary for A.
Compromise of A hurts A alone.
 
Scenario 0: Open account

1. A requests account
A -> B : I want to open an account
B -> A : Prove a notarized key

2. A notarizes AK1 with NK1
A -> N : Please confirm that you have recognized AK1
N -> A : Here is proof via NK1 that I saw AK1 associated to A

3. A opens an account
A -> B : Please open an account per cert NA1, which requires N to vouch that AK1 is still good
B -> A : OK

Scenario 1: Bank compromised

1. Attacker compromises bank, steals all money from A's account

2. A asks for money back
A -> B : Give me my money back!!
B -> A : No, you withdrew it!
A -> B : Prove it!
B -> A : Awwww...shoot. Here's your money back

*Result*: No loss to A

Scenario 2: AK1 is compromised

1. Attacker X steals AK1

2. Attacker X withdraws money
X -> B : Gimme the money
B -> X : Prove yourself per NA1
X -> N : Gimme a ticket per NA1
N -> X : Prove you are A
X -> N : Proof of AK1
N -> X : Ticket(NA1, AK1)
X -> B : Sign(Ticket(NA1, AK1), AK1)
B -> X : OK!

3. A wants money back
A -> B : Give me my money back!
B -> A : No, you withdrew it!
A -> B : Prove it!
B -> A : Here is the transaction receipt with token authorized by both N(NK1) and AK1 per NA1
A -> N : Why did you authorize that transaction??
N -> A : Because you asked me to
A -> B : Prove it!
N -> A : Here is the request to authorize signed by AK1

*Result*: A has lost, since proof of self still depends on AK1 alone

