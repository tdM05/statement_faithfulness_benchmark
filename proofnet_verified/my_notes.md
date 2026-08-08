# This documents failures and potential fixes

### lean brackets not as intended
- Example of this error is item 036
- The bad one expands not as intended since brackets are not correct. 
**fix**
Rather than get llm to judge the raw lean files, give it the FULLY BRACKETED version.

### Mathlib misuse
- Example of this is item 57. 
- The issue is sometimes a thing looks like the correct thing, be we really need to unravel to tell if faithful if we use mathlib. So a simple thing, just unravel it. 
- Note that classes can always be unravelled into predicates, (maybe don't need to do that) but the point is, this should be easy fix.

