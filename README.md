Typo3 XMLRPC Client
===================

Typo3 XMLRPC Client to be used with Typo3 4.5 LTS and [Webservices for TYPO3 extension](http://typo3.org/extensions/repository/view/typo3_webservice) by Helut Hummel

```ruby
client = Typo3_XMLRPC_Client::Client.new(:host => "172.16.130.137", :path => "/rpc", :username => "admin", :password => "admin")

obj = client.execute("record.get", "tt_content", 1)
obj = client.execute("record.index", 1, "pages")
obj = client.execute("record.index")
```

Method 'execute' takes params based on Webservices for TYPO3 extension documentation
