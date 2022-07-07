# ikkono

Summary of thought as of 2021-06-24

# Signed agreements

ikkono embodies an ontology and abstract protocol whose purpose is to record **signed statements and agreements** by or between **parties**.



# Primitives

There are four primitives in the ikkono ontology:

- key
- document
- actor
- authority

Every **document** is signed by an **actor** or **authority** using one of their **key**s. The existence of an **actor** or **authority** is in turn established solely by issuing a **document** which contains at least one **public key** and which is signed with the corresponding **private key**.

## key

An asymmetric key pair suitable for use in cryptographic signing

## document

A signed statement by an actor or authority

## Parties

All documents are issued and signed by one or more parties. ikkono divides parties into two distinct groups: **actors** and **authorities**.

- Actors represent uniquely identifiable agents which can **act**.
- Authorities represent legal entities which can **own**.

Both are sovereign: self-initiated, self-owned and self-controlled.

With only one exception, only actors can act. With no exceptions, only authorities can own.

### Then how do authorities act?

*By designating one or more actors as their agent(s)*

In ikkono, any action or statement is materialized in a **document**. Authorities can issue exactly three kinds of documents:

- **Establishment warrants** to declare themselves
- **Attribution warrants** for time-limited authentication
- **Assignment warrants** to assign agency to one or more actors

All further actions are taken by the actors designated as agents. When agents are acting on behalf of an authority, they explicitly say so and provide a reference to the applicable warrant of agency.

### And how do people own things?

*By establishing one ore more estates*

The construction of both actors and authorities in ikkono is by fiat. Any actual human or automated actor can declare an authority and, with possession of both their own and the authority's keys, issue documents to assign themselves as the sole agent of the authority, and then provide themselves with a passport to act relative to that authority.

Authorities intentionally declared in this way are called **estates**. To enable personal actions outside the scope of an institutional authority, most humans are expected to establish one or more estates, households, or other personal authorities.

# Documents

## Warrant

A **warrant** is a signed **statement about identity**, including
- Self-identification (establishment, attribution)
- Unilateral or mutual recognition
- Assignment of agency, possibly constrained
- Authoritative identification, i.e. the provisioning of an identifier on behalf of an authority

An **open warrant** is a warrant that has been signed by one party but which still requires consent from at least one other party. An x.509 CSR (certificate signing request) is analogous to an open warrant.

### Establishment warrant

A self-signed document which establishes the existence of an **actor** or **authority**, along with a declaration of the one or more public keys by which they will prove themselves. In practice, establishment warrants should only be used to provide shorter-lived attribution warrants.

Establishment warrants are "trust roots" in that they are self-signed, but they may contain references to or copies of warrants from other entities, such as to justify use of a particular identifier. ("Michigan said this is my driver's license #.").

### Attribution warrant

A self-issued document by an actor that identifies a secondary key, references another attribution or establishment warrant issued by the same actor, and is signed by both the secondary key and the key of the referenced warrant.

### Assignment warrant

Assigns one or more **actors** as agents of an **authority**. An assignment warrant may be constrained to a particular scope owned by the authority, and/or may be limited in time, but it cannot restrict or assign *privileges*. An assignment warrant may concurrently delegate to multiple actors, and require that any documents issued on behalf of the authority must be ratified by some combination of the assigned actors.

## Justification

All documents with the exception of **establishment warrants** should reference one or more *other* documents for justification. At the very least, every document must reference an **attribution warrant** for each signing party.
 
# Identity theft

Both actors and authorities are identified by their keys. In real world situations, keys will be lost or stolen. ikkono makes available both protections and remedies to address this.

## Prevention

### Multi-factor and notarized authentication



### Attribution to warrant, not to key

A critical design feature is that attribution references must cite an **attribution warrant**, **NOT** a public key. It is not possible to say "the person who owns key X signed this document". Instead, all documents must say, "a person with custody of key X signed this document *per the attributions described in warrant A*". Warrant A may include provisions that require, for example, that any signatures be notarized by a third party, with which the key owner has established independent means of authentication.

### Freeform constraints

ikkono is an anarchic protocol. It does not limit what can be said, it merely states what must be said at a minimum to be understood, so that all interacting parties can understand each other.

For use in real legal or digital security contexts, ikkono documents can and ought to include either structured or natural language provisions limiting how public keys can be used, validated, revoked, or disowned.

## Revocation

### No **centralized** revocation
ikkono describes a completely open, decentralized architecture, and explicitly rejects the notion of centralized *revocation*.

There is in fact no reliable means of revoking widely distributed signed statements. Decades of attempts to do this with x.509 certificates have demonstrated the essential infeasibility of this. Both list-based (CRL) and service-based (OCSP) approaches are fraught with problems and implementation headaches, and mathematically cannot accomplish the goal of *canceling* an already issued certificate.

### Distributed revocation

Rejecting centralized revocation mechanisms does not prevent individual actors from requesting that specific consuming parties revoke a previously provided attribution warrant, or from requesting signed confirmation that the consuming party has received that revocation request.

