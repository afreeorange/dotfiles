function random_commit_message
    set -l messages \
        "??! what the ..." \
        "[skip ci] I'll fix the build monday" \
        "A fix I believe, not like I tested or anything" \
        "A full commitment's what I'm thinking of" \
        "A long time ago, in a galaxy far far away..." \
        "A tale of Dragons, Heroes and Legends..." \
        "ALL SORTS OF THINGS" \
        "Abandon all hope, ye who enter here." \
        "Actual final build before release" \
        "Add Sandbox" \
        "Added a banner to the default admin page. Please have mercy on me =(" \
        "Added another dependency" \
        "Added missing file in previous commit" \
        "Added some NullPointerExceptions - Happy easter, you bastards! :D" \
        "Added translation." \
        "All your codebase are belong to us." \
        "And a commit that I don't know the reason of..." \
        "And if you ask me how I'm feeling" \
        "Another bug bites the dust" \
        "Another commit to keep my CAN streak going." \
        "Apparently works-for-me is a crappy excuse." \
        "Argh! About to give up :(" \
        "Arrrrgggg" \
        "At times like this I wish I was a Garbage Man." \
        "Batman! (this commit has no parents)" \
        "Become a programmer, they said. It'll be fun, they said." \
        "Best commit ever" \
        "Bit Bucket is down. What should I do now?" \
        "Blaming regex." \
        "By works, I meant 'doesnt work'.  Works now.." \
        "COMMIT ALL THE FILES!" \
        "Can someone review this commit, please ?" \
        "Check next commit for message." \
        "Chuck Norris Emailed Me This Patch... I'm Not Going To Question It" \
        "Code was clean until manager requested to fuck it up" \
        "Commit committed" \
        "Commit committed...." \
        "Committed some changes" \
        "Committing fixes in the dark, seriously, who killed my power!?" \
        "Committing in accordance with the prophecy."

    echo $messages[(random 1 (count $messages))]
end

function random_excuse
    set -l excuses \
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
        "I'm not sure if this is related, but..." \
        "It must be a hardware problem." \
        "It was working in dev." \
        "It worked yesterday." \
        "It works on my machine." \
        "It would take too long to rewrite the code from scratch." \
        "It's a known bug with the programming language." \
        "It's an undocumented feature." \
        "It's just some unlucky coincidence." \
        "It's never done that before." \
        "It's not a bug, it's a feature." \
        "Maybe the user doesn't understand what they're asking for." \
        "My code was working fine when I left yesterday." \
        "My code wasn't reviewed properly." \
        "Nobody else has that issue." \
        "Oh, that was just a temporary fix." \
        "QA really should have caught that." \
        "Somebody must have changed my code." \
        "That code was written by the last guy." \
        "That feature is outside the original scope." \
        "That was literally impossible to predict." \
        "That's a third-party bug." \
        "That's already been fixed." \
        "That's just temporary and we're still working on it." \
        "That's really a browser problem." \
        "That's weird, it's never done that before." \
        "The client must be using an old browser." \
        "The code worked perfectly every time I tested it." \
        "The specifications were ambiguous." \
        "The third party API must be down." \
        "There must be a problem with the API documentation." \
        "There must be a problem with the server." \
        "There must be something wrong with your data." \
        "There's a bug in the compiler." \
        "This code was marked as low priority in the sprint." \
        "We didn't anticipate anyone doing that." \
        "We should probably just rewrite it in [language]." \
        "You didn't specify which browser you were using." \
        "You must have done something wrong." \
        "You should be able to fix that with a restart." \
        "You should have asked for a code review." \
        "Your development environment is probably wrong." \
        "Your test environment must be different from mine."

    echo $excuses[(random 1 (count $excuses))]
end
