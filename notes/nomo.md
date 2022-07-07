# nomo

## In brief

### Primitives: `S`, `glyph`, `f`
Let S be a set of entities, which we will call *glyphs* in context, which has a matching function f which, for any pair of inputs where each input is selected from S, will deterministically return whether the two inputs are equal.

### String
A string over S is an ordered sequence of glyphs from S. 

Two strings are equal if and only if they have the same number `n` of glyphs, and for all ordinals i in the range 1 through n, the ith glyph from the first string is equal to the ith glyph from the second string, according to `f`.

### Name
A name over S is an ordered sequence of strings over S. We will call the strings within a name *segments*.

Two names are equal if and only if they have the same number `n` of segments, and for all ordinals i in the range 1 through n, the ith segment from the first name is equal to the ith segment from the second name, according to the definition above of a string over S.

### Schema

A schema 
- May define restrictions about which segments and names are valid, beyond the requirement that each glyph be from S
- Provides a two-way mapping from valid names to name-strings, which are representations of a name as a single string. The set of glyphs Sns for the name-string may be different than that set of glyphs Sn for the name.

Formally, a schema consists of four functions
- A function Vn which determines whether a name is valid
- A function Vs which determines whether a name-string is valid
- A function Format with defines an injective map from the domain of all valid names to a codomain of valid name-strings
- A function Parse which defines a surjective map from the codomain of valid name-strings back to the domain of valid names

Note:
- Many, perhaps infinite valid name-strings may map to a single valid name. For example, Parse may specify that all leading or trailing "white space" is removed from a valid name-string, so each valid name has an infinite number of name-strings with different amounts of padding. 
- Format is deterministic, and so will only produce one of the valid name-strings for any given name
- Round-trip stability of from name to name-string to name is guaranteed
- Round-trip stability of from name-string to name to name-string is not guaranteed

Formally:
- Format and Parse are both deterministic and complete
- Format is injective and distinct
- Parse is surjective
- `Parse(Format(n)) == n` is true for all n
- `Format(Parse(ns)) == ns` is true for exactly and only one ns for each n, and is not true for all other ns for that n



## Mathematical foundations

### Equality comparer
The first foundation of a naming system is an axiomatic function which is defined over some domain that can determine whether two input items from that domain are different or the same. The domain constitutes all the distinct values that the function can deterministically discern. In other words, the function is the commutative equality operator as defined for all entities within the function's domain.

The comparer function is axiomatic, even tautological, because it defines for itself what constitutes sameness. It is not possible to define a separate criteria to judge whether the comparer function is deterministic or even correct. Any such separate criteria would itself constitute a comparer function, subject to the same judgement of another comparer function ad infinitum. 

In short, the comparer function is deterministic because it says that it is. 

#### **Example**

Let f be a comparer function. Also, let:

- f(1,3) = false
- f(1,3) = true
- f(1,2) = false
- f(2,1) = true

We can superficially state that the provided relations are wrong, or contradictory, or that the function is not actually a comparer because it is non-deterministic and non-commutative. 

But this is actually saying that we have a *different* function Z which recognizes a set of "integers", and according to Z:
- "1", "2", and "3" are all in Z's domain
- "1" is the same as "1"
- "1" is not the same as "2"
- "1" is not the same as "3"

The presenter of f can counter that f is correctly and deterministically responding to some attribute or nature of the input arguments that, naturally, we cannot discern because we are using a different comparer function (Z). It is not logically possible to prove or insist that f's claim is false on its own merits.

f simply states that according to its own internal logic, 
- All of the inputs provided were in its domain (and thus yielded definite true or false results) 
- The first pair of inputs which we discern via Z as (1,3) were not the same per f's logic
- The second pair of inputs which we discern via Z as (1,3) were the same per f's logic
- The third pair of inputs which we discern via Z as (1,2) were not the same per f's logic
- The fourth pair of inputs which we discern via Z as (1,2) were the same per f's logic

The most we can definitively say is that we do not comprehend f, and therefore f is not useful to us.

If however, f's presenter agrees that "1", "2", and "3" are the "same" items as defined by our Z, i.e. that f admits Z, then we can firmly state that f is "wrong", inconsistent, not well defined, or simply by definition is not a commutative equality operator over Z's domain.

#### Observability, declarativity
A reformulation of the above is that an independent observer cannot judge wether an f is consistent and well-defined, on the basis  