This requires that actors keep track of whom they have provided attribution warrants to. This individual onus is the complement of the individual sovereignty that all ikkono actors enjoy. While the record keeping required to follow up on the consumers of attribution warrants may be tiresome for scattered individuals, this can be accomplished easily and reliably through the use or composition of notary, proxy, and/or key fiduciary services, which are described elsewhere.
 
# Access Control

The first purpose of ikkono is in fact to achieve truly distributed but cryptographically provable identity and access management (IAM). Canonical role-based models (RBAC) are fully supported, as are itemized access control lists (ACLs), as are a wide range of other models.

ikkono defines the ontology, documents, and transactions needed to describe and implement any and all of these security models.

## Summary

- **authorities** own **domains**
- **domains** contain the definitions of securable **resources**, as well as the **privileges**, **roles**, **groups**, **constraints**, or any other necessary concepts to describe who can do what
- **actors** are granted **passports** by **authorities** to enable the assigned actor to act within one or more **domains** owned by the **authority**
- When applied to software applications, a **domain** generally maps to a particular application, and a **passport** maps directly to the concept of a *user*.

### Protocol, not content
No access policy is meaningful without some agreement on the subjects and even verbs which may be composed into a coherent policy. Which things can be secured? What are the possible actions that one could take against those things?

These and related questions must have answers, but they necessarily cannot have universal answers. ikkono defines a small domain of entities and privileges required for all systems to mutually comprehend access policies, but specifics of any particular domain must be left to individual authorities.

Instead, ikkono provides an ontology, syntax, and protocol for any number of entities to describe their own resources, privileges, roles, and grants, and even to refer to concepts defined by other entities, without requiring any agreed-upon *lists*.
 
### Domains and Authorities

A primitive ikkono architecture concept is that only **authorities** can **own**. 

The resources referred to in any meaningful IAM system are certainly things that are **owned**, but so are the definitions or descriptions of the roles, groups, privileges, and other concepts used to describe who can access or act on those resources.

For the purposes of both IAM and wider process interoperability, ikkono declares a root container of both definition and ownership called a **domain**. Each domain is owned by one authority. Domains in turn contain both the definitions of the possible things that can be secured (entities and resources), and the descriptions of the roles, groups, and privileges used to secure them.

### Passports and Actors

Another primitive ikkono architecture concept is that only **actors** can **act**. Thus rights must in some way be granted *to* actors. The most basic level of granting is simply acknowledging that an entity, usually called a *user*, exists at all in some scope.

But ikkono actors are sovereign entities, independent of any authority. So conversely no authority has the ability to declare that an actor does or does not exist.

Instead, **passports** are the concept that ikkono declares to provide a bridge from a sovereign **actor** to the constraints and context of a particular domain, controlled in turn by a particular authority.

A passport is a link between one **actor** to act within one or more **domains**, granted by an agent of the owning **authority**, and reciprocally acknowledged by the actor.

All actual IAM rights are then granted to **passports**, never to **actors**. This provides both context and revocability. The ikkono document which issues a passport is not retractible, any more than the U.S. government can come fetch your passport if it wants it back. 

Instead, systems relying on the passport must validate with the issuing authority that the passport is still valid when actually *applying* an IAM rule. In practice the actor obtains a short-lived token from the issuing authority proving that their passport is current, and provides that token to the applicable relying system.

## Ontology

Below is a summary of the complete ontology

*NOTE: This section obsolete. Does not include updated division of domains and ledgers*

### domain

A container for definitions and resources owned by an authority.

### passport

A mutual warrant between an **authority** and an **actor** that declares that the actor may act in the context of one or more domains owned by the authority. A passport may reference just one domain, multiple specific domains, or may indicate that it is valid in any or all domains owned by the authority.

While a passport document may include an expiration, the document itself is not proof that an actor is *still* authorized to act in the applicable domains even if the expiration date is in the future. Consuming systems must always validate passports either proactively or by validating a short-lived token that references the passport.
 
### entity

An entity is simply the name of a kind of resource that can exist within a particular domain.

### resource

An individual instance of a securable object, identified by its **entity** name and some unique identifying data

### privilege

A semantic label that identifies a verb-subject pair, which has meaning within a specific **domain**. The primitive privilege is DO-THINGS, or ACT-on-THINGS.

### role

A semantic label for a collection of **privileges**. Roles belong to a **domain**, but may include privileges from other domains, including domains from other authorities.

Roles are *only* a list of privileges. They do not contain constraints, and do not reference a grantor or grantee. All these details are contained in **grants**.

### grant

A grant is a signed statement by a *grantor* to assign one or more **roles** and/or **privileges** to a **grantee**, and regarding a **resource**.

The grantor must be the passport of an actor who is provably authorized to issue the grant. The grantee must be a passport or group.

All elements of a grant may be defined in a different domain or even under a different authority. The validity of the grant, regardless of the domains in which its elements are defined, is completely provable through its chain of documents.

## group

A group is a semantically named collection of actors