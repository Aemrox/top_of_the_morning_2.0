#Site Creation

  Site.create(name: "Reddit", url: "www.reddit.com", channel_url: "https://www.reddit.com/r/", validates: true)
  Site.create(name: "Product Hunt", url: "www.producthunt.com", channel_url: "https://www.producthunt.com/", validates: true)
  Site.create(name: "Hacker News", url: "www.hackernews.com", channel_url: "N/A")
  Site.create(name: "Stack Overflow", url: "www.stackoverflow.com", channel_url: "http://stackoverflow.com/questions/tagged/", validates: true)

#Basic Channels
  front_page = Channel.create(name: "Reddit - Front Page", basic: true)
  front_page.site=Site.find_by(name:"Reddit")
  front_page.save
  hacker_top = Channel.create(name: "Hacker News", basic: true)
  hacker_top.site=Site.find_by(name:"Hacker News")
  hacker_top.save
  product_tech = Channel.create(name: "Product Hunt - Tech", basic: true)
  product_tech.site=Site.find_by(name:"Product Hunt")
  product_tech.save
  stack_ruby = Channel.create(name: "Stack Overflow - Ruby", basic: true)
  stack_ruby.site=Site.find_by(name:"Stack Overflow")
  stack_ruby.save

#non-basic channel for testing
  r_funny = Channel.create(name:"Funny")
  r_funny.site=Site.find_by(name:"Reddit")
  r_funny.save

#Super User
  User.create(username: "Megadam", password: "superman")
