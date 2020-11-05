*****
Usage
*****
libfscore relies on a context based implementation to manage both card sets and 
card. This allows for multiple different "collections" to exists and be 
exchanged. The creation of data is however bound to the information available 
to the component responsible for the creation.

All data is not direktly bound to a component: A card set can be 
given to any context, and any card can be given to any card set. This allows 
for instances where, for example, a context with the current and last set 
exists. A card set loaded by the context for the current set can be handed to 
the context for the last set and so on. The same is also true for cards and 
card sets.

The basic operation with library data is as follows:

* Create a context.
* Request a card set from a context.
* Request a card from a card set.
* Return the card, either completed or incomplete.
* Once all cards have been completed, return the card set to the context.

Context
-------
A library context stores and manages all card set entries as well as the last 
used card set. A context creates a set from the available set entries and 
hands it off to the library user. The completed set can then be handed back to 
the context for reuse.

A context can only store one loaded set for reuse at a time. Handing another 
set to the context causes the previously stored set to be deallocated.

Card Sets
---------
Card sets store the list of cards as well as an instance of the loader class 
used to load cards. Cards themselves are created by either loading them from 
disk or returning them from cache in case of the card being loaded already.
The card set loads cards by using threads. You will have to hand information 
regarding your card destination setup to the set loader when requesting a card.

When returning a card, flag it as either completed or incomplete. Card sets 
manage the state of the set, meaning how many cards are left over to be 
completed.

Always return car sets to a context, never deallocate the set yourself! A set 
can be reused for a new set request.

Cards
-----
As soon as a card is valid (loaded), it can be used with the FSC_Card header 
functions. Please keep in mind that all strings returned should not be 
deallocated by the library user.

Always return cards to the card set, never deallocate them! Cards will be 
reused by the card set.