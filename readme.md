# Autocompleter

This Autocomplete library can return the most likely desired full word results for any two-letter fragment against any provided text file, limited to 25 results, in descending order of likelihood to be correct.

## Usage

1. Require `autocompleter.rb`
 ```
 load "lib/autocompleter.rb"
 ```
2. Initialize a new instance of the autocompleter as in this example:  
```
autocompleter = Autocompleter.new(fragment: "th", file_paths: ["spec/support/shakespeare-complete.txt"], result_format: "pretty")
```
This part takes the longest as it indexes all provided text, but subsequent queries can be made on the object in memory (see step 4).
The Autocompleter accepts three required keyword arguments:
- `fragment`, which is to be a two character word fragment string for which to find most likely completions.
- `file_paths`, which can be an array of any number of valid file paths relative to their place in the current working directory. Any invalid path will result in an error. The longer and bigger the files, the longer the indexing time on first run.
- `result_format`, which accepts a string to determine what format to return the results. To get a hash with the top 25 (or fewer) most likely results, use "hash." All other values will return a string representation of your results, formatted for readability.
3. Call `results` on your instance of `autocomplete` to see your results in the desired format:
```
autocompleter.results
```
4. To get additional result sets without re-indexing all content from scratch, re-set the `autocompleter` instance's fragment, then run the results again:
```
autocompleter.fragment = "se"
autocompleter.results
```

