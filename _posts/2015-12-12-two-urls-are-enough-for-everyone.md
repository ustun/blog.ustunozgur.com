---
layout: post
title:  "Two URLs are enough for everyone"
date:   2015-12-11 10:44
categories: web graphql react javascript programming
---

# or the death of web programming as we know it
How many entrance doors does your house have? Would you be willing to enter
your home from the windows? Can you enter the living room from the outside?
Your entrance door is the supernode of your house.

How many entrance web sites do you visit daily? Google, Facebook, Twitter,
Hacker News, Reddit? How many? Not that many. Usually these sites
take you to other places. These sites are the supernodes of the web.

How many entrance urls does your web application have? Many? How many? A few?
Two? One? Why is it that we have scattered our endpoints so much?

With the proliferation of single page applications, we had it coming, but
Facebook's GraphQL puts the final nail in the coffin for the web development
and URLs as we know them:

# Two URLs are enough for everyone.

Of course, I'm exaggarating a bit for the purposes of demonstration. What I
mean is, for most web applications to be built now and in the future, two
endpoints will suffice -- one for constructing the client page and one for the
API requests. Let me explain.

# Why do we need URLs?

Web was invented to share documents at Cern. It was mainly for human
consumption -- share links within each other. If a URL does not need to be
shared or bookmarked or crawled by search engines, it does not need to exist
beyong a simple endpoint.

Facebook's GraphQL achieves exactly that vision. It gives you a single
endpoint, from which you drill down to the resources you have. The resources
do not have unique endpoints, rather you ask the endpoint what resource and
what fields of that resource you are interested in.

# It is functions all the way down

We as programmers are accustomed to programming languages with
functions. These functions are so powerful that they can accept multiple
arguments! That might seem like a trivial statement, but think about how we
call functions on our servers from the client side.

We effectively send a string to a url which is another string: The server
receives two strings: the path and the query params (or post body as
string). The first string is parsed to get the function to call and some
parameters to be passed to that. The second string is parsed to get the
additional parameters to be passed to that function. Ugh. The poor application
tries hard enough to understand what our query is.

Why do we need that? We have been accustomed to getting JSON responses from the server. Isn't it time to stop sending strings to the server and start sending a structured data format? GraphQL achives exactly that.

Take this example from jsonapi.org: `/articles?include=author&fields[articles]=title,body&fields[people]=name`
Jsonapi in theory does not say how you should build your urls, but this is the recommended approach.

What are we trying to achieve here? How would you explain this to a
nontechnical person? You would literally expect him to parse this breathless
sentence, with weird delimiters.

As programmers, sometimes we get so accustomed to tradition that we do not
question the strangeness of our solutions. Sending strings might been a good
way in the 1990s or even 2000s, but do we really need to torture ourselves and
the server to communicate the following request?

I want to get articles. For each article, include the related author too and
their name. For the article itself, send me the title and body.

How would you express it if you had come up with a way on your own? Think
about it for a minute before proceeding.

This is what GraphQL, a query language for the web proposes:

{% highlight js %}

    query {
       articles
       {
          title
          body
          author {
            name
          }
       }
    }
{% endhighlight %}

Beautiful and simple. This is not some clever trick. In my opinion, this is
what should have been all the time.

And what is this `articles` thing on server side? It is just a function or an
object with a resolve method!  It resolves the articles, and for each article,
you need to define additional resolve methods for the fields, namely title,
body and author. And note that author is another object, not a field on the
article, so that in turn has a resolve method for its name property. You can
go as deep as you'd like!

And what if I want to send parameters to my resource? Simple: keyword
arguments, supported one way or another in any language. If your function can
accept an object that is essentially a bag of arguments, that is called to get
that object.

{% highlight js %}
    query {
       article(id: 1)
       {
          title
          body
          author {
            name
          }
       }
    }
{% endhighlight %}


What is `article` here? It is simply a function that somehow accepts that `id`
parameter. There is nothing magical about id, it is just the name of the
keyword argument the `article` resolve method accepts.

Now here is the other great thing: Remember we constructed our query by
specifying what we want. The search gives us exactly that: What we want, in
the format we want it.

{% highlight js %}
{
"title": "URLs must die",
"body": "Is GraphQL the killer?"
"author": {
      "name": "Ustun Ozgur"
}
}
{% endhighlight %}

# Conclusion

So, back to my original point: Two endpoints is good enough for most people
for web application programming. You might actually have more than 2 "URLs"
per se, but those do not need to be concerning the server other than simple
redirection of the response. The URLs itself are not redirected, you just
return the same response that generates your HTML from these human visible
URLs. You can do the routing on the clientside, the client side router simply
determines the parameters to be passed to the GraphQL endpoint.

On the server side, you have two functions: One for generating the initial
HTML that bootstraps your application. If you want to have the following URLS,
/, /home/, /account/, /questions/ , provided that you need them bookmarked and
shared, simply return what your single endpoint for generating your HTML
returns. For everything else, there is GraphQL.


If you want to learn about GraphQL, watch this talk by one of its creators Lee Byron: [Video](http://oredev.org/2015/sessions/introduction-to-graphql)


Cannot wait to dive in? You can play with it and the StarWars API at
[GraphQL server for StarWars API](http://bit.ly/1Qa4h00)

Just hit Ctrl-Space and you are on your own. Oh, had I mentioned that GraphQL
has a schema with types, so it can help you build correct queries with full
documentation on the fly? Click docs at the right there, but you probably
don't need it because of intellisense.

Your backend is written in Python: Check out this very convenient
implementation called [Graphene](http://graphene-python.org/playground/)

Two years ago at DjangoCon Europe, I gave a talk on how React would kill the
template layer of Django. It is much more powerful and the war scene nowadays
is client side. You cannot enter this war with crippled templating solutions,
you need the full power of a good language. At the time, the url routing layer
of Django and similar solutions seemed safe.

The tides have changed there too. Now, you need just two endpoints: One for
serving the initial HTML, one for the API endpoints. This is the essence of
web programming in the future: Two endpoints to rule them all.


*Discuss at [HackerNews](https://news.ycombinator.com/item?id=10722265)*
