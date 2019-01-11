---
layout: post
title: "The NoSQL Database Every Software Developer Uses"
date: 2018-01-01
categories: programming coders nosql sql databases
---

!["Test"](https://cdn-images-1.medium.com/max/2600/0*vjLOAZszHK6CJoPu)

<figure>
<figcaption class="imageCaption">Photo by <a href="https://unsplash.com/@fanhungry?utm_source=medium&amp;utm_medium=referral" data-href="https://unsplash.com/@fanhungry?utm_source=medium&amp;utm_medium=referral" class="markup--anchor markup--figure-anchor" rel="photo-creator nofollow noopener" target="_blank">Dương Trần Quốc</a> on&nbsp;<a href="https://unsplash.com?utm_source=medium&amp;utm_medium=referral" data-href="https://unsplash.com?utm_source=medium&amp;utm_medium=referral" class="markup--anchor markup--figure-anchor" rel="photo-source nofollow noopener" target="_blank">Unsplash</a></figcaption>

</figure>

One of the greatest ironies of software development is that programmers use plain text files for their most valuable assets, the code; whereas they would rarely use that for storing the data of their products.

Almost every programmer, even the most adamant ones who would never think of using anything other than a relational database for storing data, use a NoSQL database when they are developing software: the file system. And the file system is messy and unstructured.

Almost every programmer, even the most adamant ones who would never think of using an untyped or dynamically typed language uses untyped things called "files" for storing their code. What is the type of your files? All your files have the following type: String!

<img class="progressiveMedia-image js-progressiveMedia-image" data-src="https://cdn-images-1.medium.com/max/1600/0*MwHGy69nfg2LvRhC" src="https://cdn-images-1.medium.com/max/1600/0*MwHGy69nfg2LvRhC">
<figcaption class="imageCaption">Photo by <a href="https://unsplash.com/@steve_j?utm_source=medium&amp;utm_medium=referral" data-href="https://unsplash.com/@steve_j?utm_source=medium&amp;utm_medium=referral" class="markup--anchor markup--figure-anchor" rel="photo-creator nofollow noopener" target="_blank">Steve Johnson</a> on&nbsp;<a href="https://unsplash.com?utm_source=medium&amp;utm_medium=referral" data-href="https://unsplash.com?utm_source=medium&amp;utm_medium=referral" class="markup--anchor markup--figure-anchor" rel="photo-source nofollow noopener" target="_blank">Unsplash</a></figcaption>

All files have some metadata as well. File name is the most common metadata. A file's name is not inside the file. Neither its creation or access dates. And that's more or less what this database we store our code on, the file system provides. Could you do better? How about if every symbol in our code had some sort of metadata? Very few languages have this, and even the ones who has this builtin like Clojure rarely make use of it.

You might argue that Git is sort of a database for storing the code, and it is true to a certain extent. It stores the data after some transformation and optimization, and it stores older versions of the data, but that's pretty much about it. As metadata, it has "tags", but tags are metadata for commits, not specific files. As a database, Git lacks lots of functionality that ordinary, relational databases provide.

Think about all the code organization a software developer does: Moving files around, requiring a file from another file in the form of modules or types. Think about the querying we do for our codebase: Searching for a text instance, or getting the list of functions in our code base, or getting the dependent symbols for the current class or function. These are mostly done in a half-baked and on-demand manner. Want to get a list of functions: Let your IDE or language server parse your code, and present you the options, only for it to forget it after all. It is almost like the metadata is being regenerated all the time via the compiler.

Think about all the discussions about code organization: Should this file go into this folder, and that folder? You have one choice! You are making a "write" operation that strictly limits your "read" operations.

Whenever you double click a folder in your system, you are effectively doing a query for that table. Whenever you enter another folder in that folder, you are doing a subselect.

Do you want to store additional data about a specific file? Where do you put it? Inside comments within that file? Wouldn't it be better if you could put that data as a real metadata so that you could search for it?

Wouldn't we be better of if our code was stored in databases? I am not advocating just relational databases, but even a proper JSON-based NoSQL database might be better for some query operations.

Downsides of this suggested approach: You lose most of the functionality of Unix tools. In Unix, everything is a file and it is a good thought that has served its purpose and is holding us back at this point. Tools that can parse

Of course, none of this is new, and the reason I'm writing this article is nothing other than to spark some discussion around the subject. In further articles, I would like to expand on this topic and see what we can come up with. It seems like we have reached a local maxima that presents us from reaching greater heights.

Just imagine how better it would be if we had treated our code as we treated our data!

<img class="progressiveMedia-image js-progressiveMedia-image" data-src="https://cdn-images-1.medium.com/max/1600/0*lrhhjxximYI89WYh" src="https://cdn-images-1.medium.com/max/1600/0*lrhhjxximYI89WYh">
<figcaption class="imageCaption">Photo by <a href="https://unsplash.com/@christopher__burns?utm_source=medium&amp;utm_medium=referral" data-href="https://unsplash.com/@christopher__burns?utm_source=medium&amp;utm_medium=referral" class="markup--anchor markup--figure-anchor" rel="photo-creator nofollow noopener" target="_blank">Christopher Burns</a> on&nbsp;<a href="https://unsplash.com?utm_source=medium&amp;utm_medium=referral" data-href="https://unsplash.com?utm_source=medium&amp;utm_medium=referral" class="markup--anchor markup--figure-anchor" rel="photo-source nofollow noopener" target="_blank">Unsplash</a></figcaption>

Some useful pointers for further research:

- WinFS: Microsoft actually decided to tackle this once upon a time in the form of WinFS. There would be metadata for everything, but it was abandoned.
- Image based coding vs file based coding: Smalltalk and some Lisps have this. Didn't get main stream. See <http://wiki.c2.com/?ImageBasedLanguage>
- Datomic and Codeq: Clojure creator Rich Hickey and his company Cognitect's database is an immutable database that records every change. Hickey also experimented briefly with a side project called Codeq, that would parse your code, and add them to the db so that you could do queries like: Which functions did this commit change? In which commits this function was changed? See <https://www.datomic.com> and <http://blog.datomic.com/2012/10/codeq.html>
- SQLite as an application data format: Imagine storing your code inside SQLite so that you could query it? See <https://www.sqlite.org/appfileformat.html>

See also:

- The Image Dilemma <https://playingwithobjects.wordpress.com/2012/06/01/the-image-dilemma/>
- Which programming languages (besides Smalltalk) are image based? <https://stackoverflow.com/questions/722204/which-programming-languages-besides-smalltalk-are-image-based>
- Git as a NoSql database by Kenneth Truyers <https://www.kenneth-truyers.net/2016/10/13/git-nosql-database/>
- Content Addressable Storage: <http://www.wikiwand.com/en/Content-addressable_storage>
- The web of names, hashes and UUIDs by Erlang creator Joe Armstrong <https://joearms.github.io/published/2015-03-12-The_web_of_names.html>

This article originally appeared on Medium at <https://medium.com/@ustunozgur/the-nosql-database-every-software-developer-uses-10c841278a13>
