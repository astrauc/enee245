# This lab looks unfortunate #

I think that it is not too bad. There are some weird cases that we may need to be aware of. I cannot tell if they want us to account for cases like fp infinity or NaN. If we do not have to, then this will not be so bad. 

One thing that is confusing still to me is the rounding; I am not sure how to do that with verilog code yet. 

*** Please read all of sections 12.1 through 12.5 before our ponder session ***

I have added the display family of things and empty files. In case you wanted to get started or make your own version of the code, branch off from main to avoid merge conflicts.
>```sh
> git checkout -b <YOUR_NAME>_lab12
> ```
>[!NOTE]
> The -b flag creates a new branch, so this command is equivalent to running "git branch <branch_name>" then "git checkout <branch_name>"

Then once you have committed your changes:
>```sh
> git push --set-upstream origin <branch_name>
>```

>[!IMPORTANT]
> Since last weeks lab display worked, we will be using a display feature similar to last week, so do not change display.v or any of its submodules.
> They work fine. The one we will update is display_fpadd.v