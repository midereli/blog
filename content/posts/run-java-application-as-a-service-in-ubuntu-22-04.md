---
title: "Run Java Application as a Service in Ubuntu 22.04"
date: 2022-09-01T10:00:03+00:00
# weight: 1
# aliases: ["/first"]
tags: ["Java", "Ubuntu"]
author: "Merih İnal Dereli"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: false
#description: "Desc Text."
canonicalURL: "https://canonical.url/to/page"
disableHLJS: true # to disable highlightjs
disableShare: false
disableHLJS: false
hideSummary: false
searchHidden: true
ShowReadingTime: true
ShowBreadCrumbs: true
ShowPostNavLinks: true
ShowWordCount: true
ShowRssButtonInSectionTermList: true
UseHugoToc: true
cover:
    image: "<image path/url>" # image path/url
    alt: "<alt text>" # alt text
    caption: "<text>" # display caption under cover
    relative: false # when using page bundles set this to true
    hidden: true # only hide on current single page
editPost:
    URL: "https://github.com/midereli/blog/tree/main/content"
    Text: "Improve this page" # edit text
    appendFilePath: true # to append file path to Edit link
---
When development is done, you can package your Java application in an easily distributable JAR file. Ready your JAR file and you start the application with the `java` command. Provide the name of the package with the `-jar` argument.

```Shell
java -jar HelloWorld.jar
```

![HelloWorld from localhost](/HelloWorld-from-localhost.png 'HelloWorld from localhost')

This way of running your java application is totally fine for simple tasks like testing your application on your local machine. But, it's not a suitable method for running the application for long time periods and/or on a controlled environment like a server.

ℹ️ You should consider running the application as a service in Ubuntu if you need to:

* Keep running the application after you close the terminal window
* Keep running the application after the current user logs-off
* Run the application with a specific user (other than the one that you logged-in)
* Enable application auto-start after system reboot
* Enable application auto-start after other specific services (like networking, etc.)

## Running Java Application as a Service

Running the Java application as a service is a fairly simple task. First, let's create the service file.

```Shell
sudo systemctl edit --force --full helloworld-java-app.service
```

### A quick note:

You will find service files either in `/usr/lib/systemd/system/` or `/lib/systemd/system/` or `/etc/systemd/system/` paths. :bell: The first two contains services managed by the operating system and is subject to change after an upgrade of the OS.

✅ `/etc/systemd/system/` is more suitable for user created system files. They will not be altered after an OS upgrade. You should always be placing your system files in this location.

Now, let's move on.

Let's fill in the service file and save it.

```Shell
[Unit]
Description=Simple Java application service created for demonstration purposes

[Service]
Type=simple
User=ubuntu
ExecStart=java -jar /opt/myapp/HelloWorld.jar

[Install]
WantedBy=default.target
```

Now you can start your service with *systemctl*. 🎉

```Shell
systemctl start helloworld-java-app
```

![HelloWorld from Ubuntu](/HelloWorld-from-Ubuntu.png 'HelloWorld from Ubuntu')