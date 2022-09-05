---
title: "Example SLIs and SLOs"
date: 2022-08-10T10:00:03+00:00
# weight: 1
# aliases: ["/first"]
tags: ["SRE"]
author: "Merih İnal Dereli"
# author: ["Me", "You"] # multiple authors
showToc: true
TocOpen: false
draft: false
hidemeta: false
comments: true
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
When implementing SRE principles in an organization, we must firstly define SLIs (service level indicators) and SLOs (service level objectives).

Service level indicators (SLIs) are measurable, quantitative aspects of a service. Some basic examples include:

* Error rates
* Latency
* Availability
* Throughput

Service level objectives (SLOs) are a target value for a service that are measured by defined SLIs. Some basic examples include:

* %99 of HTTP 200 requests are below 200 ms
* percentage of HTTP 500s < %0.1
* number of daily tickets < 5
* paging events per shift < 2

After defining SLIs and SLOs now comes the SLAs. A service level agreement (SLA) is a commitment between a service provider and a client.