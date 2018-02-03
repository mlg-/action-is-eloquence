# Autocompleter

This Autocomplete library can return the most likely desired full word results for any two-letter fragment against any provided text file, limited to 25 results, in descending order of likelihood to be correct.

## Usage

1. Require everything in `lib` in your ruby REPL session or ruby file. Something like this might do the trick:  
 ```
 Dir["#{ENV["PWD"]}/lib/*.rb"].each { |file| require_relative file }
 ```
2. Initialize a new instance of the autocompleter as in this example:  
```
@autocompleter = Autocompleter.new(fragment: "th", file_paths: ["spec/support/shakespeare-complete.txt"], result_format: "pretty")
```
This part takes the longest as it indexes all provided text, but subsequent queries can be made on the object in memory (see step 4).
The Autocompleter accepts three required keyword arguments:
- `fragment`, which is to be a two character word fragment string for which to find most likely completions.
- `file_paths`, which can be an array of any number of valid file paths relative to their place in the current working directory. Any invalid path will result in an error. The longer and bigger the files, the longer the indexing time on first run.
- `result_format`, which accepts a string to determine what format to return the results. To get a hash with the top 25 (or fewer) most likely results, use "hash." All other values will return a string representation of your results, formatted for readability.
3. Call `results` on your instance of `autocomplete` to see your results in the desired format:
```
autocomplete.results
```
4. To get additional result sets without re-indexing all content from scratch, use `search_again_for(fragment: fragment)` on your `autocomplete` instance, like so:  
```
autocomplete.search_again_for(fragment: "se")
```

