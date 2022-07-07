# Identity hosting

### **Q: Why would users care where their identities are hosted**

*It's hardly any data at all*

**A: That tiny kernel of data -- really just the XID -- is what all passports get attached to.**

If you can't prove you own the XID, you can't use the passport. In practice most users will not be able to prove XID ownership without the help of a service, so access to an identity host service is essential. If a user can't move their identity to another service, then the identity host can charge a large amount or otherwise abuse their position. 
 
### **Q: How do users prove via a third-party service that they own the XID?**

**A: They use a public / private key pair**

Why?

**Thought experiment one: Just say so**

The University of Michigan wants to grant student passports. Passports must be granted *to* an identity. Student Antje says, "Ok, my XID is [X]". UM grants passport to [X]. 

XIDs are not secret. Many people can and will find out Antje's XID. Someone else just says *they* use XID [X]. Now they can use Antje's passport.

*Conclusion:* identities must support their own verifiable claim of ownership.

**Thought experiment two: Password**

Now Antje has a XID *and* a password. Who does she give the password to? How does she prove she knows the password?

She must tell the password to each service that will verify it, OR have a client application that can calculate a bcrypt hash given a salt. 

There is nothing that separate services can do to prove *to each other* that Antje authorized them to verify her password, short of the services actually storing the password in a retrievable form, which goes against all password security practices

**Thought experiment three: Public / private key pair**

Antje has an XID, a public key and a private key. Antje can authorize any service to vouch for her identity by creating a cryptographically signed warrant. The authorized service can prove to any other service that Antje did in fact authorize the service to vouch for her identity.

**THE PRIVATE KEY IS THE IDENTITY**. Anyone in possession of the private key has possession of the identity.

How to support key rotation?
  -- See key rotation, OCSP stapling

Thumbprint - SHA1 Hash of XID + public key

```
subject:330ie0930ewlkfjds09sdlkj
publickey:
```






mapapp: Prove you're XID1 + PUBK2
User: Here, and PUBK2 expired 10 years ago
mapapp: 




CAs provide protection for the owner against fake chain of custody proofs using old compromised keys.




server   : Prove you're XID1 + CERT_HASH(PUBK2)
Attacker : Proves with compromised PRVK2, but that includes point that CERT2 is expired
server   : Give me a chain of custody to a current CERT_HASH(PUBK)
Attacker : Can make one up...





Identity Cert should
- Include an expiration
- Be signed by a separate notary (doesn't even need to be super trusted. Just ANYONE else)
- For safety, should be signed by two independent notaries
- Can also provide private notary (another human)

What happens when notary is compromised? 
- Compromising the notary alone is insufficient; would need to compromise both a notary AND the owner's own priv k to make the cross-signed successor cert


server  : Upon proof of successor cert, ikkono service should replace old CERT_HASH(PUBK) with new one. 


ikkono wallet:
- Chain of personal certs





server will:
- Prohibit identity certs without multiple independent notaries

Mallowfields will issue two independent CAs, must be managed separately through cert fiduciary.

