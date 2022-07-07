A is Ahmed
B is Bank

D is server

F is Ficus notary
M is Malva notary

K is key fiduciary --> This is the same thing as an identity host.


K FIDUCIARY --> Holds actual private keys
K PROXY     --> Just routes requests to user, who keeps keys on own device.


B DELEGATES to server the tasks of proving and synchronization.
Ahmed does not need to trust server. 

A -> B:
  Hi, I'm Ahmed. I'd like to open an account. Any actions taken by my account
  should be authenticated by:
    - My key AK1
    - AND ( either F via path from FMKRoot1
                or M via path from MFKRoot1 )

A -> F:
  Hi, I'm Ahmed. I'd like you to notarize warrants for my key K1, by vouching
  for my identity with your signing key rooted at FMKRoot1. You can validate
  it is me by a phone #. Warrant request must be signed with K1.

  You can ask K to sign stuff for me.

A -> K:
  Hi, I'm Ahmed. I'd like you to keep my private keys safe for me and sign
  stuff as me. You can validate it's me via password. I an *recover* my password via email.

  Accept signing requests from F and M. 

Secretly compromised

1. F alone is secretly compromised. 
   F cannot produce warrants without AK1, held by K. K won't sign them unless A assents with password and phone #. 

2. K alone is secretly compromised, bypassing multifactor protection of key AK1. 
   K initiates signing request without A's consent. F independently requests A's assent via phone #. 

3. D alone is secretly compromised. D can just tell B what to do, BUT B will not
   be liable for mistakes because it won't be able to prove A's authorization.

It is only possible to make transactions with possession of 
  phone number and password, if keys held by K. 
  key and phone number, if keys held personally.


Publicly compromised -- revocation

1. A discovers that their password and/or key is compromised (compromise of credentials or values stored by K). A resets password using email. A tells K to stop signing with AK1, and gets receipt to prove it. A can either upload / generate new AK2 and password with K, or move to a different key host.






Purpose of notary is NOT proof of who the notary is. Ahmed can make up
his own notary. Notaries provide separation of duties which protect Ahmed.

BANK, to preserve liability, may require notaries that *they* trust, so that bank doesn't have people bugging bank about ppl's money getting stolen since ppl were bad at managing ppl's keys / password.