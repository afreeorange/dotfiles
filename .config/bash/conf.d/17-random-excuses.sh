#!/bin/bash

# Some fun. Faster to prebuild array, but meh...
function random_excuse() {
    local IFS="
"
    EXCUSE_LIST=(\
    "Actually, that's a feature." \
    "Are you sure you don't have a problem with your internet connection?" \
    "Are you sure you want it to work that way?" \
    "Are you sure you've installed the latest patches to your browser?" \
    "Are you sure you've installed the latest patches to your operating system?" \
    "But we're a startup so what do you expect?" \
    "But we're a small team so what do you expect?" \
    "But we're underresourced so what do you expect?" \
    "Everyone was sick." \
    "Everything looks fine on my end." \
    "Have you cleared your cache?" \
    "Have you tried refreshing your browser?" \
    "Have you updated your browser?" \
    "Have you updated your OS?" \
    "I couldn't find any library that can do that." \
    "I found a bug in the Framework." \
    "I couldn't reproduce that error." \
    "I did a quick fix for that already, it must have been reverted." \
    "I did a quick fix last time but it broke when we rebooted." \
    "I didn't anticipate that I would make any errors." \
    "I didn't create that part of the program." \
    "I didn't write that part of the system." \
    "I don't remember that in the original specification." \
    "I don't see anything in my error logs." \
    "I forgot my computer." \
    "I forgot to commit the code that fixes that." \
    "I had too many projects so I had to rush that feature." \
    "I have too many other high priority things to do right now." \
    "I haven't been able to reproduce that." \
    "I haven't had a chance to run that code yet." \
    "I haven't had any experience with that before." \
    "I haven't pushed the fix up yet." \
    "I haven't touched that code in weeks." \
    "I just need one more day to work on that." \
    "I must have been stress testing our production server." \
    "I never received a ticket for that." \
    "I thought I'd finished that." \
    "I thought that was signed off?" \
    "I thought you signed off on that." \
    "I told you yesterday it would be done by the end of today." \
    "I usually get a notification when that happens." \
    "I was busy fixing more important issues." \
    "I was sick." \
    "I was sure that had been fixed." \
    "I wasn't told how to do that so I had to guess which way the clients wanted it." \
    "I'll have to fix that at a later date." \
    "I'm not familiar with it so I didn't fix it in case I made it worse." \
    "I'm pretty sure that works most of the time." \
    "I'm pretty sure that's the way it is meant to work." \
    "I'm still working on that part of the codebase." \
    "I'm still working on that." \
    "I'm sure that was written by a contractor." \
    "I'm sure that was written by a freelancer." \
    "I've never seen that happen before!" \
    "Is that not supposed to happen?" \
    "It can't be broken because all the unittests pass." \
    "It has always worked before." \
    "It has never done that before." \
    "It is an intermittent error, just hit refresh." \
    "It is unlikely to happen again." \
    "It must be a browser cache error." \
    "It must be a hardware problem." \
    "It must be a timezone issue." \
    "It must be a unicode issue." \
    "It must be a virus on your system." \
    "It must be an issue with the corporate firewall." \
    "It must be missing some dependencies." \
    "It probably won't happen again." \
    "It was only a small change so I didn't think it needed tests." \
    "It was probably a race condition." \
    "It was working in my head." \
    "It worked before." \
    "It works in my dev environment." \
    "It works perfectly on my machine." \
    "It works, but it's not been tested." \
    "It's a browser issue" \
    "It's a compatibility issue." \
    "It's always been like that." \
    "It's always worked that way." \
    "It's just a warning, not an error." \
    "It's most likely a forwarding proxy server that is caching the response." \
    "It must be the corporate proxy." \
    "It's never done that before." \
    "It's never shown unexpected behavior like this before." \
    "It's not a bug, it's a feature." \
    "It's not like I can't write that fix in like 5 minutes." \
    "No, I didn't get any email from you about that." \
    "Nothing has changed in the code." \
    "Oh, that was just a temporary fix." \
    "Oh, that was only supposed to be a placeholder." \
    "Oh, you said you DIDN'T want that to happen?" \
    "Our code quality is up to industry standards." \
    "PEBKAC." \
    "Someone must have changed my code." \
    "That code was written by the last dev." \
    "That code wasn't meant to be in production." \
    "That error means it was successful." \
    "That feature is a nice-to-have." \
    "That feature is low priority." \
    "That feature is on our roadmap." \
    "That feature is outside of the project scope." \
    "That feature is slated for Phase II." \
    "That feature isn't due in this phase." \
    "That feature would be outside the currently defined scope." \
    "That has always worked that way." \
    "That is how we were asked to build it." \
    "That is part of the old system." \
    "That isn't part of my job description." \
    "That issue was filed under a different release version." \
    "That output is only wrong 99% of the time." \
    "That output is only wrong half the time." \
    "That software should have been updated ages ago." \
    "That was like that before I started here." \
    "That was literally a one in a million error." \
    "That wasn't in the original specification." \
    "That works at least 80% of the time." \
    "That wouldn't be economically feasible." \
    "That's a character encoding issue." \
    "That's a data model issue." \
    "That's a feature." \
    "That's a hardware issue." \
    "That's a known bug with the framework." \
    "That's a known bug with the programming language implementation." \
    "That's a problem with a third party application." \
    "That's a support issue." \
    "That's a training issue." \
    "That's a UI problem." \
    "That's a user issue." \
    "That's a UX problem." \
    "That's a vendor issue," \
    "That's already fixed. It just hasn't taken effect yet." \
    "That's an architecture issue." \
    "That's an industry best practice.." \
    "That's an issue with our legacy software." \
    "That's an issue with our legacy system." \
    "That's been fixed on another branch." \
    "That's been fixed, but the code is yet to be released." \
    "That's just temporary and we're still working on it." \
    "That's not a scalable solution." \
    "That's still a work in progress." \
    "The 3rd party API must be down." \
    "The behaviour is in the original specification." \
    "The browser must have dropped some packets." \
    "The client application must have dropped some packets." \
    "The client requested an XML response, but JSON would've solved the issue." \
    "The client requested that change." \
    "The contractor that worked here for a month? Yeah, she wrote that." \
    "The design makes it difficult to build this correctly." \
    "The dev that worked here for a month? Yeah, he wrote that." \
    "The developer who coded that doesn't work here anymore." \
    "The documentation for that feature is wrong." \
    "The error means it has processed correctly." \
    "The existing design makes it difficult to do the right thing." \
    "The failovers must have failed." \
    "The file must have been corrupted." \
    "The fix for that is in progress." \
    "The issue tracker was updated and some issues were lost." \
    "The program was never meant to work that way." \
    "The specification contained conflicting requirements." \
    "The specification was ambiguous." \
    "The stakeholder was sick." \
    "The tests didn't cover that edge case." \
    "The WYSIWYG editor must have added that." \
    "There must be a problem with the virtual machine." \
    "There must be something strange with your data." \
    "There must have been a miscommunication during the requirements phase." \
    "There must have been a problem with the request." \
    "There's only a one in a million chance of that error occurring." \
    "This is the first time anyone has mentioned it." \
    "This wasn't filed in the issue tracker." \
    "We broke that deliberately to test it." \
    "We contracted that work out months ago." \
    "We didn't have the budget to build it properly." \
    "We didn't have time to QA that feature." \
    "We don't have the bandwidth to address that at the moment." \
    "We don't have the budget to address that at the moment." \
    "We have to do it that way for security reasons." \
    "We must have been stress testing the server." \
    "We outsourced that part." \
    "We were never asked to make it do that." \
    "We weren't given enough time to write unittests." \
    "We've not been able to reproduce the problem." \
    "We've not received any error notifications." \
    "Well, at least it displays a very pretty error." \
    "Well, I've never seen that before." \
    "Well, that's a first." \
    "What did you do wrong to make it crash?" \
    "What did you type in wrong to get it to crash?" \
    "Where were you when the program blew up?" \
    "Why do they want it that way?" \
    "You might need more end-user training." \
    "You must be looking at the wrong version." \
    "You must be running the wrong version." \
    "You must have done something wrong." \
    "You sure you didn't get my email about that?" \
    "You're doing it wrong." \
    "Your browser must be caching the old version." \
    "Your email regarding that issue must have hit my spam filter." \
    "Your internet connection mustn't be working." \
    )
    EXCUSE=${EXCUSE_LIST[(( $RANDOM % ${#EXCUSE_LIST[@]} ))]}
    IFS=""

    # Check if a question
    if [[ "${EXCUSE:$((${#EXCUSE}-1)):1}" == "?" ]]; then
        EXPRESSION="🤔"
    else
        EXPRESSION="🤷"
    fi
    echo \""$EXCUSE"\" - "$EXPRESSION"
}
