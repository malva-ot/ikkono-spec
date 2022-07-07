Ahmed  is A
Bank   is B

B is only fiduciary for A.
Compromise of A hurts A alone.
 
Scenario 0: Open account

1. A opens an account with key AK1
A -> B : I want to open an account : A1(AK1)
B -> A : You now have account secured by AK1. 

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
X(AK1) -> B : Give me all the money
B -> X(AK1) : OK!

3. A asks for money back
A -> B : Give me my money back!!
B -> A : No, you withdrew it!
A -> B : Prove it!
B -> A : Here is the withdrawal signed by AK1

*Result*: A has lost, since proof of self depends on AK1 alone
