SkeleStore
=====
Check to see if we should buy the current SkelItem.


Installation
----------------
Run this command in the graphical CLI:
<pre>
git checkout https://github.com/linzinha/skelestore.git
</pre>

Checks
----------------
**If you have it:** This script checks not only if you have the item, but also if you have its derived skill or derived familiar. It does NOT check if you have all of the crate or warehouse key items
**If you can afford it:** Compares knucklebones on hand to the cost of the item
**If the cost of knucklebones is a good price:** This takes the range of knucklebones the item might cost, and tells you if it's a good/fair/bad price depending on if it is in the lower/middle/top third of the range
**If it is untradeable:** Or the current going rate per meat in the mall

If you do not have the item and it is a good price, it will ask you if you want to purchase it. If you say yes it will automatically purchase the item.
