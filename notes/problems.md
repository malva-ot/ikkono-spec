# Problems

Issues I'm encountering, things I need to solve.

2021-07-05

## HTTP template

As I try to work out example sequences of ikkono documents, I'm finding a few conundrums with using the basic HTTP-style syntax provisionally specified by diffstream.

### **One part verb**

Many of the statements I want to make are a sequence of several keywords. They really resemble SQL, rather than an HTTP verb against a single "resources". For example:

```
GRANT [privilege] ON [resource] TO [principal]
  WHERE [constraints]
  HAVING [filters]
```

Trying to cram this in an HTTP verb just looks ugly. 

```
GRANT-PRIVILEGE urn:------- IKKONO/1
```

Should the urn refer to the principal or the resource? Do the rest of the parts then go in headers?

I think this suggests that rich ontology of ikkono just doesn't fit will with the intentionally simplistic structure of high-level document exchange in the manner of HTTP / MIME / diffstream.


### **Verbosity of headers**

The header syntax as reiterated most recently in [**[RFC 7230]**](https://datatracker.ietf.org/doc/html/rfc7230) tends to be verbose, which provides rich context-free semantics, but requires more characters.

As an example, imagine defining unambiguous headers to specify the properties of an Ed25519 signing key. Perhaps it would look like this?

```
CREATE [key-uri] IKKONO/1
Signature-Key-Algorithm: ed25519
ECC-Parameter-X: 0HSkOpAdA0aUoAV49AUx8g==
```

Or, following more closely to the JOSE standards:

```
PUBLISH /keys/2025-01-ed25519-A IKKONO/1
Object-Type: ikkono[1.23]:octet-key-pair
#Curve: ed25519
#X;b64: 0HSkOpAdA0aUoAV49AUx8g==
#Use: signature
```

The second example indicates that using the `diffstream` semantics of `Object-Type` and then inlined local properties defined in headers gives a good balance of readability and clarity. 

### **Stick with classic diffstream as the container protocol**

The solution I'm leaning towards is to then stick with `diffstream` itself as the *container protocol*, and move the semantics of ikkono statements into the payload of a diffstream statement, just as if diffstream was carrying a SQL statement (or any other payload). 

The **danger** in this is that parsing an ikkono statement then requires different algorithms than diffstream itself. diffstream, like HTTP, JSON, or XML aims to require as little context as possible to validate, serialize, and deserialize the syntax, whereas SQL is a highly context-dependent language where the symbols have almost no intrinsic syntactic structure. 

Standards like `JOSE / JW[T/K/S/...]` try to find a compromise by using the minimal-context syntax of JSON and then defining schemas to validate and constrain the contents. 

I'm hard-rejecting JSON as the first encoding format for ikkono because it's so hard for people to read and write, even if it's very easy for machines.

In all this, I keep coming back to a incompatible mix of desires for *something* like:

- **diffstream**
  - The basic command, headers, payload syntax is both easy for people to read-write AND easy for machines to parse
  - Minor syntactic additions like #, !, $, etc allow diffstream to further express structure, basic typing, etc, while maintaining the overall format

- **sql**
  - It seems every statement I try to write "in ikkono" comes out as a SQL statement. Many of the concepts map directly to the same kinds of operations as DDL, just with a slightly different set of objects
  
- **yml**
  - When I try to hew to diffstream, I find myself wanting to indent like in yml to express nested structures

### **Nesting**

Given the above thoughts, it seems the only real problem remaining with using native diffstream syntax is with nested elements. We'll try some more examples and see if/when it actually arises.


### **Purpose of stream vs statement**

Another problem I'm wrestling with is the use, or lack thereof, of the stream (repo) concept in diffstream. diffstream is intended to be able to define a DAG of content in the same manner as `git`. When working on a deliberation, having the whole context is part of the value. In ikkono, though, individual exchanges intentionally *don't* care about the whole content. All they need is the shortest complete tree from the next incremental statement back to its complete set of trust origins.

A stream identifier does provide a namespace within which to search for the applicable commit, though. It answers the question of which pile of documents one could find the particular document referenced.

In an actual exchange between two nodes, the location of the source pile of a given document is relevant to only one of the parties:

- The **asserting node**, which posits an IAM assertion, is responsible for being able to produce all documents in the chain required to prove its assertion
- The **consuming node** therefor **doesn't** care about the thread/stream/repo identifier of any of the documents. It just asks the asserting node for any documents that it doesn't yet have.
- The **asserting** node **does** care about the thread/stream/repo identifier because it is useful for internally locating any documents requested by the consuming node.

**In short**: The repo id is useful for **indexing**, even if it is not relevant to **proofs** per se.