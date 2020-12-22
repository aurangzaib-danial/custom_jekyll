Custom jekyll -> Ruby command line gem

Problem
Generating jekyll site with jekyll new, creates a site that is intended for blogging and the minimal flag gives us just bare bones. What I want is a site structure generated that can be used for different static websites and not only jekyll.

Solution
Custom jekyll is a gem that will generate files that I require to start any kind of static website and not a blog. It is much more better to use jekyll directy if you want to generate a blog.

## Most important features
1. custom-jekyll new website-name
2. initialize a git repository inside the folder
3. generates all the required files
4. Runs bundle install and also display gem output. 

TODO
- [x] Set set_template according to your need.
- [x] Run automated commands like bundle install, initialize git repository
- [x] edit config to include site_name
- [x] fix readme and gem description