## Sample Results
Here are some sample results using the full text of Shakespeare provided in spec/support/shakespeare-complete.txt`, taken from Project Gutenburg. (Please note that license frontmatter may slightly skew results for this and similar files).

### "th"
There are 25 results for the fragment 'th':    
'the' appears 27843 times  
'that' appears 11563 times  
'with' appears 8066 times  
'this' appears 6900 times  
'thou' appears 5549 times  
'thy' appears 4034 times  
'thee' appears 3181 times  
'they' appears 2534 times  
'then' appears 2223 times  
'there' appears 2212 times  
'their' appears 2079 times  
'them' appears 1980 times  
'hath' appears 1942 times  
'than' appears 1885 times  
'these' appears 1327 times  
'th' appears 1178 times  
'father' appears 1076 times  
'think' appears 1074 times  
'doth' appears 940 times  
'death' appears 900 times  
'thus' appears 782 times  
'other' appears 724 times  
'both' appears 646 times  
'brother' appears 645 times  
'nothing' appears 636 times  

### "fr"
There are 25 results for the fragment 'fr':  
'from' appears 2670 times  
'france' appears 528 times  
'friends' appears 474 times  
'friend' appears 446 times  
'french' appears 225 times  
'free' appears 195 times  
'friar' appears 186 times  
'fresh' appears 90 times  
'freely' appears 59 times  
'frown' appears 52 times  
'francis' appears 51 times  
'frame' appears 46 times  
'friendship' appears 43 times  
'afraid' appears 41 times  
'fruit' appears 37 times  
'friendly' appears 36 times  
'frederick' appears 35 times  
'freedom' appears 33 times  
'fright' appears 32 times  
'froth' appears 26 times  
'front' appears 23 times  
'frenchman' appears 22 times  
'fran' appears 22 times  
'frowns' appears 19 times  
'fray' appears 18 times  

### "pi"
There are 25 results for the fragment 'pi':  
'copies' appears 453 times  
'spirit' appears 265 times  
'pity' appears 221 times  
'pistol' appears 187 times  
'spirits' appears 128 times  
'pisanio' appears 104 times  
'piece' appears 90 times  
'opinion' appears 84 times  
'lepidus' appears 70 times  
'weeping' appears 60 times  
'spite' appears 59 times  
'cupid' appears 58 times  
'happiness' appears 57 times  
'despite' appears 53 times  
'sleeping' appears 51 times  
'pinch' appears 44 times  
'picture' appears 43 times  
'capitol' appears 43 times  
'pieces' appears 39 times  
'pick' appears 38 times  
'pitch' appears 36 times  
'jupiter' appears 36 times  
'suspicion' appears 32 times  
'pitiful' appears 31 times  
'rapier' appears 29 times  

### "sh"
There are 25 results for the fragment 'sh':  
'shall' appears 3602 times  
'she' appears 2410 times  
'should' appears 1580 times  
'show' appears 493 times  
'shame' appears 307 times  
'shalt' appears 295 times  
'shakespeare' appears 272 times  
'shallow' appears 258 times  
'wish' appears 253 times  
'membership' appears 221 times  
'english' appears 167 times  
'flesh' appears 138 times  
'flourish' appears 137 times  
'banish' appears 127 times  
'shepherd' appears 126 times  
'lordship' appears 124 times  
'fashion' appears 112 times  
'shylock' appears 110 times  
'short' appears 106 times  
'worship' appears 104 times  
'shows' appears 103 times  
'shake' appears 102 times  
'foolish' appears 97 times  
'fresh' appears 90 times  
'shape' appears 87 times  

### "wu"
There are 3 results for the fragment 'wu':  
'swum' appears 2 times  
'swung' appears 1 time  
'wul' appears 1 time  

### "ar"
There are 25 results for the fragment 'ar':  
'are' appears 3917 times  
'heart' appears 1061 times  
'art' appears 936 times  
'hear' appears 884 times  
'fear' appears 676 times  
'caesar' appears 608 times  
'bear' appears 553 times  
'richard' appears 520 times  
'part' appears 514 times  
'dear' appears 459 times  
'warwick' appears 424 times  
'edward' appears 373 times  
'marry' appears 366 times  
'farewell' appears 353 times  
'heard' appears 349 times  
'earth' appears 317 times  
'pardon' appears 310 times  
'far' appears 286 times  
'tears' appears 284 times  
'war' appears 272 times  
'shakespeare' appears 272 times  
'near' appears 269 times  
'swear' appears 265 times  
'arms' appears 258 times  
'mark' appears 258 times  

### "il"
There are 25 results for the fragment 'il':  
'will' appears 5017 times  
'till' appears 619 times  
'still' appears 564 times  
'william' appears 354 times  
'kill' appears 322 times  
'wilt' appears 307 times  
'ill' appears 279 times  
'villain' appears 253 times  
'troilus' appears 251 times  
'while' appears 248 times  
'child' appears 242 times  
'devil' appears 239 times  
'illinois' appears 222 times  
'achilles' appears 167 times  
'emilia' appears 149 times  
'silvia' appears 132 times  
'camillo' appears 126 times  
'children' appears 123 times  
'vile' appears 117 times  
'whilst' appears 115 times  
'silence' appears 112 times  
'awhile' appears 102 times  
'fill' appears 96 times  
'wild' appears 91 times  
'whiles' appears 79 times  

This result is a good example of how the license text in the example file skews results, as "illinois" appears over 200 times in a license snippet used between most plays/text file segments. Files may need to be cleaned or edited with other scripts before being run through the Autocompleter.

### "ne"
There are 25 results for the fragment 'ne':  
'one' appears 1809 times  
'mine' appears 1170 times  
'never' appears 1020 times  
'scene' appears 799 times  
'done' appears 663 times  
'none' appears 469 times  
'gone' appears 466 times  
'thine' appears 457 times  
'fortune' appears 362 times  
'news' appears 318 times  
'honest' appears 289 times  
'new' appears 276 times  
'near' appears 269 times  
'alone' appears 238 times  
'business' appears 234 times  
'valentine' appears 233 times  
'ne' appears 226 times  
'machine' appears 224 times  
'benedictine' appears 222 times  
'general' appears 218 times  
'berowne' appears 197 times  
'menenius' appears 196 times  
'money' appears 190 times  
'highness' appears 189 times  
'neither' appears 186 times  

### "se"
There are 25 results for the fragment 'se':  
'see' appears 1463 times  
'these' appears 1327 times  
'whose' appears 618 times  
'second' appears 574 times  
'house' appears 569 times  
'myself' appears 567 times  
'use' appears 562 times  
'those' appears 547 times  
'set' appears 474 times  
'himself' appears 452 times  
'service' appears 445 times  
'servant' appears 429 times  
'else' appears 417 times  
'please' appears 395 times  
'cause' appears 340 times  
'messenger' appears 300 times  
'false' appears 299 times  
'yourself' appears 280 times  
'sent' appears 268 times  
'seen' appears 268 times  
'send' appears 262 times  
'sea' appears 247 times  
'used' appears 246 times  
'present' appears 246 times  
'horse' appears 243 times  

### "pl"
There are 25 results for the fragment 'pl':  
'place' appears 458 times  
'please' appears 395 times  
'play' appears 356 times  
'complete' appears 248 times  
'people' appears 223 times  
'pleasure' appears 180 times  
'pluck' appears 139 times  
'plain' appears 123 times  
'simple' appears 117 times  
'plague' appears 94 times  
'plantagenet' appears 77 times  
'pleas' appears 69 times  
'plot' appears 54 times  
'employ' appears 49 times  
'plead' appears 48 times  
'haply' appears 45 times  
'displeasure' appears 41 times  
'complexion' appears 40 times  
'places' appears 39 times  
'pleasant' appears 35 times  
'plays' appears 35 times  
'players' appears 35 times  
'pleasures' appears 35 times  
'naples' appears 33 times  
'example' appears 33 times  