## Sample Results
Here are some sample results using the full text of Shakespeare provided in spec/support/shakespeare-complete.txt`, taken from Project Gutenburg. (Please note that license frontmatter may slightly skew results for this and similar files).

### "th"
There are 26 results for the fragment 'th':  
'the' appears 27826 times  
'that' appears 11540 times  
'with' appears 8059 times  
'this' appears 6898 times  
'thou' appears 5544 times  
'thy' appears 4033 times  
'thee' appears 3181 times  
'they' appears 2532 times  
'then' appears 2222 times  
'there' appears 2206 times  
'their' appears 2079 times  
'them' appears 1980 times  
'hath' appears 1941 times  
'than' appears 1884 times  
'these' appears 1326 times  
'th' appears 1177 times  
'father' appears 1075 times  
'think' appears 1073 times  
'doth' appears 940 times  
'death' appears 900 times  
'thus' appears 782 times  
'other' appears 719 times  
'both' appears 645 times  
'brother' appears 642 times  
'nothing' appears 636 times  
'though' appears 631 times  

### "fr"
There are 26 results for the fragment 'fr':  
'from' appears 2669 times  
'france' appears 528 times  
'friends' appears 473 times  
'friend' appears 445 times  
'french' appears 225 times  
'free' appears 193 times  
'friar' appears 186 times  
'fresh' appears 89 times  
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
'frenchmen' appears 18 times  
'frail' appears 18 times  

### "pi"
There are 26 results for the fragment 'pi':  
'copies' appears 453 times  
'spirit' appears 265 times  
'pity' appears 221 times  
'pistol' appears 187 times  
'spirits' appears 128 times  
'pisanio' appears 104 times  
'piece' appears 87 times  
'opinion' appears 84 times  
'lepidus' appears 70 times  
'spite' appears 59 times  
'weeping' appears 59 times  
'cupid' appears 58 times  
'happiness' appears 57 times  
'despite' appears 53 times  
'sleeping' appears 49 times  
'pinch' appears 44 times  
'picture' appears 43 times  
'capitol' appears 43 times  
'pick' appears 37 times  
'pieces' appears 37 times  
'pitch' appears 36 times  
'jupiter' appears 36 times  
'suspicion' appears 32 times  
'pitiful' appears 31 times  
'happily' appears 29 times  
'rapier' appears 29 times  

### "sh"
There are 26 results for the fragment 'sh':  
'shall' appears 3601 times  
'she' appears 2409 times  
'should' appears 1579 times  
'show' appears 492 times  
'shame' appears 307 times  
'shalt' appears 295 times  
'shakespeare' appears 272 times  
'shallow' appears 258 times  
'wish' appears 252 times  
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
'shows' appears 102 times  
'shake' appears 101 times  
'foolish' appears 96 times  
'fresh' appears 89 times  
'shape' appears 87 times  
'shadow' appears 81 times  

### "wu"
There are 3 results for the fragment 'wu':  
'swum' appears 2 times  
'swung' appears 1 time  
'wul' appears 1 time  

### "ar"
"There are 26 results for the fragment 'ar':  
'are' appears 3874 times  
'heart' appears 1059 times  
'art' appears 916 times  
'hear' appears 883 times  
'fear' appears 675 times  
'caesar' appears 605 times  
'bear' appears 551 times  
'richard' appears 520 times  
'part' appears 514 times  
'dear' appears 459 times  
'warwick' appears 424 times  
'edward' appears 373 times  
'marry' appears 365 times  
'farewell' appears 353 times  
'heard' appears 348 times  
'earth' appears 317 times  
'pardon' appears 309 times  
'far' appears 286 times  
'tears' appears 284 times  
'shakespeare' appears 272 times  
'war' appears 270 times  
'near' appears 269 times  
'swear' appears 264 times  
'mark' appears 252 times  
'arms' appears 249 times  
'charges' appears 238 times  

### "il"
There are 26 results for the fragment 'il':  
'will' appears 5011 times  
'till' appears 619 times  
'still' appears 563 times  
'william' appears 352 times  
'kill' appears 322 times  
'wilt' appears 307 times  
'ill' appears 278 times  
'troilus' appears 251 times  
'villain' appears 250 times  
'while' appears 246 times  
'child' appears 241 times  
'devil' appears 237 times  
'illinois' appears 222 times  
'achilles' appears 167 times  
'emilia' appears 149 times  
'silvia' appears 132 times  
'camillo' appears 126 times  
'children' appears 122 times  
'vile' appears 117 times  
'whilst' appears 115 times  
'silence' appears 112 times  
'awhile' appears 102 times  
'fill' appears 95 times  
'wild' appears 90 times  
'whiles' appears 79 times  
'smile' appears 77 times  

This result is a good example of how the license text in the example file skews results, as "illinois" appears over 200 times in a license snippet used between most plays/text file segments. Files may need to be cleaned or edited with other scripts before being run through the Autocompleter.

### "ne"
There are 26 results for the fragment 'ne':  
'one' appears 1799 times  
'mine' appears 1166 times  
'never' appears 1020 times  
'scene' appears 798 times  
'done' appears 663 times  
'none' appears 468 times  
'gone' appears 464 times  
'thine' appears 457 times  
'fortune' appears 362 times  
'news' appears 316 times  
'honest' appears 288 times  
'new' appears 272 times  
'near' appears 269 times  
'alone' appears 237 times  
'business' appears 234 times  
'valentine' appears 233 times  
'ne' appears 226 times  
'machine' appears 224 times  
'benedictine' appears 222 times  
'general' appears 215 times  
'berowne' appears 197 times  
'menenius' appears 196 times  
'money' appears 190 times  
'highness' appears 189 times  
'need' appears 185 times  
'neither' appears 185 times  

### "se"
There are 26 results for the fragment 'se':  
'see' appears 1462 times  
'these' appears 1326 times  
'whose' appears 615 times  
'second' appears 574 times  
'myself' appears 567 times  
'use' appears 560 times  
'those' appears 547 times  
'house' appears 545 times  
'set' appears 473 times  
'himself' appears 452 times  
'service' appears 444 times  
'servant' appears 427 times  
'else' appears 417 times  
'please' appears 394 times  
'cause' appears 339 times  
'messenger' appears 300 times  
'false' appears 296 times  
'yourself' appears 280 times  
'seen' appears 268 times  
'sent' appears 268 times  
'send' appears 260 times  
'sea' appears 246 times  
'present' appears 246 times  
'used' appears 245 times  
'itself' appears 240 times  
'syracuse' appears 238 times  

### "pl"
There are 26 results for the fragment 'pl':  
'place' appears 432 times  
'please' appears 394 times  
'play' appears 353 times  
'complete' appears 248 times  
'people' appears 223 times  
'pleasure' appears 180 times  
'pluck' appears 138 times  
'plain' appears 123 times  
'simple' appears 113 times  
'plague' appears 94 times  
'plantagenet' appears 77 times  
'pleas' appears 69 times  
'plot' appears 53 times  
'plead' appears 48 times  
'employ' appears 48 times  
'haply' appears 45 times  
'displeasure' appears 41 times  
'complexion' appears 40 times  
'places' appears 38 times  
'plays' appears 35 times  
'pleasures' appears 35 times  
'players' appears 35 times  
'pleasant' appears 35 times  
'naples' appears 33 times  
'example' appears 32 times  
'temple' appears 29 times  



