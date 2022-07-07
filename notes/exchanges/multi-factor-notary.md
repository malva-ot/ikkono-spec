Ahmed  is A
Bank   is B
Notary is N
 
B is only fiduciary for A.
Compromise of A hurts A alone.
 
Scenario 0: Open account

1. A requests account
A -> B : I want to open an account
B -> A : Prove a notarized key

2. A notarizes AK1 with NK1
A -> N : Please confirm that you have recognized AK1
N -> A : How ELSE do you want to prove?
A -> N : Text me at XXXXXXXX
N -> A : (sends text to verify)
A -> N : Code
N -> A : Here is proof via NK1 that I saw AK1 associated to A, and will require a text message to XXXXXX to validate

3. A opens an account
A -> B : Please open an account per cert NA1, which requires N to vouch that AK1 is still good, as verified by text message to XXXXXX
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

2. Attacker X attempts to withdraw money
X -> B : Gimme the money
B -> X : Prove yourself per NA1
X -> N : Gimme a ticket per NA1
N -> X : Prove you are A
X -> N : Proof of AK1
N -> X : Ok, prove you have phone # XXXXXXXXX
X -> N : Ummm.........
N -> *A* : Did you just try to authenticate??
A -> N : Nope
N -> A : Revoking AK1 now

*Result*: X is stopped unless they *also* have access to phone
